package com.example.survey._common;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class Util {
  public Map<String, String> getServerInfoMap(HttpServletRequest request, String pageNumber_) {
    String referer = request.getHeader("REFERER");
    if (referer == null || referer.trim().equals(""))
      referer = ""; 
    String path = request.getContextPath();
    String url = request.getRequestURI().toString();
    String uri = request.getRequestURI().toString();
    String ip = "-";
    try {
      ip = Inet4Address.getLocalHost().getHostAddress();
    } catch (UnknownHostException e) {
      e.printStackTrace();
    } 
    String ip6 = request.getHeader("X-Forwarded-For");
    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6))
      ip6 = request.getHeader("Proxy-Client-IP"); 
    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6))
      ip6 = request.getHeader("WL-Proxy-Client-IP"); 
    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6))
      ip6 = request.getHeader("HTTP_Client_IP"); 
    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6))
      ip6 = request.getHeader("HTTP_X_FORWARDED_FOR"); 
    if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6))
      ip6 = request.getRemoteAddr(); 
    pageNumber_ = request.getParameter("pageNumber");
    int pageNumber = getNumberCheck(pageNumber_, 1);
    String[] imsiArray = url.split("/");
    String folderName = imsiArray[imsiArray.length - 2];
    String fileName = imsiArray[imsiArray.length - 1];
    Map<String, String> map = new HashMap<>();
    map.put("referer", referer);
    map.put("path", path);
    map.put("url", url);
    map.put("uri", uri);
    map.put("ip", ip);
    map.put("ip6", ip6);
    map.put("pageNumber", (new StringBuilder(String.valueOf(pageNumber))).toString());
    map.put("folderName", folderName);
    map.put("fileName", fileName);
    return map;
  }
  
  private int getNumberCheck(String str, int defaultStr) {
    int result = 0;
    String temp = str;
    if (temp == null || temp.trim().equals(""))
      temp = "-"; 
    for (int i = 0; i <= 9; i++)
      temp = temp.replace((new StringBuilder(String.valueOf(i))).toString(), ""); 
    if (temp.equals("")) {
      result = Integer.parseInt(str);
    } else {
      result = defaultStr;
    } 
    return result;
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

