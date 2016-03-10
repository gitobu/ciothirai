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
public class Relationship {
    private int relationship_id;
    private String relationship_no;
    private String relationship;
    
   public void setRelationship_id(int id){
	relationship_id = id;
	}
  public void setRelationship_no(String rn){
	relationship_no = rn;
	}
  public void setRelationship (String r){
      relationship = r;
        }	
 public int getRelationship_id() {   
    return relationship_id;
    }
 public String getRelationship_no(){
     return relationship_no;
 }
  public String getRelationship(){
     return relationship;
 }  
}
