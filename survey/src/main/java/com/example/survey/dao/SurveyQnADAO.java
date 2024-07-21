package com.example.survey.dao;

import com.example.survey.dto.SurveyQnADTO;
import java.util.List;

public interface SurveyQnADAO {
  List<SurveyQnADTO> getSelectAll(SurveyQnADTO paramSurveyQnADTO);
  
  SurveyQnADTO getSelectOne(SurveyQnADTO paramSurveyQnADTO);
  
  int setInsert(SurveyQnADTO paramSurveyQnADTO);
  
  int setUpdate(SurveyQnADTO paramSurveyQnADTO);
  
  int setDelete(SurveyQnADTO paramSurveyQnADTO);


}
