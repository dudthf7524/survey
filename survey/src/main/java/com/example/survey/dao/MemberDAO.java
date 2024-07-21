package com.example.survey.dao;

import com.example.survey.dto.MemberDTO;
import java.util.List;

public interface MemberDAO {
  List<MemberDTO> getSelectAll(int paramInt1, int paramInt2, String paramString1, String paramString2);
  
  MemberDTO getSelectOne(MemberDTO paramMemberDTO);
  
  int setInsert(MemberDTO paramMemberDTO);
  
  int setUpdate(MemberDTO paramMemberDTO);
  
  int setDelete(MemberDTO paramMemberDTO);
  
  MemberDTO login(MemberDTO paramMemberDTO);
  
  int getTotalRecord(String paramString1, String paramString2);
}
