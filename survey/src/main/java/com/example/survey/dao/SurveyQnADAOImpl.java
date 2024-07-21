package com.example.survey.dao;

import com.example.survey.dto.SurveyQnADTO;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyQnADAOImpl implements SurveyQnADAO {
  @Inject
  SqlSession sqlSession;
  
  public List<SurveyQnADTO> getSelectAll(SurveyQnADTO paramDTO) {
    return this.sqlSession.selectList("surveyQnA.getSelectAll", paramDTO);
  }
  
  public SurveyQnADTO getSelectOne(SurveyQnADTO paramDTO) {
    return (SurveyQnADTO)this.sqlSession.selectOne("surveyQnA.getSelectOne", paramDTO);
  }
  
  public int setInsert(SurveyQnADTO paramDTO) {
    return this.sqlSession.insert("surveyQnA.setInsert", paramDTO);
  }
  
  public int setUpdate(SurveyQnADTO paramDTO) {
    return this.sqlSession.update("surveyQnA.setUpdate", paramDTO);
  }
  
  public int setDelete(SurveyQnADTO paramDTO) {
    return this.sqlSession.delete("surveyQnA.setDelete", paramDTO);
  }
}
