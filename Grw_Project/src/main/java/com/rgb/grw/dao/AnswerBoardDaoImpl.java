package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.AnswerBoardDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AnswerBoardDaoImpl implements IAnswerBoardDao{
	
	private final String NS="com.rgb.grw.dao.AnswerBoardDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate sessionTemplate;
	
	
	
	@Override
	public List<AnswerBoardDto> selectBoard() {
		return sessionTemplate.selectList(NS+"selectBoard");
	}
	
}
