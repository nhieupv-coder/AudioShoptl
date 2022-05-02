package com.poly.ass.service;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;

import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.User;

import java.awt.*;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class UserService implements UserDetailsService {
    @Autowired(required = false)
    UserDAO userDao;
    @Autowired(required = false)
    PasswordEncoder encoder;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {

            User user = userDao.getById(username);
            String password = user.getPassword();
            String Role = user.getAdmin();
            if (!user.isActived()) {
                password = System.currentTimeMillis() + String.valueOf(Math.random());
            }
            return org.springframework.security.core.userdetails.User.withUsername(username)
                    .password(encoder.encode(password)).roles(Role).build();
        } catch (Exception e) {
            throw new UsernameNotFoundException(username + " Not found ");
        }
    }

    public void LoginFormOAuth2(OAuth2AuthenticationToken oauth2) {
        String email = oauth2.getPrincipal().getAttribute("email");
        if(email == null){
            email =  oauth2.getPrincipal().getAttribute("id");
        }

        String password = Long.toHexString(System.currentTimeMillis());
        UserDetails user = org.springframework.security.core.userdetails.User.withUsername(email).password(encoder.encode(password)).roles("USER").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        //
        User userDB = new User();
        if(email == null ){
            userDB.setId(oauth2.getPrincipal().getAttribute("id").toString());
        }else{
            userDB.setId(email);
        }
        if(!email.matches("[\\\\w]+@[\\\\w]+\\\\.[a-zA-Z]{2,3}")){
            email = "system"+(long)Math.ceil(Math.random()*100000/100)+"@gmail.com" ;
            System.out.println(email);
        }
        userDB.setEmail(email);
        userDB.setAdmin("USER");
        userDB.setActived(true);
        userDB.setGender(true);
        String name = oauth2.getPrincipal().getAttribute("given_name");
        if(name == null){
            name = oauth2.getPrincipal().getAttribute("name");
        }
        userDB.setName(name);
        userDB.setPhoto("default.png");
        userDB.setPhone("0112345678");
        userDB.setPassword(encoder.encode("fdf6d434gdd3gr4"));
        userDB.setAddress("No Fill");
        userDB.setBirthDay( new Date());
        if (!userDao.existsById(userDB.getId())) {
            userDao.save(userDB);
        }
    }
}
