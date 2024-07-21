package com.example.survey.dto;

import java.sql.Date;

public class MemberDTO {
  private int memberNo;
  
  private String memberName;
  
  private String memberGender;
  
  private String memberId;
  
  private String memberPasswd;
  
  private String memberPhone1;
  
  private String memberPhone2;
  
  private String memberPhone3;
  
  private String memberEmail1;
  
  private String memberEmail2;
  
  private Date joinDate;
  
  private int rank;
  
  public int getMemberNo() {
    return this.memberNo;
  }
  
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  
  public String getMemberName() {
    return this.memberName;
  }
  
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  
  public String getMemberGender() {
    return this.memberGender;
  }
  
  public void setMemberGender(String memberGender) {
    this.memberGender = memberGender;
  }
  
  public String getMemberId() {
    return this.memberId;
  }
  
  public void setMemberId(String memberId) {
    this.memberId = memberId;
  }
  
  public String getMemberPasswd() {
    return this.memberPasswd;
  }
  
  public void setMemberPasswd(String memberPasswd) {
    this.memberPasswd = memberPasswd;
  }
  
  public String getMemberPhone1() {
    return this.memberPhone1;
  }
  
  public void setMemberPhone1(String memberPhone1) {
    this.memberPhone1 = memberPhone1;
  }
  
  public String getMemberPhone2() {
    return this.memberPhone2;
  }
  
  public void setMemberPhone2(String memberPhone2) {
    this.memberPhone2 = memberPhone2;
  }
  
  public String getMemberPhone3() {
    return this.memberPhone3;
  }
  
  public void setMemberPhone3(String memberPhone3) {
    this.memberPhone3 = memberPhone3;
  }
  
  public String getMemberEmail1() {
    return this.memberEmail1;
  }
  
  public void setMemberEmail1(String memberEmail1) {
    this.memberEmail1 = memberEmail1;
  }
  
  public String getMemberEmail2() {
    return this.memberEmail2;
  }
  
  public void setMemberEmail2(String memberEmail2) {
    this.memberEmail2 = memberEmail2;
  }
  
  public Date getJoinDate() {
    return this.joinDate;
  }
  
  public void setJoinDate(Date joinDate) {
    this.joinDate = joinDate;
  }
  
  public int getRank() {
    return this.rank;
  }
  
  public void setRank(int rank) {
    this.rank = rank;
  }
}
