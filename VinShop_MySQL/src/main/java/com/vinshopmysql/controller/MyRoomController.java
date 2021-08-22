package com.vinshopmysql.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vinshopmysql.model.Criteria;
import com.vinshopmysql.model.MemberVO;
import com.vinshopmysql.model.OrderDetailVO;
import com.vinshopmysql.model.OrderVO;
import com.vinshopmysql.model.PageDTO;
import com.vinshopmysql.model.RepOrderDTO;
import com.vinshopmysql.service.MyRoomService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myRoom")
public class MyRoomController {

	@Autowired
	private MyRoomService myroomservice;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
    private JavaMailSender mailSender;
	
	/* 마이룸 페이지 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void myRoomGET(HttpServletRequest request, Model model) throws Exception {
		log.info("마이룸 페이지 이동");
		
	}

	/* 비밀번호 수정 페이지 */
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void modifyGET() throws Exception{
		log.info("비밀번호 변경 실행");
	}
	
	/* 비밀번호 수정 */
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyPOST(String password, HttpServletRequest request) throws Exception {
		
		log.info("비밀번호 변경 실행");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memberId = member.getMemberId();

		String rawPw = "";	//DB에 저장된 인코딩 비밀번호
		String encodePw = "";	//새로 저장할 인코딩 된 새 비밀번호
		
		if(memberId != null) {	// 아이디 존재
			rawPw = member.getMemberPw();	//비밀번호 데이터 얻음
			encodePw = pwEncoder.encode(password);	//새 비밀번호 인코딩
			member.setMemberPw(encodePw); //인코딩 된 비밀번호 member객체에 다시 저장
			
			myroomservice.modifyPw(member);
		} 
		return "redirect:/member/logout.do";
	}
	
	
	@RequestMapping(value="/shipInfo", method=RequestMethod.GET)
	public String shipInfoGET(Criteria cri, HttpServletRequest request, Model model) throws Exception{
		log.info("shipInfoGET");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memberId = member.getMemberId();
		
		List<OrderVO> list = myroomservice.orderList(memberId);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info(list.get(0));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		int total = myroomservice.orderCount(memberId);
		System.out.println(total);
		PageDTO pageMake = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("memberId", memberId);
		
		return "/myRoom/shipInfo";
	}
	
	@RequestMapping(value="/repOrder", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<RepOrderDTO> repOrderGET(String orderId) throws Exception{
		System.out.println("orderId = " + orderId);
		int oId = Integer.parseInt(orderId);
		
		List<OrderDetailVO> list = myroomservice.selectDetail(oId);
		System.out.println(list);
		
		String vinName = list.get(0).getVinName();
		int amount = 0;
		int cnt = list.size();
		
		for(int i = 0; i < list.size();i++) {
			amount += list.get(i).getAmount();
			System.out.println("for amount : " + list.get(i).getAmount());
		}
		System.out.println("amount : " + amount);
		
		RepOrderDTO rep = new RepOrderDTO();
		rep.setVinName(vinName);
		rep.setCnt(cnt);
		rep.setAmount(amount);
		
		return new ResponseEntity<>(rep, HttpStatus.OK);
	}
	
	/* 회원 탈퇴 페이지 */
	@RequestMapping(value="/exit", method = RequestMethod.GET)
	public void exitGET() throws Exception {
		log.info("회원탈퇴 페이지 실행");
	}
		
	/* 회원 탈퇴 페이지 */
	@RequestMapping(value="/exit", method = RequestMethod.POST)
	public String exitPOST(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		String memberId = member.getMemberId();
		String memberMail = member.getMemberMail();
		
		List<OrderVO> list = myroomservice.orderList(memberId);
		
		if(list == null) {
			log.info("탈퇴 조건 만족");
			myroomservice.deleteId(vo);
			session.invalidate();
			SecurityContextHolder.clearContext();
			return "redirect:/main";
		} else {
			log.info("주문리스트 존재");
			rttr.addFlashAttribute("result", "removeFALSE");
			return "redirect:/myRoom/exit";
		}
		
	}
	
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        // 뷰(View)로부터 넘어온 데이터 확인
    	log.info("이메일 데이터 전송 확인");
    	log.info("인증번호 : " + email);
        
        // 인증번호(난수) 생성
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;		//111111 ~ 999999 범위
        log.info("인증번호 " + checkNum);
        
        // 이메일 보내기
        String setFrom = "pec6049@naver.com";			//root-context.xml에 삽입한 자신의 이메일 계정
        String toMail = email;							//수신받을 이메일
        String title = "회원가입 인증 이메일 입니다.";			//자신이 보낼 이메일 제목
        String content = 								//자신이 보낼 이메일 내용
                "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" 
        		+ "인증 번호는 " + checkNum + "입니다." + "<br>" 
                + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        //이메일 전송을 위한 코드
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
	/* 구매확정 버튼 */
	@RequestMapping(value="/shipClear", method=RequestMethod.POST)
	@ResponseBody
	public String shipClearPOST(String orderId) throws Exception{
		String result = "false";
		System.out.println("orderId : " + orderId);
		if(orderId != null) {
			myroomservice.shipClear(orderId);
			result = "true";
		}
		return result;
	}
	
}
