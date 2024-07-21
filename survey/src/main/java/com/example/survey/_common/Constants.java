package com.example.survey._common;

import java.io.File;

public class Constants {
	  public static final String ATTACH_PATH = "C:/cys/attach";
	  
	  public static final int ATTACH_MAX_UPLOAD = 10485760;
	  
	  public static String getFileExtension(File file) {
	    String name = file.getName();
	    int lastIndexOfDot = name.lastIndexOf('.');
	    if (lastIndexOfDot == -1)
	      return ""; 
	    return name.substring(lastIndexOfDot + 1);
	  }
	  
	  public int[] getPage(int pageNumber, int pageSize, int blockSize, int totalRecord) {
	    int[] result = new int[6];
	    int startRecord = pageSize * (pageNumber - 1) + 1;
	    int lastRecord = pageSize * pageNumber;
	    if (lastRecord > totalRecord)
	      lastRecord = totalRecord; 
	    int totalPage = 0;
	    int startPage = 1;
	    int lastPage = 1;
	    if (totalRecord > 0) {
	      totalPage = totalRecord / pageSize + ((totalRecord % pageSize == 0) ? 0 : 1);
	      startPage = (pageNumber / blockSize - ((pageNumber % blockSize != 0) ? 0 : 1)) * blockSize + 1;
	      lastPage = startPage + blockSize - 1;
	      if (lastPage > totalPage)
	        lastPage = totalPage; 
	    } 
	    int jj = totalRecord - pageSize * (pageNumber - 1);
	    result[0] = totalPage;
	    result[1] = startPage;
	    result[2] = lastPage;
	    result[3] = startRecord;
	    result[4] = lastRecord;
	    result[5] = jj;
	    return result;
	  }
	}
