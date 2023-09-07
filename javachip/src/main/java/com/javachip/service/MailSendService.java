package com.javachip.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	// 인증용 메일 
			@Autowired
			private JavaMailSenderImpl mailSender;
			int userPw;
			
			// 인증용 난수
			public void makeRandomNumber()
			{
				Random r = new Random();
				int tempPw = r.nextInt(88888888) + 11111111;
				System.out.println("임시 비밀번호="+tempPw);
				userPw = tempPw;
			}
			
			public String joinmail(String uId_email) {
				makeRandomNumber();
				
				System.out.println("MailSendService="+uId_email);
				System.out.println("MailSendService="+userPw);
				String setFrom = "javachio@naver.com";  // email-config에 설정한 자신의 이메일 주소를 입력 
				String toMail = uId_email;
				String title = "[JavaChip] 임시 비밀번호 발급";
				String content = "안녕하세요. JavaChip입니다." + 	//html 형식으로 작성 ! 
		                "<br><br>" + 
					    "회원님의 임시 비밀번호는 <span style='font-weight:bold'>" + userPw + "</span> 입니다." + 
					    "<br><br>" + 
					    "로그인 후 마이페이지에서 비밀번호를 변경해주세요."; //이메일 내용 삽입
				mailSend(setFrom, toMail, title, content);
				return Integer.toString(userPw);
			}
			//이메일 전송 메소드 
			public void mailSend(String setFrom, String toMail, String title, String content) { 
				MimeMessage message = mailSender.createMimeMessage();
				// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
				try {
					MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
					helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
					helper.setText(content,true);
					mailSender.send(message);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}
}
