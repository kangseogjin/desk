package com.kgitbank.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgitbank.board.dto.BoardDTO;




@Service
public class BoardMapper {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	

	public  int getCount() {
	
			int res = sqlSession.selectOne("getCount");
			return res;
		
	}
	
	public  List<BoardDTO> listBoard(int start, int end) {
	
			java.util.Map<String, Integer> map = new java.util.Hashtable<>();
			map.put("start", start);
			map.put("end", end);
			List<BoardDTO> list = sqlSession.selectList("listBoard", map);
			
		return list;
		}
	
	public  BoardDTO getBoard(int num,String mode) {
		
		BoardDTO dto = null;
		if(mode.equals("content")) {plusReadcount(num);}
			
		
		dto=sqlSession.selectOne("getBoard",num);
		
			return dto;		
	}
	
	public  void plusReadcount(int num) {
	
		
			int res = sqlSession.update("plusReadcount", num);
		
			return;    //update 구문은 반환 타입을 void로 하고  return 해서 끝내야 한다.
		
	}
	
	public  int insertBoard(BoardDTO dto) {
		

		
			String sql = null;
			if (dto.getNum() == 0) {
				sql = "update board set re_step = re_step + 1";
			}else {
				sql = "update board set re_step = re_step + 1 where re_step > " + dto.getRe_step();
				dto.setRe_step(dto.getRe_step() + 1);
				dto.setRe_level(dto.getRe_level() + 1);
			}
			java.util.Map<String, String> map = new java.util.Hashtable<>();
			map.put("sql", sql);
			int res=sqlSession.update("plusRe_step", map);
			
			return res;
	
	}
	

	protected  boolean isPassword(int num, String passwd) {
		BoardDTO dto = getBoard(num, passwd);
		if (dto.getPasswd().equals(passwd)) {
			return true;
		}
		return false;
	}
	
	public  int deleteBoard(int num, String passwd) {
	
		if(isPassword(num,passwd)) {
			int res=sqlSession.delete("deleteBoard",num);
		
			return res;
		}
		else {
			return -1;
		}
			
		
	}
	

	
	public  int updateBoard(BoardDTO dto) {
		
		
			if (isPassword(dto.getNum(), dto.getPasswd())) {
				int res=sqlSession.update("updateBoard",dto);
			
				return res;
			}else {
				return -1;
			}
		
	
	}
	
	
	public  List<BoardDTO> findBoard(java.util.Map<String, String> map) {
		
		map.put("searchString", "%"+map.get("searchString")+"%");
	
			List<BoardDTO> list = sqlSession.selectList("findBoard", map);
			return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

	
	
	
	
	
	
	

