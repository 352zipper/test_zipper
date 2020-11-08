package com.zipper.payment.model.service;

import static com.zipper.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.HashMap;

import com.zipper.classMain.model.dao.ClassDAO;
import com.zipper.common.exception.PaymentException;
import com.zipper.payment.model.dao.PaymentDAO;
import com.zipper.payment.model.vo.Payment;

public class PaymentService {
	
	private Connection con;	// 데이터베이스 연결할 connection 생성
	private PaymentDAO pDAO = new PaymentDAO(); // 서비스 공통으로 사용 될 DAO 생성
	private ClassDAO cDAO = new ClassDAO();
	public HashMap<String, Object> beforePayment(int bno) {
		
		con = getConnection();
		
		HashMap<String, Object> hmap = cDAO.selectOne(con, bno);
		
		close(con);
		
		return hmap;
	}

	public int insertPayment(Payment pm) throws PaymentException {
		
		con = getConnection();
		
		int result = pDAO.insertPayment(con, pm);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
	
	
}
