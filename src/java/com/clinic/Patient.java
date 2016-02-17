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
public class Patient {
        private int patient_id;
   	private String patient_no;
   	private String first_name;
        private String middle_name;
	private String last_name;
        
   	private int gender;
	private String national_id;
	private String pin_no; 
        private String phone;
        
        private String vday;
        private String vmonth;
	private String vyear;
    
    	public void setPatient_id(int id){
        	patient_id = id;
		}
    	public void setPatient_no(String pn){
		patient_no = pn;
		}
    	public void setFirst_name (String fn){
        	first_name = fn;
        	}
        public void setMiddle_name (String mn){
                middle_name = mn;
        }
    	public void setLast_name (String pln){
        	last_name = pln;
        	}
    	public void setGender(int id){
		gender = id;
		}
    	public void setNational_id (String ni){
        	national_id = ni;
        	}
    	public void setPin_no(String pi){
		pin_no = pi;
		}
        public void setPhone (String ph){
                phone = ph;
                }
        
        public void setVday (String vd){
        	vday = vd;
        	}
        public void setVmonth (String vm){
        	vmonth = vm;
        	}
         public void setVyear (String vy){
        	vyear = vy;
        	}
    	public int getPatient_id(){
        	return patient_id;
        	}
    	public String getPatient_no(){
        	return patient_no;
        	}
    	public String getFirst_name(){
        	return first_name;
        	}
        public String getMiddle_name(){
                return middle_name;
                }
    	public String getLast_name(){
        	return last_name;
        	}
    	public int getGender() {   
        	return gender;
        	} 
    	public String getNational_id(){
        	return national_id;
        	}
    	public String getPin_no() {   
        	return pin_no;
        	} 
        public String getPhone(){
                return phone;
                }
        public String getVday(){
                return vday;
                }
         public String getVmonth(){
                return vmonth;
                }
          public String getVyear(){
                return vyear;
                }
}
