package com.hrtxn.flchappinessmall.interceptor;

import com.hrtxn.flchappinessmall.pojo.pojoVo.AdminVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.MenuVo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Author:封润
 * Date:2018-11-06 上午 9:39
 * Description:<描述>
 */
public class SecurityInterceptor implements HandlerInterceptor {

    private List<String> excludeUrls;// 不需要拦截的资源

    public List<String> getExcludeUrls() {
        return excludeUrls;
    }

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    /**
     * 完成页面的render后调用
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object,
                                Exception exception) throws Exception {

    }

    /**
     * 在调用controller具体方法后拦截
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object,
                           ModelAndView modelAndView) throws Exception {

    }


    /**
     * 在调用controller具体方法前拦截
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        System.err.println("contextPath:" + contextPath);
        String url = requestUri.substring(contextPath.length());//请求地址
        System.err.println("url:" + url);
        //SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(GlobalConstant.SESSION_INFO);
        AdminVo adminVo = (AdminVo) request.getSession().getAttribute("adminVo");
        //System.err.println("在拦截器里打印从session获取到的adminVo : "+adminVo);

        //判断是否是不拦截请求
        for (String excludeUrl : excludeUrls) {
            if (url.equals(excludeUrl)) {
                return true;
            }
        }


        //如果session没有该用户则让其重新登录
        if (null == adminVo || null == adminVo.getId()) {
            request.setAttribute("msg", "您还没有登录或登录已超时，请重新登录");
            //request.getRequestDispatcher("login.jsp").forward(request, response);
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return false;
        }
        //判断是否拥有访问该地址的权限
        Integer i = 0;
        for (MenuVo menuVo : adminVo.getMenuVoList()) {
            //有权限则返回true  没权限则对i++
            if (url.equals(menuVo.getUrl())) {
                return true;
            } else {
                i++;
            }
        }
        if (i > 0 || i == 0) {
            request.setAttribute("msg", "您没有访问此资源的权限！<br/>请联系超管赋予您<br/>[" + url + "]<br/>的资源访问权限！");
            request.getRequestDispatcher("/WEB-INF/jsp/error/403.jsp").forward(request, response);
            return false;
        }


       /* if ((url.indexOf("/admin/") > -1) || excludeUrls.contains(url)) {// 如果要访问的资源是不需要验证的
            return true;
        }*/
        //if ((sessionInfo == null) || (sessionInfo.getId() == null)) {// 如果没有登录或登录超时
        //    request.setAttribute("msg", "您还没有登录或登录已超时，请重新登录");
        //    request.getRequestDispatcher("/login.jsp").forward(request, response);
        //    return false;
        //}
        //
        //if (!sessionInfo.getAccessAllList().contains(url)) {
        //    return true;
        //}
        //
        //if (!sessionInfo.getAccessList().contains(url)) {// 如果当前用户没有访问此资源的权限
        //    request.setAttribute("msg", "您没有访问此资源的权限！<br/>请联系超管赋予您<br/>[" + url + "]<br/>的资源访问权限！");
        //    request.getRequestDispatcher("/error/noSecurity.jsp").forward(request, response);
        //    return false;
        //}

        return true;
    }
}
