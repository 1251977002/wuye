package com.dz.interceptor;


import com.dz.pojo.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyInterceptor extends HandlerInterceptorAdapter {
    private List<String> excluedUrls;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        for (String url : excluedUrls) {
            if (request.getRequestURI().endsWith(url)) {
                return true;
            }
        }
        HttpSession session = request.getSession();
        User currUser = (User) session.getAttribute("currUser");
        if (currUser == null) {
            throw new AuthorizationException();
        }
        return true;
       /* if(currUser != null || url.endsWith("file")){
            return true;
        }else{
            //response.sendRedirect("/file/file");
            throw new AuthorizationException();
        }*/
    }


    public void setExcluedUrls(List<String> excluedUrls) {
        this.excluedUrls = excluedUrls;
    }
}
