package it.unisa.control;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class PathTraversalFilter
 */
@WebFilter("/PathTraversalFilter")
public class PathTraversalFilter extends HttpFilter implements Filter {
       
	private static final String BASE_DIRECTORY = "C:\\Users\\valen_12bjkcd\\git\\p2";
    /**
     * @see HttpFilter#HttpFilter()
     */
    public PathTraversalFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest httpRequest = (HttpServletRequest) request;
	        String page = httpRequest.getParameter("page");

	        if (page != null && !isPathSecure(page)) {
	            ((HttpServletResponse) response).sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file path");
	            return;
	        }
		chain.doFilter(request, response);
	}

	private boolean isPathSecure(String userPath) {
		try {
            // Risolve il percorso relativo alla base directory
            String canonicalBasePath = Paths.get(BASE_DIRECTORY).toRealPath().toString();
            String canonicalUserPath = Paths.get(BASE_DIRECTORY, userPath).toRealPath().toString();
            
            // Verifica che il percorso richiesto inizi con la base directory
            return canonicalUserPath.startsWith(canonicalBasePath) &&
                   !userPath.contains("WEB-INF") && 
                   !userPath.contains("META-INF");
        } catch (IOException e) {
            return false;
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
