package com.poly.ass.service;


import java.io.File;
import java.util.ArrayList;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;


import com.poly.ass.entity.MailInfo;

@Service
public class MailerServiceImpl implements MailerService {
	List<MailInfo> list = new ArrayList<>();
	@Autowired
	JavaMailSender mailSender;

	
	@Override
	public void send(MailInfo mail) throws MessagingException {
		// TODO Auto-generated method stub
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setSubject(mail.getSubject());
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setText(mail.getBody(), true);
		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}
		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		}
		String[] attachments = mail.getAttachments();
		if (attachments != null && attachments.length > 0) {
			for (String path : attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}
		mailSender.send(message);

	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInfo(to, subject, body));

	}

	@Override
	public void queue(MailInfo mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		this.queue(new MailInfo(to, subject, body));
	}

	@Scheduled(fixedDelay = 5000, initialDelay = 2000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				System.out.println(mail.getSubject());
				this.send(mail);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
