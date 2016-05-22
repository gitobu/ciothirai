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

public class Appointment {
    private int appointment_id;
    private int patient_id;
    private int service_type_id;
    private String vday;
    private String vmonth;
    private String vyear;
    
    public void setAppointment_id (int a){
         appointment_id = a;
    }
    public void setPatient_id (int p){
        patient_id = p;
    }
    public void setService_type_id (int st){
         service_type_id = st;
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
    public int getAppointment_id(){
        return appointment_id;
    } 
    public int getPatient_id(){
        return patient_id;
    }
    private int getService_type_id(){
        return service_type_id;
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
