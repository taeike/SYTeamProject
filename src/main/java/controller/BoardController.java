package controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.BoardDataBean;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisBoardDBBean;

@Controller
public class BoardController {
	private Logger logger = Logger.getLogger(MemberController.class);
	ModelAndView mv = new ModelAndView();
	String boardid = "1";
	String remoteId = "";
	int pageNum = 1;

	@Autowired
	MybatisBoardDBBean dbPro;

	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		logger.info("init addAttributes()..");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		remoteId = request.getRemoteAddr();
		String reqboardid = request.getParameter("boardid");
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			pageNum = 1;
		}
		if (reqboardid != null)
			session.setAttribute("boardid", reqboardid);

		if (session.getAttribute("boardid") == null)
			boardid = "1";
		else
			boardid = (String) session.getAttribute("boardid");
		
	}

	@RequestMapping(value = "list")
	public ModelAndView list() throws Exception {
		logger.info("init list()..");
		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		count = dbPro.getArticleCount(boardid);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, boardid);
		}
		number = count - (currentPage - 1) * pageSize;
		// ==================================page
		int bottomLine = 3;

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		mv.clear();

		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("pageCount", pageCount);
		mv.addObject("bottomLine", bottomLine);
		// ============================
		mv.addObject("count", count);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageSize", pageSize);
		mv.addObject("number", number);
		mv.addObject("articleList", articleList);
		mv.setViewName("board/list");
		return mv;
	}

	@RequestMapping(value = "writeForm")
	public ModelAndView writeUploadForm(BoardDataBean article) {

		mv.addObject("num", article.getNum());
		mv.addObject("ref", article.getRef());
		mv.addObject("re_step", article.getRe_step());
		mv.addObject("re_level", article.getRe_level());
		mv.addObject("pageNum", pageNum);

		mv.setViewName("board/writeUploadForm");
		return mv;
	}

	@RequestMapping(value = "writeUploadPro")
	public ModelAndView writeUpoadPro(MultipartHttpServletRequest multipart,
			BoardDataBean article) throws Exception {
		logger.info("init writeUpoadPro()..");
		article.setBoardid(boardid);
		
		dbPro.insertArticle(article);
		mv.clear();
		mv.addObject("pageNum", pageNum);
		return list();

	}

	@RequestMapping(value = "content")
	public ModelAndView content(int num) throws Exception {
		logger.info("init content()..");
		BoardDataBean article = dbPro.getArticle(num);
		
		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article);
		mv.setViewName("board/content");

		return mv;
	}

	@RequestMapping(value = "updateForm")
	public ModelAndView updateForm(int num) throws Exception {
		logger.info("init updateForm()..");
		BoardDataBean article = dbPro.getArticle(num);

		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article);
		mv.setViewName("board/updateForm");

		return mv;
	}

	@RequestMapping(value = "updatePro")
	public ModelAndView updatePro(BoardDataBean article) throws Exception {
		logger.info("init updatePro()..");
		article.setBoardid(boardid);
		int check = dbPro.updateArticle(article);

		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("check", check);
		mv.setViewName("board/updatePro");

		return mv;
	}

	@RequestMapping(value = "deleteForm")
	public ModelAndView deleteForm(int num) throws Exception {
		logger.info("init deleteForm()..");
		mv.clear();
		mv.addObject("num", num);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("board/deleteForm");

		return mv;
	}

	@RequestMapping(value = "deletePro")
	public ModelAndView deletePro(int num, String passwd) throws Exception {
		logger.info("init deletePro()..");
		int check = dbPro.deleteArticle(num, passwd);

		mv.clear();
		mv.addObject("check", check);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("board/deletePro");

		return mv;
	}

}