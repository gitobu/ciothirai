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
public class Medical_history {
            private int medical_history_id; 
            private int patient_id;
            private String time_period; 
            private String issue; 
            private String how_treated; 
            private String current_status;
            
    public void setMedical_history_id(int id){
           medical_history_id = id;
    }
    public void setPatient_id(int pid){
           patient_id = pid;
    }
    public void setTime_period (String tp){
         time_period = tp;
    }	
    public void setIssue (String i){
         issue = i;
    }
    public void setHow_treated (String ht){
         how_treated = ht;
    }
    public void setCurrent_status (String cs){
         current_status = cs;
    }
    public int getMedical_history_id() {   
       return medical_history_id;
    }
    public int getPatient_id(){
        return patient_id;
    }
    public String getTime_period(){
        return time_period;
    }
    public String getIssue(){
        return issue;
    }
    public String getHow_treated(){
        return how_treated;
    }
    public String getCurrent_status(){
        return current_status;
    }
}
