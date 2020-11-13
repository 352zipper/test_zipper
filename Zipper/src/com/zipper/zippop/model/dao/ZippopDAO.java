package com.zipper.zippop.model.dao;

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

import com.zipper.board.model.vo.Attachment;
import com.zipper.board.model.vo.Board;
import com.zipper.myPage.model.dao.MyPageDAO;
import com.zipper.thumb.model.vo.Thumbnail;


public class ZippopDAO {
	
	private Properties prop = null;
	
	public ZippopDAO() {
		prop = new Properties();
		
		String filePath = MyPageDAO.class.getResource("/config/zippop-sql.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}		
	}
	
	
	public ArrayList<Thumbnail> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Thumbnail> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				Thumbnail tn = new Thumbnail();
				
				tn.setUserId(rset.getString("mid"));
				tn.setBno(rset.getInt("bno"));
				tn.setBcontent(rset.getString("bcontent"));
				tn.setBoardfile(rset.getString("file_new_name"));
				
				list.add(tn);
			}
			//System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int getCurrentBno(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//System.out.println("getCurrentBno : " + result);
		
		String sql = prop.getProperty("currentBno");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			// test comment
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("board current No. :" + result);
		
		return result;
	}


	public int insertZippop(Connection con, Thumbnail t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertZippop");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, t.getMno());
			pstmt.setString(2, t.getBcontent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		//System.out.println("DAO zippop result : " + result);
		
		return result;
	}


	public int insertZipAtt(Connection con, Attachment at) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertZipAtt");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, at.getBno());
			pstmt.setString(2, at.getFile_origin_name());
			pstmt.setString(3, at.getFile_new_name());
			pstmt.setString(4, at.getFilepath());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
			
		}
		
		//System.out.println("DAO zipAtt result : " + result);
		
		
		return result;
	}

	// 집팝 상셎도ㅚ
	public Board selectOne(Connection con, int bno) {
		
		Board b = null;
	     
	      PreparedStatement pstmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectOne");
	      
	      System.out.println(sql);
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setInt(1, bno);
	         
	         rset = pstmt.executeQuery();
			
			 if(rset.next()) {
		            
		            b = new Board();
		            
		            b.setBno(bno);
		            b.setBtitle(rset.getString("btitle"));
		            b.setBcontent(rset.getString("bcontent"));
		            b.setBwriter(rset.getString("mnick"));
		            b.setBdate(rset.getDate("bdate"));
		            b.setBoardfile(rset.getString("file_new_name"));
		            b.setMno(rset.getInt("mno"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);
		}
				
		return b;
	}


	public int deleteZipAtt(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteZipAtt");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
			System.out.println("------------------" + result);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		
		}
				
		return result;
	}
	
	public int deleteZippop(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteZippop");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		
		}
				
		return result;
	}


	public int getListCount(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
}
