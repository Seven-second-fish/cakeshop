package servlet.cake;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Cake;
import bean.PageBean;
import dao.CakeDao;
import dao.impl.CakeDaoImpl;

/**
 * Servlet implementation class CakeList
 */
@WebServlet("/CakeList2")
public class CakeList2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_LIST_SIZE = 12;
	private static final String BOOKLIST_PATH="jsp/cake/cakelist.jsp";
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seachname = new String(request.getParameter("seachname").getBytes("iso-8859-1"),"utf-8");
		String seachname1 = request.getParameter("seachname");
		cakeList(request,response,seachname1);
	}

	private void cakeList(HttpServletRequest request, HttpServletResponse response, String seachname) throws ServletException, IOException {
		CakeDao bd = new CakeDaoImpl();
		int curPage = 1;
		String page = request.getParameter("page");
		if (page != null) {
			curPage = Integer.parseInt(page);
		}
		
		PageBean pb=null;
		List<Cake> cakeList=new ArrayList<Cake>();
		if(seachname == null || seachname == "") {
			pb = new PageBean(curPage, MAX_LIST_SIZE, bd.cakeReadCount());
			cakeList = bd.cakeList(pb);
		}else {
			pb = new PageBean(curPage, MAX_LIST_SIZE, bd.cakeReadCount(seachname));
			cakeList = bd.cakeList(pb,seachname);
		}
		request.setAttribute("title", "所有商品");
		
		request.setAttribute("pageBean", pb);
		request.setAttribute("cakeList",cakeList);
		
		request.getRequestDispatcher(BOOKLIST_PATH).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
