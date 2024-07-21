package com.example.survey.controller;

import com.example.survey.dao.ParticipateDAO;
import com.example.survey.dao.SurveyDAO;
import com.example.survey.dao.SurveyQnADAO;
import com.example.survey.dto.ParticipateDTO;
import com.example.survey.dto.SurveyDTO;
import com.example.survey.dto.SurveyQnADTO;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping({"/participate"})
public class ParticipateController {
  @Inject
  SurveyDAO surveyDAO;
  
  @Inject
  SurveyQnADAO surveyQnADAO;
  
  @Inject
  ParticipateDAO participateDAO;
  
  @RequestMapping("/surveystart")
  public String surveystart(Model model, SurveyDTO surveyDTO, HttpSession session) {
    String memberNo = (String)session.getAttribute("memberNo");
    System.out.println(memberNo);
    String msg = "";
    if (memberNo == null) {
      msg = "로그인 후 이용해주세요";
      model.addAttribute("msg", msg);
      model.addAttribute("page", "/");
      return "/_include/alert";
    } 
    SurveyDTO resultDTO = surveyDAO.getSelectOne(surveyDTO);
    model.addAttribute("folder", "participate");
    model.addAttribute("file", "surveystart");
    model.addAttribute("resultDTO", resultDTO);
    return "/main/mainpage";
  }
  
  @RequestMapping("/qnalist")
  public String qnalist(Model model, SurveyQnADTO surveyQnADTO, @RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex) {
    System.out.println(surveyQnADTO.getSurveyNo());
    List<SurveyQnADTO> list = surveyQnADAO.getSelectAll(surveyQnADTO);
    for (int i = 0; i < list.size(); i++) {
      ((SurveyQnADTO)list.get(i)).setNo(i + 1);
      System.out.println(((SurveyQnADTO)list.get(i)).getNo());
    } 
    if (pageIndex < 0)
      pageIndex = 0; 
    if (pageIndex >= list.size())
      pageIndex = list.size() - 1; 
    model.addAttribute("pageIndex", Integer.valueOf(pageIndex));
    model.addAttribute("folder", "participate");
    model.addAttribute("file", "qnalist");
    model.addAttribute("list", list);
    model.addAttribute("surveyNo", Integer.valueOf(surveyQnADTO.getSurveyNo()));
    return "/main/mainpage";
  }
  
  @RequestMapping("/insert")
  public String insert(RedirectAttributes red, @ModelAttribute ParticipateDTO answerDTO, @RequestParam(value = "pageIndex", defaultValue = "0") int pageIndex, String question, String answer, String arrayAnswer1, String arrayAnswer2, String arrayAnswer3, String arrayAnswer4, String arrayAnswer5) {
    System.out.println("answer1" + answerDTO.getAnswer1());
    System.out.println("answer2" + answerDTO.getAnswer2());
    System.out.println("answer3" + answerDTO.getAnswer3());
    System.out.println("answer4" + answerDTO.getAnswer4());
    System.out.println("answer5" + answerDTO.getAnswer5());
    if (answerDTO.getAnswer1() == null) {
      answerDTO.setAnswer1("0");
    } else {
      answerDTO.setAnswer1("1");
    } 
    if (answerDTO.getAnswer2() == null) {
      answerDTO.setAnswer2("0");
    } else {
      answerDTO.setAnswer2("1");
    } 
    if (answerDTO.getAnswer3() == null) {
      answerDTO.setAnswer3("0");
    } else {
      answerDTO.setAnswer3("1");
    } 
    if (answerDTO.getAnswer4() == null) {
      answerDTO.setAnswer4("0");
    } else {
      answerDTO.setAnswer4("1");
    } 
    if (answerDTO.getAnswer5() == null) {
      answerDTO.setAnswer5("0");
    } else {
      answerDTO.setAnswer5("1");
    } 
    System.out.println("" + answerDTO.getSurveyNo());
    System.out.println("" + answerDTO.getSelectedQuestion());
    System.out.println("" + answerDTO.getSelectedAnswer());
    System.out.println("" + pageIndex);
    question = String.valueOf(question) + "," + answerDTO.getSelectedQuestion();
    arrayAnswer1 = String.valueOf(arrayAnswer1) + "," + answerDTO.getAnswer1();
    arrayAnswer2 = String.valueOf(arrayAnswer2) + "," + answerDTO.getAnswer2();
    arrayAnswer3 = String.valueOf(arrayAnswer3) + "," + answerDTO.getAnswer3();
    arrayAnswer4 = String.valueOf(arrayAnswer4) + "," + answerDTO.getAnswer4();
    arrayAnswer5 = String.valueOf(arrayAnswer5) + "," + answerDTO.getAnswer5();
    red.addFlashAttribute("question", question);
    red.addFlashAttribute("arrayAnswer1", arrayAnswer1);
    red.addFlashAttribute("arrayAnswer2", arrayAnswer2);
    red.addFlashAttribute("arrayAnswer3", arrayAnswer3);
    red.addFlashAttribute("arrayAnswer4", arrayAnswer4);
    red.addFlashAttribute("arrayAnswer5", arrayAnswer5);
    return "redirect:/participate/qnalist?surveyNo=" + answerDTO.getSurveyNo() + "&pageIndex=" + pageIndex;
  }
  
  @RequestMapping("/insertProc")
  public String insertProc(String question, String arrayAnswer1, String arrayAnswer2, String arrayAnswer3, String arrayAnswer4, String arrayAnswer5, @ModelAttribute ParticipateDTO answerDTO, HttpSession session) {
    String memberNo_ = (String)session.getAttribute("memberNo");
    int memberNo = Integer.parseInt(memberNo_);
    question = question.substring(1);
    arrayAnswer1 = arrayAnswer1.substring(1);
    arrayAnswer2 = arrayAnswer2.substring(1);
    arrayAnswer3 = arrayAnswer3.substring(1);
    arrayAnswer4 = arrayAnswer4.substring(1);
    arrayAnswer5 = arrayAnswer5.substring(1);
    String[] questioninsert = question.split(",");
    String[] answer1 = arrayAnswer1.split(",");
    String[] answer2 = arrayAnswer2.split(",");
    String[] answer3 = arrayAnswer3.split(",");
    String[] answer4 = arrayAnswer4.split(",");
    String[] answer5 = arrayAnswer5.split(",");
    for (int i = 0; i < questioninsert.length; i++) {
      System.out.println(questioninsert[i]);
      int surveyQnANo = Integer.parseInt(questioninsert[i]);
      answerDTO.setSurveyQnANo(surveyQnANo);
      answerDTO.setAnswer1(answer1[i]);
      answerDTO.setAnswer2(answer2[i]);
      answerDTO.setAnswer3(answer3[i]);
      answerDTO.setAnswer4(answer4[i]);
      answerDTO.setAnswer5(answer5[i]);
      answerDTO.setMemberNo(memberNo);
      participateDAO.setInsert(answerDTO);
     
    } 
    return "/participate/sucess";
  }
}
