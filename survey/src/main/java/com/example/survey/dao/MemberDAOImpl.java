package com.example.survey.dao;

import com.example.survey.dto.MemberDTO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
  @Inject
  SqlSession sqlSession;
  
  public List<MemberDTO> getSelectAll(int startRecord, int lastRecord, String searchOption, String searchData) {
    Map<String, Object> map = new HashMap<>();
    map.put("startRecord", Integer.valueOf(startRecord));
    map.put("lastRecord", Integer.valueOf(lastRecord));
    map.put("searchOption", searchOption);
    map.put("searchData", searchData);
    return this.sqlSession.selectList("member.getSelectAll", map);
  }
  
  public MemberDTO getSelectOne(MemberDTO paramDto) {
    return (MemberDTO)this.sqlSession.selectOne("member.getSelectOne", paramDto);
  }
  
  public int setInsert(MemberDTO paramDto) {
    return this.sqlSession.insert("member.setInsert", paramDto);
  }
  
  public int setUpdate(MemberDTO paramDto) {
    return this.sqlSession.update("member.setUpdate", paramDto);
  }
  
  public int setDelete(MemberDTO paramDto) {
    return this.sqlSession.delete("member.setDelete", paramDto);
  }
  
  public MemberDTO login(MemberDTO paramDTO) {
    return (MemberDTO)this.sqlSession.selectOne("member.login", paramDTO);
  }
  
  public int getTotalRecord(String searchOption, String searchData) {
    Map<String, Object> map = new HashMap<>();
    map.put("searchOption", searchOption);
    map.put("searchData", searchData);
    return ((Integer)this.sqlSession.selectOne("member.getTotalRecord", map)).intValue();
  }
}

