/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.clinic;

/**
 *
 * @author Gitobu
 */
public class JobTitle {
    private int job_title_id;
    private String job_title_no;
    private String job_title;
    
   public void setJob_title_id(int id){
	job_title_id = id;
	}
  public void setJob_title_no(String jtn){
	job_title_no = jtn;
	}
  public void setJob_title (String t){
      job_title = t;
        }	
 public int getJob_title_id() {   
    return job_title_id;
    }
 public String getJob_title_no(){
     return job_title_no;
 }
  public String getJob_title(){
     return job_title;
 }
}