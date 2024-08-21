package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.AnswerBoardDto;

public interface IAnswerBoardDao {
	
	public List<AnswerBoardDto> selectBoard();
}
