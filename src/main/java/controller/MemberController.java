package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.MemberDataBean;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import dao.MybatisMemberDBBean;



@Controller
public class MemberController {
   private Logger logger = Logger.getLogger(MemberController.class);
   ModelAndView mv=new ModelAndView();

   @Autowired
   MybatisMemberDBBean dbPro;
   @Autowired 
   SessionLocaleResolver localeResolver; 
   @Autowired 
   MessageSource messageSource; 




   @RequestMapping(value="joinForm")
   public ModelAndView joinForm(){
      logger.info("init joinForm()..");
      mv.clear();
      mv.setViewName("member/joinForm");
      return mv;
   }

   @RequestMapping(value="confirmId")
   public ModelAndView confirmId(String email) throws Exception{
      logger.info("init confirmId()..");
      int check = dbPro.confirmId(email);

      mv.clear();
      mv.addObject("check", check);
      mv.addObject("email", email);
      mv.setViewName("member/confirmId");

      return mv;
   }

   @RequestMapping(value="joinPro")
   public ModelAndView joinPro(MemberDataBean article) throws Exception{
      logger.info("init joinPro()..");

      dbPro.insertMember(article);
      mv.setViewName("member/joinPro");

      return mv;
   }

   @RequestMapping(value="loginForm")
   public ModelAndView loginForm(){
      logger.info("init joinPro()..");

      mv.clear();
      mv.setViewName("member/loginForm");


      return mv;

   }

   @RequestMapping(value="loginPro")
   public ModelAndView loginPro(String email, String password, HttpServletRequest request) throws Exception{




      int check = dbPro.userCheck(email, password);
      //      String name = dbPro.userCheckName(email,password);

      if(check == 1){
         HttpSession session = request.getSession();
         session.setAttribute("email", email);
      }

      mv.clear();
      mv.addObject("check", check);
      mv.setViewName("member/loginPro");

      return mv;


   }

   @RequestMapping(value="emailFindForm")
   public ModelAndView emailFindForm(){

      mv.clear();
      mv.setViewName("member/emailFindForm");

      return mv;

   }

   @RequestMapping(value="emailFindPro")
   public ModelAndView emailFindPro(String name, String pnumber) throws Exception{

      String dbEmail = dbPro.emailFind(name,pnumber);

      mv.clear();
      mv.addObject("dbEmail", dbEmail);

      mv.setViewName("member/emailFindPro");

      return mv;

   }

   @RequestMapping(value="passwordFindForm")
   public ModelAndView passwordFindForm(){

      mv.clear();
      mv.setViewName("member/passwordFindForm");

      return mv;

   }
   @RequestMapping(value="passwordFindPro")
   public ModelAndView passwordFindPro(String email, String name, String pnumber) throws Exception{

      String dbPassword = dbPro.passwordFind(email,name,pnumber);

      mv.clear();
      mv.addObject("email", email);
      mv.addObject("dbPassword", dbPassword);


      mv.setViewName("member/passwordFindPro");

      return mv;

   }
   @RequestMapping(value="logout")
   public ModelAndView logout(HttpServletRequest request) throws Exception{


      mv.clear();
      HttpSession session = request.getSession();
      session.invalidate();
      mv.setViewName("main/main");

      return mv;

   }
}