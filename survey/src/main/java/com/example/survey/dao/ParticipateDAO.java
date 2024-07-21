package com.example.survey.dao;

import com.example.survey.dto.ParticipateDTO;
import com.example.survey.dto.ResultDTO;
import java.util.List;

public interface ParticipateDAO {
  List<ParticipateDTO> getSelectAll();
  
  ParticipateDTO getSelectOne(ParticipateDTO paramParticipateDTO);
  
  int setInsert(ParticipateDTO paramParticipateDTO);
  
  int setUpdate(ParticipateDTO paramParticipateDTO);
  
  int setDelete(ParticipateDTO paramParticipateDTO);
  
  List<ResultDTO> getSelectJoin(ParticipateDTO paramParticipateDTO);
}
