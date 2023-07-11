package controller.filters.login;

import java.io.IOException;
import java.net.URL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {
    private ServletContext context;

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        this.context.log("Requested URL :: " + uri);
        String user = "";

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("ID") != null) {
            user = (String) session.getAttribute("ID");
            if (user.endsWith("0")) {
                // Admin pages
            	System.out.println(user);
                if (uri.endsWith("viewproduct.jsp") || uri.endsWith("editproducts.jsp")|| uri.endsWith("UpdateProduct")|| uri.endsWith("InsertProduct")
                        || uri.endsWith("admin_orderplacement.jsp") || uri.endsWith("admin_userlist.jsp")
                        || uri.endsWith("editform.jsp") || uri.endsWith("addproduct.jsp") || uri.endsWith("product.jsp")|| uri.endsWith("userLogout")
                        || uri.contains("photos")||uri.endsWith("error.jsp")) {
                	chain.doFilter(request, response);
                } else {
                    req.setAttribute("errorMessage", "You do not have permission to access this page.");
                    RequestDispatcher inc = request.getRequestDispatcher("/error.jsp");
                    inc.include(req, res);
       
                }
            } else {
                // User pages
                if (uri.endsWith("home.jsp")|| uri.endsWith("contact_us.jsp") || uri.endsWith("about_us.jsp") || uri.endsWith("mycart.jsp")
                        || uri.endsWith("addcart.jsp") || uri.endsWith("editprofile.jsp")|| uri.endsWith("BuyProducts") 
                        || uri.endsWith("EditCart")|| uri.endsWith("AddCart")|| uri.endsWith("EditProfile")|| uri.contains("photos")|| uri.contains("video")
                        || uri.endsWith("userLogout")||uri.endsWith("home.jsp")||uri.endsWith("error.jsp")) {
                    chain.doFilter(request, response);
                } else {
                    req.setAttribute("errorMessage", "You do not have permission to access this page.");
                    RequestDispatcher inc = request.getRequestDispatcher("/error.jsp");
                    inc.include(req, res);
                }
            }
        } else {
            // Pages accessible to all users
            if (uri.endsWith("about_us.jsp") || uri.endsWith("contact_us.jsp") || uri.endsWith("login.jsp")
                    || uri.endsWith("register.jsp") || uri.endsWith("style.css") || uri.endsWith("js")
                    || uri.endsWith("servelts") || uri.contains("photos") || uri.contains("video")
                    || uri.endsWith("ClassicWears/")||uri.endsWith("UserLogin")||uri.endsWith("UserRegister")
                    ||uri.endsWith("home.jsp")||uri.endsWith("error.jsp")) {
                chain.doFilter(request, response);
            } else {
                req.setAttribute("errorMessage", "Please log in to continue.");
                RequestDispatcher inc = request.getRequestDispatcher("/error.jsp");
                inc.include(req, res);
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
        this.context = filterConfig.getServletContext();
    }
}
