package com.example.survey.dao;

import com.example.survey.dto.SurveyDTO;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAOImpl implements SurveyDAO {
  @Inject
  SqlSession sqlSession;
  
  public List<SurveyDTO> getSelectAll(SurveyDTO paramDTO) {
    return this.sqlSession.selectList("survey.getSelectAll", paramDTO);
  }
  
  public SurveyDTO getSelectOne(SurveyDTO paramDTO) {
    return (SurveyDTO)this.sqlSession.selectOne("survey.getSelectOne", paramDTO);
  }
  
  public int setInsert(SurveyDTO paramDTO) {
    return this.sqlSession.insert("survey.setInsert", paramDTO);
  }
  
  public int setUpdate(SurveyDTO paramDTO) {
    return this.sqlSession.update("survey.setUpdate", paramDTO);
  }
  
  public int setDelete(SurveyDTO paramDTO) {
    return this.sqlSession.delete("survey.setDelete", paramDTO);
  }
}
