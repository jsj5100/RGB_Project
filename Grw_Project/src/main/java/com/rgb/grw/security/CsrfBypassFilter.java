package com.rgb.grw.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class CsrfBypassFilter implements Filter {

    private final CsrfTokenRepository csrfTokenRepository = new HttpSessionCsrfTokenRepository();

    @Override
    public void init(FilterConfig filterConfig) {
        log.info("CsrfBypassFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String requestUri = httpRequest.getRequestURI();
//        log.debug("Processing request for URI: {}", requestUri);

        // CSRF 검증이 필요한 URL 패턴
        if (shouldCheckCsrf(requestUri)) {
            // CSRF 토큰 로드
            CsrfToken csrfToken = csrfTokenRepository.loadToken(httpRequest);
//            log.debug("Loaded CSRF Token: {}", csrfToken != null ? csrfToken.getToken() : "null");

            // 요청 헤더에서 CSRF 토큰 가져오기
            String tokenFromRequest = httpRequest.getHeader("X-CSRF-TOKEN");
//            log.debug("CSRF Token from request header: {}", tokenFromRequest);

            // CSRF 토큰 검증
            if (csrfToken == null || tokenFromRequest == null || !tokenFromRequest.equals(csrfToken.getToken())) {
//                log.warn("CSRF token mismatch or missing");

                // 새로운 CSRF 토큰 생성 및 응답 헤더에 추가
//                csrfToken = csrfTokenRepository.generateToken(httpRequest);
//                csrfTokenRepository.saveToken(csrfToken, httpRequest, httpResponse);
//                httpResponse.setHeader("X-CSRF-TOKEN", csrfToken.getToken());
//
//                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
                return;
            } else {
//                log.info("CSRF token validation passed for URI: {}", requestUri);
            }
        } else {
//            log.debug("CSRF validation skipped for URI: {}", requestUri);
        }

        chain.doFilter(request, response);
    }

    private boolean shouldCheckCsrf(String requestUri) {
        // CSRF 검증이 필요한 URL 패턴 설정
        if (requestUri.startsWith("/loginServlet.do") ||
            requestUri.startsWith("/passwordFind.do") ||
            requestUri.startsWith("/login.do") ||
            requestUri.startsWith("/passwordChange.do")) {
            return true;
        }

        // 정적 자원에 대해서는 CSRF 검증을 건너뜀
        if (requestUri.startsWith("/assets/")) {
            return false;
        }

        // 기본적으로 CSRF 검증이 필요 없는 URL은 검증을 건너뜀
        return false;
    }

    @Override
    public void destroy() {
//        log.info("CsrfBypassFilter destroyed");
    }
}
