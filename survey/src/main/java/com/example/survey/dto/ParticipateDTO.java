package com.example.survey.dto;

import java.sql.Date;

public class ParticipateDTO {
  private String selectedQuestion;
  
  private String selectedAnswer;
  
  private int participateNo;
  
  private int surveyNo;
  
  private int surveyQnANo;
  
  private int memberNo;
  
  private String answerContent;
  
  private Date participateDate;
  
  private String answer1;
  
  private String answer2;
  
  private String answer3;
  
  private String answer4;
  
  private String answer5;
  
  public String getAnswer1() {
    return this.answer1;
  }
  
  public void setAnswer1(String answer1) {
    this.answer1 = answer1;
  }
  
  public String getAnswer2() {
    return this.answer2;
  }
  
  public void setAnswer2(String answer2) {
    this.answer2 = answer2;
  }
  
  public String getAnswer3() {
    return this.answer3;
  }
  
  public void setAnswer3(String answer3) {
    this.answer3 = answer3;
  }
  
  public String getAnswer4() {
    return this.answer4;
  }
  
  public void setAnswer4(String answer4) {
    this.answer4 = answer4;
  }
  
  public String getAnswer5() {
    return this.answer5;
  }
  
  public void setAnswer5(String answer5) {
    this.answer5 = answer5;
  }
  
  public String getSelectedQuestion() {
    return this.selectedQuestion;
  }
  
  public void setSelectedQuestion(String selectedQuestion) {
    this.selectedQuestion = selectedQuestion;
  }
  
  public String getSelectedAnswer() {
    return this.selectedAnswer;
  }
  
  public void setSelectedAnswer(String selectedAnswer) {
    this.selectedAnswer = selectedAnswer;
  }
  
  public int getParticipateNo() {
    return this.participateNo;
  }
  
  public void setParticipateNo(int participateNo) {
    this.participateNo = participateNo;
  }
  
  public int getSurveyNo() {
    return this.surveyNo;
  }
  
  public void setSurveyNo(int surveyNo) {
    this.surveyNo = surveyNo;
  }
  
  public int getSurveyQnANo() {
    return this.surveyQnANo;
  }
  
  public void setSurveyQnANo(int surveyQnANo) {
    this.surveyQnANo = surveyQnANo;
  }
  
  public int getMemberNo() {
    return this.memberNo;
  }
  
  public void setMemberNo(int memberNo) {
    this.memberNo = memberNo;
  }
  
  public String getAnswerContent() {
    return this.answerContent;
  }
  
  public void setAnswerContent(String answerContent) {
    this.answerContent = answerContent;
  }
  
  public Date getParticipateDate() {
    return this.participateDate;
  }
  
  public void setParticipateDate(Date participateDate) {
    this.participateDate = participateDate;
  }
}
