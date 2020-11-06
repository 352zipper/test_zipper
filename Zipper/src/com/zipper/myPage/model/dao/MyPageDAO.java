package com.zipper.myPage.model.dao;

import static com.zipper.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.zipper.board.model.vo.Board;
import com.zipper.thumb.model.vo.Thumbnail;

public class MyPageDAO {

	private Properties prop = null;
	
	public MyPageDAO() {
		prop = new Properties();
		
		String filePath = MyPageDAO.class.getResource("/config/myPage-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}		
	}
	
	public ArrayList<Board> selectList(Connection con) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Thumbnail tn = new Thumbnail();
				
				//
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}