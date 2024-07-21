package com.example.survey.controller;

import com.example.survey.dao.SurveyDAO;
import com.example.survey.dto.SurveyDTO;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/survey")
public class SurveyController {
  @Inject
  SurveyDAO dao;
  
  @Inject
  HttpServletRequest request;
  
  @RequestMapping("/list")
  public String list(Model model, HttpSession session, SurveyDTO surveyDTO) {
    String memberNo__ = (String)session.getAttribute("memberNo");
    String msg = "";
    if (memberNo__ == null) {
      msg = "로그인 후 이용해주세요";
      model.addAttribute("msg", msg);
      model.addAttribute("page", "/");
      return "/_include/alert";
    } 
    String memberNo_ = (String)session.getAttribute("memberNo");
    int memberNo = Integer.parseInt(memberNo_);
    surveyDTO.setMemberNo(memberNo);
    List<SurveyDTO> surveylist = dao.getSelectAll(surveyDTO);
    model.addAttribute("folder", "survey");
    model.addAttribute("file", "list");
    model.addAttribute("surveylist", surveylist);
    return "_include/menu";
  }
  
  @RequestMapping("/view")
  public String view(Model model, SurveyDTO dto) {
    SurveyDTO surveyDTO = dao.getSelectOne(dto);
    model.addAttribute("surveyDTO", surveyDTO);
    return "survey/view";
  }
  
  @RequestMapping("/insert")
  public String insert() {
    return "survey/insert";
  }
  
  @RequestMapping("/update")
  public String update(Model model, SurveyDTO dto) {
    SurveyDTO surveyDTO = dao.getSelectOne(dto);
    model.addAttribute("surveyDTO", surveyDTO);
    return "survey/update";
  }
  
  @RequestMapping("/delete")
  public String delete() {
    return "survey/delete";
  }
  
  @RequestMapping("/insertProc")
  public String insertProc(SurveyDTO surveyDTO, HttpSession session) {
    String memberNo_ = (String)session.getAttribute("memberNo");
    System.out.println("memberNo_ : " + memberNo_);
    int memberNo = Integer.parseInt(memberNo_);
    surveyDTO.setMemberNo(memberNo);
    dao.setInsert(surveyDTO);
    return "redirect:/survey/list";
  }
  
  @RequestMapping("/updateProc")
  public String updateProc(SurveyDTO surveyDTO, HttpSession session) {
    dao.setUpdate(surveyDTO);
    return "redirect:/survey/view?surveyNo=" + surveyDTO.getSurveyNo();
  }
  
  @RequestMapping("/deleteProc")
  public String deleteProc(SurveyDTO surveyDTO, HttpSession session) {
    dao.setDelete(surveyDTO);
    return "redirect:/survey/list";
  }
}
