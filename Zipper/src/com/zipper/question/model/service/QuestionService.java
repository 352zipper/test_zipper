package com.zipper.question.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.zipper.common.exception.QuestionException;
import com.zipper.question.model.dao.QuestionDAO;
import com.zipper.question.model.vo.Question;

public class QuestionService {
	private Connection con;
	private QuestionDAO qDAO = new QuestionDAO();
	
public ArrayList<Question> selectList() {
		
		con = getConnection();
		
		ArrayList<Question> result = qDAO.selectList(con);
		
		close(con);
		
		return result;
	}

public Question selectOne(int qno) {
	con = getConnection();
	
	Question qs = qDAO.selectOne(con, qno);
	
	close(con);
	
	return qs;
}

public int insertQuestion(Question q) throws QuestionException {
	con = getConnection();
	
	int result = qDAO.insertQuestion(con, q);
	
	if(result > 0) commit(con);
	else rollback(con);
	
	close(con);
	
	return result;
}

}
