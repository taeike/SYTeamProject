package dao;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import model.MemberDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisMemberDBBean extends MybatisConnector{

   private final String namespace="ldg.mybatis";
   private static MybatisMemberDBBean instance = new MybatisMemberDBBean();
   private SqlSession sqlSession;

   public static MybatisMemberDBBean getInstance(){
      return instance;
   }

   public int confirmId(String email) throws Exception{
      sqlSession = sqlSession();
      System.out.println("confirmId:"+email);
      int x=-1;
      try {
         HashMap map = new HashMap();
         map.put("email",email);

         String dbid = sqlSession.selectOne(namespace + ".confirmId",map);
         if (dbid != null)
            x=1;
         else
            x=-1;
      }finally{
         sqlSession.close();
      }
      return x;

   }

   public void insertMember(MemberDataBean member) throws Exception{
      sqlSession = sqlSession();
      
      try {

         sqlSession.insert(namespace + ".insertMember",member);
      }finally{
         sqlSession.commit();
         sqlSession.close();
      }


   }

   public int userCheck(String email, String password)throws Exception{
      sqlSession = sqlSession();
      String dbpasswd="";
      int x = -1;

      try {
         HashMap map = new HashMap();
         map.put("email",email);
         

         dbpasswd = sqlSession.selectOne(namespace + ".userCheck",map);
         if(dbpasswd != null){
            if(dbpasswd.equals(password))
               x=1;
            else
               x=0;
         }else
            x=-1;
      }finally{
         sqlSession.close();
      }
      return x;

   }
   
   public int updateMember(MemberDataBean member)throws Exception{
      sqlSession = sqlSession();
      HashMap map = new HashMap();
      map.put("email", member.getEmail());
      
      int x=-1;
      try{
         String dbid = (String) sqlSession.selectOne(namespace + ".update_id", map);
         if(dbid.equals(member.getEmail())){
            x = sqlSession.update(namespace + ".updateMember", member);
         }
      }finally{
         sqlSession.commit();
         sqlSession.close();
      }
      return x;
   }
    
   public int deleteMember(String email, String password)throws Exception{
      sqlSession = sqlSession();
      HashMap map = new HashMap();
      map.put("email", email);
      
      int x=-1;
      try{
         String dbpasswd = (String)sqlSession.selectOne(namespace + ".delete_id" ,map);
         if(dbpasswd.equals(password)){
            x = sqlSession.delete(namespace + ".deleteMember", map);
         }
      }finally{
         sqlSession.commit();
         sqlSession.close();
      }
      return x;
   }
   
   public String emailFind(String name, String pnumber) throws Exception{
      sqlSession = sqlSession();

      String dbemail = "";
      try {
         HashMap map = new HashMap();
         map.put("name",name);
         map.put("pnumber",pnumber);

         dbemail = sqlSession.selectOne(namespace + ".emailFind",map);
      }finally{
         sqlSession.close();
      }
      return dbemail;
      
      
   }
   
   public String passwordFind(String email, String name, String pnumber) throws Exception{
      sqlSession = sqlSession();
      
      String dbpassword = "";
      try{
         HashMap map = new HashMap();
         map.put("email", email);
         map.put("name", name);
         map.put("pnumber", pnumber);
         
         dbpassword = sqlSession.selectOne(namespace + ".passwordFind",map);
      }finally{
         sqlSession.close();
      }
      
      return dbpassword;
   }
   
   public String userCheckName(String email, String password) throws Exception{
      sqlSession = sqlSession();
      
      String name="";
      String dbname="";

      try {
         HashMap map = new HashMap();
         map.put("email",email);
         map.put("password",password);
         

         dbname = sqlSession.selectOne(namespace + ".userCheckName",map);
         if(name != null)
            name=dbname;
         
      }finally{
         sqlSession.close();
      }
      return name;

      
   }
}