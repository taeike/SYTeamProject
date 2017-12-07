package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
public class StartController {
	private Logger logger = Logger.getLogger(MemberController.class);
	ModelAndView mv = new ModelAndView();
	@Autowired 
	SessionLocaleResolver localeResolver; 
	@Autowired 
	MessageSource messageSource; 
	
	public StartController() {
	}
	@RequestMapping(value = "startForm")
	public ModelAndView startForm(Locale locale, HttpServletRequest request, Model model) { 
		mv.setViewName("startForm/startForm");
		return mv; 
	}
	
	@RequestMapping(value = "main")
	public ModelAndView main(Locale locale, HttpServletRequest request, Model model) { 
		logger.info("init main().. locale = "+ locale );
		
		 
		String testValue1 = messageSource.getMessage("chart.country", null, "default text", locale);
		String testValue2 = messageSource.getMessage("chart.ExchangeRate", null, "default text", locale);
		String testValue3 = messageSource.getMessage("chart.Countrystandards", null, "default text", locale);
		String testValue4 = messageSource.getMessage("chart.KoreanStandards", null, "default text", locale);
		
		String lang = locale.toString();
		
	/***********************jsoup********************************/
		if(lang.equals("en") ){    
		 String url = "http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_USDKRW";
		 	
		   String line1 = "";
		   String line2 = "";
		   String line3 = "";
		   try {
		      Document doc;
		      doc = Jsoup.connect(url).get();
		      Elements media11 = doc.select(".h_company");
		      Elements media12 = doc.select(".flash_area");
		      Elements media13 = doc.select(".section_calculator");

		      for (Element src : media11) {

		         String templine = src.toString();

		         line1 += " " + templine + " ";

		      }
		      
		      for (Element src : media12) {

			         String templine = src.toString();

			         line2 += " " + templine + " ";

			      }
		      
		      for (Element src : media13) {

			         String templine = src.toString();

			         line3 += " " + templine + " ";

			      }
		   } catch (IOException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		   }

		   line1 = line1.replace("<span class=\"code2\">USDKRW</span>","");
		   line1 = line1.replace("<span class=\"blind\">ȯ��</span>", "");
		   line1 = line1.replace("<li class=\"tab_item on\"> <a>KEB �ϳ�����</a> </li>", "");
		   line1 = line1.replace("<li class=\"tab_item \"> <a href=\"/marketindex/exchangeDetail.nhn?marketindexCd=FX_USDKRW_SHB\">��������</a> </li>", ""); 
		   line1 = line1.replace("<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_USD.png\" width=\"19\" height=\"13\" alt=\"�����̹���\"> �̱�</h2>", 
				   				"<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_USD.png\" width=\"25\" height=\"19\" alt=\"�����̹���\">" + testValue1 + "</h2>");
		   line1 = line1.replace("<h2>","<h3>");
		   line1 = line1.replace("</h2>","</h3>");
		   line3 = line3.replace("class=\"tbl_calculator\"","class=\"w3-table w3-striped w3-bordered\"");
		   
		   line3 = line3.replace("<span>ȯ������ (�Ÿű����� ����)</span>", "<span><h5>" + testValue2 + "</h5></span>");
		   line3 = line3.replace("�̱� ȯ�� ����", "");
		   line3 = line3.replace("���ѹα� ȯ�� ����", "");
		   line3 = line3.replace("<h3 class=\"h_txt\">�̱� �޷� ����</h3>", "<h5 class=\"h_txt\">" + testValue3 + "</h5>");
		   line3 = line3.replace("<h3 class=\"h_txt2\">���ѹα� �� ����</h3>", "<h5 class=\"h_txt2\">" + testValue4 + "</h5>");
		
				   
				   
		   mv.addObject("line1", line1);
		   mv.addObject("line2", line2);
		   mv.addObject("line3", line3);
		}
		
		if(lang.equals("jp")){  
		 String url = "http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW";
		 	
		   String line1 = "";
		   String line2 = "";
		   String line3 = "";
		   try {
		      Document doc;
		      doc = Jsoup.connect(url).get();
		      Elements media11 = doc.select(".h_company");
		      Elements media12 = doc.select(".flash_area");
		      Elements media13 = doc.select(".section_calculator");

		      for (Element src : media11) {

		         String templine = src.toString();

		         line1 += " " + templine + " ";

		      }
		      
		      for (Element src : media12) {

			         String templine = src.toString();

			         line2 += " " + templine + " ";

			      }
		      
		      for (Element src : media13) {

			         String templine = src.toString();

			         line3 += " " + templine + " ";

			      }
		   } catch (IOException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		   }

		   line1 = line1.replace("<span class=\"code2\">JPYKRW</span>","");
		   line1 = line1.replace("<span class=\"blind\">ȯ��</span>", "");
		   line1 = line1.replace("<li class=\"tab_item on\"> <a>KEB �ϳ�����</a> </li>", "");
		   line1 = line1.replace("<li class=\"tab_item \"> <a href=\"/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW_SHB\">��������</a> </li>", ""); 
		   line1 = line1.replace("<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_JPY.png\" width=\"19\" height=\"13\" alt=\"�����̹���\"> �Ϻ�</h2>", 
				   				"<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_JPY.png\" width=\"25\" height=\"19\" alt=\"�����̹���\">" + testValue1 + "</h2>");
		   line1 = line1.replace("<h2>","<h3>");
		   line1 = line1.replace("</h2>","</h3>");
		   line3 = line3.replace("class=\"tbl_calculator\"","class=\"w3-table w3-striped w3-bordered\"");
		   
		   line3 = line3.replace("<span>ȯ������ (�Ÿű����� ����)</span>", "<span><h5>" + testValue2 + "</h5></span>");// ��ġ��
		   line3 = line3.replace("�Ϻ� ȯ�� ����", "");
		   line3 = line3.replace("���ѹα� ȯ�� ����", "");
		   line3 = line3.replace("<h3 class=\"h_txt\">�Ϻ� �� ����</h3>", "<h5 class=\"h_txt\">" + testValue3 + "</h5>");
		   line3 = line3.replace("<h3 class=\"h_txt2\">���ѹα� �� ����</h3>", "<h5 class=\"h_txt2\">" + testValue4 + "</h5>");
		
				   
				   
		   mv.addObject("line1", line1);
		   mv.addObject("line2", line2);
		   mv.addObject("line3", line3);
		}
		
		if(lang.equals("ch")){  
			 String url = "http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_CNYKRW";
			 	
			   String line1 = "";
			   String line2 = "";
			   String line3 = "";
			   try {
			      Document doc;
			      doc = Jsoup.connect(url).get();
			      Elements media11 = doc.select(".h_company");
			      Elements media12 = doc.select(".flash_area");
			      Elements media13 = doc.select(".section_calculator");

			      for (Element src : media11) {

			         String templine = src.toString();

			         line1 += " " + templine + " ";

			      }
			      
			      for (Element src : media12) {

				         String templine = src.toString();

				         line2 += " " + templine + " ";

				      }
			      
			      for (Element src : media13) {

				         String templine = src.toString();

				         line3 += " " + templine + " ";

				      }
			   } catch (IOException e) {
			      // TODO Auto-generated catch block
			      e.printStackTrace();
			   }

			   line1 = line1.replace("<span class=\"code2\">CNYKRW</span>","");
			   line1 = line1.replace("<span class=\"blind\">ȯ��</span>", "");
			   line1 = line1.replace("<li class=\"tab_item on\"> <a>KEB �ϳ�����</a> </li>", "");
			   line1 = line1.replace("<li class=\"tab_item \"> <a href=\"/marketindex/exchangeDetail.nhn?marketindexCd=FX_CNYKRW_SHB\">��������</a> </li>", ""); 
			   line1 = line1.replace("<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_CNY.png\" width=\"19\" height=\"13\" alt=\"�����̹���\"> �߱�</h2>", 
					   				"<h2><img src=\"http://imgfinance.naver.net/nfinance/flag/flag_CNY.png\" width=\"25\" height=\"19\" alt=\"�����̹���\">" + testValue1 + "</h2>");
			   line1 = line1.replace("<h2>","<h3>");
			   line1 = line1.replace("</h2>","</h3>");
			   line3 = line3.replace("class=\"tbl_calculator\"","class=\"w3-table w3-striped w3-bordered\"");
			   
			   line3 = line3.replace("<span>ȯ������ (�Ÿű����� ����)</span>", "<span><h5>" + testValue2 + "</h5></span>");
			   line3 = line3.replace("�߱� ȯ�� ����", "");
			   line3 = line3.replace("���ѹα� ȯ�� ����", "");
			   line3 = line3.replace("<h3 class=\"h_txt\">�߱� ���� ����</h3>", "<h5 class=\"h_txt\">" + testValue3 + "</h5>");
			   line3 = line3.replace("<h3 class=\"h_txt2\">���ѹα� �� ����</h3>", "<h5 class=\"h_txt2\">" + testValue4 + "</h5>");
					 
			   mv.addObject("line1", line1);
			   mv.addObject("line2", line2);
			   mv.addObject("line3", line3);
			}
		
		
	/***********************jsoup********************************/
		mv.addObject("na", messageSource.getMessage("sidebar.login", null, locale));
		mv.setViewName("head/main/main");
		return mv; 
	}
	
	
	
}
