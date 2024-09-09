package com.rgb.grw.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IUserInfoDao;
import com.rgb.grw.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

/*
UserDetailsService를 구현한 LoginService 클래스. 
사용자가 입력한 사용자 아이디를 기반으로 사용자 정보를 데이터베이스에서 검색하고, 해당 사용자의 권한 정보를 로드하여 UserDetails 객체로 반환처리.
*/
@Slf4j
@Service
public class LoginService implements UserDetailsService {
	
	@Autowired
	private IUserInfoDao userInfoDao;

	/*
	loadUserByUsername(String userId)은 UserDetailsService 인터페이스의 추상메서드로 사용자의 아이디를 입력받아 사용자의 상세정보를 로드
	*/
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
	    log.info("LoginService loadUserByUsername : {}", userid);
	    log.info("LoginService repository : {}", userInfoDao);

	    UserInfoDto userInfoDto = userInfoDao.login(userid);  // userId로 상세정보 조회
	    log.info("LoginService userInfoDto : {}", userInfoDto);

	    if (userInfoDto != null) {  // 정보가 있다면...
	        // 권한을 빈 문자열이 아닌 적절한 문자열로 설정해야 합니다.
//	        String[] authorities = (userInfoDto.getAuth() != null && !userInfoDto.getAuth().trim().isEmpty())
//	                                ? new String[]{userInfoDto.getAuth()}
//	                                : new String[]{"ROLE_USER"};  // 프로젝트에서 권한을 다른것으로 사용함으로인해 권한 기능은 배제
	        return new User(userid, userInfoDto.getEmp_password(), AuthorityUtils.NO_AUTHORITIES);
	    } else {
	        // 사용자 정보를 찾지 못한 경우 예외를 던짐
	        throw new UsernameNotFoundException("User not found with id: " + userid);
	    }
	}

}
