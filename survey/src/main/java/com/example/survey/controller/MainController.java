package com.example.survey.controller;

import com.example.survey.dao.SurveyDAO;
import com.example.survey.dto.SurveyDTO;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
  @Inject
  SurveyDAO dao;
  
  @RequestMapping("/")
  public String index(Model model, SurveyDTO surveyDTO) {
    List<SurveyDTO> list = dao.getSelectAll(surveyDTO);
    model.addAttribute("list", list);
    model.addAttribute("folder", "main");
    model.addAttribute("file", "mainlist");
    return "main/mainpage";
  }
}

