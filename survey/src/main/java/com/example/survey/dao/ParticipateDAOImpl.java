package com.example.survey.dao;

import com.example.survey.dto.ParticipateDTO;
import com.example.survey.dto.ResultDTO;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ParticipateDAOImpl implements ParticipateDAO {
  @Inject
  SqlSession sqlSession;
  
  public List<ParticipateDTO> getSelectAll() {
    return null;
  }
  
  public ParticipateDTO getSelectOne(ParticipateDTO paramDTO) {
    return null;
  }
  
  public int setInsert(ParticipateDTO paramDTO) {
    return this.sqlSession.insert("participate.setInsert", paramDTO);
  }
  
  public int setUpdate(ParticipateDTO paramDTO) {
    return 0;
  }
  
  public int setDelete(ParticipateDTO paramDTO) {
    return 0;
  }
  
  public List<ResultDTO> getSelectJoin(ParticipateDTO paramDTO) {
    return this.sqlSession.selectList("participate.getSelectJoin", paramDTO);
  }
}
