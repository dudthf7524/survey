package com.example.survey.controller;

import com.example.survey.dao.SurveyQnADAO;
import com.example.survey.dto.SurveyQnADTO;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/surveyQnA")
public class SurveyQnAController {
  @Inject
  SurveyQnADAO dao;
  
  @Inject
  HttpServletRequest request;
  
  @RequestMapping("/list")
  public String list(Model model, SurveyQnADTO dto) {
    List<SurveyQnADTO> surveyQnADTOlist = dao.getSelectAll(dto);
    model.addAttribute("surveyQnADTOlist", surveyQnADTOlist);
    model.addAttribute("folder", "surveyQnA");
    model.addAttribute("file", "list");
    return "_include/menu";
  }
  
  @RequestMapping("/view")
  public String view(Model model, SurveyQnADTO dto) {
    SurveyQnADTO surveyQnADTO = dao.getSelectOne(dto);
    model.addAttribute("surveyQnADTO", surveyQnADTO);
    model.addAttribute("folder", "surveyQnA");
    model.addAttribute("file", "list");
    return "surveyQnA/view";
  }
  
  @RequestMapping("/insert")
  public String insert(Model model, SurveyQnADTO surveyQnADTO) {
    System.out.println(surveyQnADTO.getSurveyNo());
    model.addAttribute("surveyNo", Integer.valueOf(surveyQnADTO.getSurveyNo()));
    return "surveyQnA/insert";
  }
  
  @RequestMapping("/update")
  public String update(Model model, SurveyQnADTO dto) {
    SurveyQnADTO surveyQnADTO = dao.getSelectOne(dto);
    model.addAttribute("surveyQnADTO", surveyQnADTO);
    return "surveyQnA/update";
  }
  
  @RequestMapping("/delete")
  public String delete(Model model, SurveyQnADTO surveyQnADTO) {
    model.addAttribute("surveyNo", Integer.valueOf(surveyQnADTO.getSurveyNo()));
    return "surveyQnA/delete";
  }
  
  @RequestMapping("/insertProc")
  public String insertProc(SurveyQnADTO surveyQnADTO) {
    dao.setInsert(surveyQnADTO);
    return "redirect:/surveyQnA/list?surveyNo=" + surveyQnADTO.getSurveyNo();
  }
  
  @RequestMapping({"/updateProc"})
  public String updateProc(SurveyQnADTO surveyQnADTO) {
    dao.setUpdate(surveyQnADTO);
    return "redirect:/surveyQnA/view?surveyQnANo=" + surveyQnADTO.getSurveyQnANo();
  }
  
  @RequestMapping("/deleteProc")
  public String deleteProc(SurveyQnADTO surveyQnADTO) {
    System.out.println(": " + surveyQnADTO.getSurveyQnANo());
    System.out.println(": " + surveyQnADTO.getQuestion());
    System.out.println(": " + surveyQnADTO.getAnswer1());
    System.out.println(": " + surveyQnADTO.getAnswer2());
    System.out.println(": " + surveyQnADTO.getAnswer3());
    System.out.println(": " + surveyQnADTO.getAnswer4());
    System.out.println(": " + surveyQnADTO.getAnswer5());
    dao.setDelete(surveyQnADTO);
    return "redirect:/surveyQnA/list?surveyNo=" + surveyQnADTO.getSurveyNo();
  }
}
