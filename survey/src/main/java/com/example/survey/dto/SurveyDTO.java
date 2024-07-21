package com.example.survey.dto;

import java.sql.Date;

public class SurveyDTO {
  private int surveyNo;
  
  private int memberNo;
  
  private String surveyTitle;
  
  private String surveySubTitle;
  
  private Date finalDate;
  
  public int getSurveyNo() {
    return this.surveyNo;
  }
  
  public void setSurveyNo(int surveyNo) {
    this.surveyNo = surveyNo;
  }
  
  public int getMemberNo() {
    return this.memberNo;
  }
  
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  
  public String getSurveyTitle() {
    return this.surveyTitle;
  }
  
  public void setSurveyTitle(String surveyTitle) {
    this.surveyTitle = surveyTitle;
  }
  
  public String getSurveySubTitle() {
    return this.surveySubTitle;
  }
  
  public void setSurveySubTitle(String surveySubTitle) {
    this.surveySubTitle = surveySubTitle;
  }
  
  public Date getFinalDate() {
    return this.finalDate;
  }
  
  public void setFinalDate(Date finalDate) {
    this.finalDate = finalDate;
  }
}
