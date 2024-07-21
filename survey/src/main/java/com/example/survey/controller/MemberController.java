package com.example.survey.controller;

import com.example.survey._common.Util;
import com.example.survey.dao.MemberDAO;
import com.example.survey.dto.MemberDTO;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member")
public class MemberController {
  @Inject
  MemberDAO dao;
  
  @Inject
  HttpServletRequest request;
  
  @RequestMapping("/list")
  public String list(Model model, @RequestParam(value = "pageNumber", required = false) String pageNumber_, String searchOption, String searchData) {
    System.out.println("searchOption : " + searchOption);
    System.out.println("searchData : " + searchData);
    Util util = new Util();
    if (pageNumber_ == null || pageNumber_.trim().equals(""))
      pageNumber_ = "1"; 
    int pageNumber = Integer.parseInt(pageNumber_);
    int pageSize = 2;
    int blockSize = 2;
    int totalRecord = dao.getTotalRecord(searchOption, searchData);
    int[] page = util.getPage(pageNumber, pageSize, blockSize, totalRecord);
    int totalPage = page[0];
    int startPage = page[1];
    int lastPage = page[2];
    int startRecord = page[3];
    int lastRecord = page[4];
    int jj = page[5];
    System.out.println("totalRecord : " + totalRecord);
    List<MemberDTO> list = dao.getSelectAll(startRecord, lastRecord, searchOption, searchData);
    System.out.println("list : " + list.size());
    model.addAttribute("pageNumber", Integer.valueOf(pageNumber));
    model.addAttribute("pageSize", Integer.valueOf(pageSize));
    model.addAttribute("blockSize", Integer.valueOf(blockSize));
    model.addAttribute("totalRecord", Integer.valueOf(totalRecord));
    model.addAttribute("startRecord", Integer.valueOf(startRecord));
    model.addAttribute("lastRecord", Integer.valueOf(lastRecord));
    model.addAttribute("totalPage", Integer.valueOf(totalPage));
    model.addAttribute("startPage", Integer.valueOf(startPage));
    model.addAttribute("lastPage", Integer.valueOf(lastPage));
    model.addAttribute("jj", Integer.valueOf(jj));
    model.addAttribute("searchOption", searchOption);
    model.addAttribute("searchData", searchData);
    model.addAttribute("folder", "member");
    model.addAttribute("file", "list");
    model.addAttribute("list", list);
    return "_include/menu";
  }
  
  @RequestMapping("/view")
  public String view(Model model, @ModelAttribute MemberDTO memberDTO) {
    System.out.println(memberDTO.getMemberNo());
    MemberDTO resultDTO = dao.getSelectOne(memberDTO);
    model.addAttribute("resultDTO", resultDTO);
    return "member/view";
  }
  
  @RequestMapping("/join")
  public String chuga() {
    return "member/join";
  }
  
  @RequestMapping("/update")
  public String update(Model model, @ModelAttribute MemberDTO memberDTO) {
    MemberDTO resultDTO = dao.getSelectOne(memberDTO);
    model.addAttribute("resultDTO", resultDTO);
    return "member/update";
  }
  
  @RequestMapping("/sakje")
  public String sakje(Model model, @ModelAttribute MemberDTO memberDTO) {
    MemberDTO resultDTO = dao.getSelectOne(memberDTO);
    model.addAttribute("resultDTO", resultDTO);
    return "member/sakje";
  }
  
  @RequestMapping("/login")
  public String login(Model model, @ModelAttribute MemberDTO memberDTO) {
    MemberDTO resultDTO = dao.getSelectOne(memberDTO);
    model.addAttribute("resultDTO", resultDTO);
    return "member/login";
  }
  
  @RequestMapping("/joinProc")
  public String joinProc(@ModelAttribute MemberDTO memberDTO) {
    dao.setInsert(memberDTO);
    return "redirect:/";
  }
  
  @RequestMapping("/loginProc")
  public String loginProc(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
    System.out.println(":" + memberDTO.getMemberId());
    System.out.println(":" + memberDTO.getMemberPasswd());
    MemberDTO resultDTO = dao.login(memberDTO);
    System.out.println(":" + resultDTO.getMemberPasswd());
    int memberNo_ = resultDTO.getMemberNo();
    System.out.println(memberNo_);
    String memberNo = (new StringBuilder(String.valueOf(memberNo_))).toString();
    System.out.println(String.valueOf(memberNo) + '\001');
    session.setAttribute("memberNo", memberNo);
    session.setAttribute("memberId", resultDTO.getMemberId());
    session.setAttribute("memberName", resultDTO.getMemberName());
    session.setAttribute("rank", Integer.valueOf(resultDTO.getRank()));
    return "redirect:/";
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
  }
  
  @RequestMapping("/updateProc")
  public String updateProc(Model model, @ModelAttribute MemberDTO memberDTO) {
    dao.setUpdate(memberDTO);
    return "redirect:/member/view?memberNo=" + memberDTO.getMemberNo();
  }
  
  @RequestMapping("/deleteProc")
  public String deleteProc(Model model, @ModelAttribute MemberDTO memberDTO) {
    dao.setDelete(memberDTO);
    return "redirect:/member/logout";
  }
}
