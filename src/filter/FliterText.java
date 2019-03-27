package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FliterText implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request0, ServletResponse response0, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) request0;
		HttpServletResponse response=(HttpServletResponse) response0;
		Object obj = request.getSession().getAttribute("loginName");
		if(obj!=null){
			chain.doFilter(request0, response0);
		}else{
			response.setHeader("refresh", "3;url=longen.jsp");
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	
}
