package com.poly.ass.service;
import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

import com.poly.ass.entity.MailInfo;
@Service
interface MailerService {
  void send(MailInfo mail) throws MessagingException;
  void send(String to,String subject, String body)  throws MessagingException;
  void queue(MailInfo mail);
  void queue(String to, String subject,String body);
  
}
