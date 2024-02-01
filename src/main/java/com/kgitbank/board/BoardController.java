package com.kgitbank.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kgitbank.board.dto.BoardDTO;
import com.kgitbank.board.service.BoardMapper;







@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper ;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	

	@RequestMapping(value = "/board.bo", method = RequestMethod.GET)
	public String home(HttpServletRequest req, 
			@RequestParam(required=false) String pageNum) {
	
		int pageSize = 5;
		if (pageNum == null) pageNum = "1";
		int currentPage = (Integer.parseInt(pageNum));
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		//int count = boardDAO.getCount();
		int count = boardMapper.getCount();
		if (endRow > count) endRow = count;
		//List<BoardDTO> list = boardDAO.listBoard(startRow,  endRow);
		List<BoardDTO> list = boardMapper.listBoard(startRow, endRow);
		req.setAttribute("listBoard", list);
		int number = count - startRow + 1;
		int pageBlock = 3;
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
		req.setAttribute("number", number);
		req.setAttribute("count", count);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		return "list";
}
	
	
		
	
	
	
	
	

	@RequestMapping("/content_board.bo")
	public String content_board(HttpServletRequest req, int num) {
		
	BoardDTO dto =boardMapper.getBoard(num,"content");
	req.setAttribute("getBoard",dto);
		return "content";
	
			
	}
	
	@RequestMapping("/writeForm_board.bo")
	public String writeForm_board(HttpServletRequest req) {
		int num = 0, re_step = 0, re_level = 0;
		String snum = req.getParameter("num");
		if (snum != null){
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
		}
	
		
		req.setAttribute("num", num);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
	
		return "writeform";
			
	}
	
	@RequestMapping("/writepro_board.bo")
	public String writepro_board(HttpServletRequest req, @ModelAttribute BoardDTO dto, BindingResult result) {
		
		
		if (result.hasErrors()) {
			dto.setNum(0);
			dto.setRe_step(0);
			dto.setRe_level(0);
		}
		
	 	
		System.out.println("dto.getNum() = " + dto.getNum());
		dto.setIp(req.getRemoteAddr());
		
		int res = boardMapper.insertBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "게시글 등록 성공!! 게시글 목록페이지로 이동합니다");
			req.setAttribute("url", "board.bo");
		}else if (res<0){
			req.setAttribute("msg", "게시글 등록 실패. 다시 입력해 주세요.");
			req.setAttribute("url", "writeForm_board.bo");
		}else {
			req.setAttribute("msg"," 게시글 보기페이지로 이동합니다.");
			req.setAttribute("url", "writeForm_board.bo?");
		}
			return "message";
		
	}
		
	
	
		
			
	
	@RequestMapping("/deleteForm_board.bo")
	public String deleteForm_board() {
		
		
		return "deleteForm";
	
			
	}
	@RequestMapping("/deletePro_board.bo")
	public String deletePro_board(@RequestParam int num,@RequestParam String passwd) {
		
		int res = boardMapper.deleteBoard(num, passwd);
		return "redirect:board.bo";
		
	}
	
	
	
	@RequestMapping("/updateForm_board.bo")
	public String updateForm_board(HttpServletRequest req,int num) {
		
		BoardDTO dto = boardMapper.getBoard(num,"update");
		req.setAttribute("getBoard", dto);
			return "updateForm";
		
	}@RequestMapping("/updatePro_board.bo")
	public String updatePro_board(@ModelAttribute BoardDTO dto,HttpServletRequest req) {
		
		int res=boardMapper.updateBoard(dto);
		if (res>0) {
			req.setAttribute("msg", "게시글 수정 성공!! 게시글 목록페이지로 이동합니다");
			req.setAttribute("url", "board.bo");
		}else if (res<0){
			req.setAttribute("msg", "비밀번호가 틀렸습니다. 다시 입력해 주세요.");
			req.setAttribute("url", "writeForm_board.bo?num=" + dto.getNum());
		}else {
			req.setAttribute("msg", "게시글 수정 실패!! 게시글 보기페이지로 이동합니다.");
			req.setAttribute("url", "writeForm_board.bo?num=" + dto.getNum());
		}
			return "message";
		
	}

	
	
	
	
	
	
	
	
	
	
}


