package com.example.survey.dao;

import com.example.survey.dto.SurveyDTO;
import java.util.List;

public interface SurveyDAO {
  List<SurveyDTO> getSelectAll(SurveyDTO paramSurveyDTO);
  
  SurveyDTO getSelectOne(SurveyDTO paramSurveyDTO);
  
  int setInsert(SurveyDTO paramSurveyDTO);
  
  int setUpdate(SurveyDTO paramSurveyDTO);
  
  int setDelete(SurveyDTO paramSurveyDTO);
}