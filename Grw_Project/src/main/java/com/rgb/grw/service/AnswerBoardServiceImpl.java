package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IAnswerBoardDao;
import com.rgb.grw.dto.AnswerBoardDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AnswerBoardServiceImpl implements IAnswerBoardService {

	@Autowired
	private final IAnswerBoardDao dao;

	@Override
	public List<AnswerBoardDto> selectBoard() {
		return dao.selectBoard();
	}

}
