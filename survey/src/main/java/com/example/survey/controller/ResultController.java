package com.example.survey.controller;

import com.example.survey.dao.ParticipateDAO;
import com.example.survey.dao.SurveyDAO;
import com.example.survey.dto.ParticipateDTO;
import com.example.survey.dto.ResultDTO;
import com.example.survey.dto.SurveyDTO;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/result")
public class ResultController {
  @Inject
  SurveyDAO dao;
  
  @Inject
  ParticipateDAO participateDAO;
  
  @RequestMapping("/surveylist")
  public String surveylist(Model model, SurveyDTO surveyDTO) {
    model.addAttribute("folder", "result");
    model.addAttribute("file", "surveylist");
    List<SurveyDTO> surveylist = dao.getSelectAll(surveyDTO);
    model.addAttribute("surveylist", surveylist);
    return "/_include/menu";
  }
  
  @RequestMapping("/surveyview")
  public String surveyview(Model model, ParticipateDTO participateDTO) {
    System.out.println(participateDTO.getSurveyNo());
    model.addAttribute("folder", "result");
    model.addAttribute("file", "surveyview");
    List<ResultDTO> ResultDTOList = participateDAO.getSelectJoin(participateDTO);
    model.addAttribute("ResultDTOList", ResultDTOList);
    return "/_include/menu";
  }
}
