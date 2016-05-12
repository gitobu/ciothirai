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
public class Inventory {
 
        private int inventory_id;
   	private int drug_id;
	private int quantity;
	
        
        private String vday;
        private String vmonth;
	private String vyear;
    
    	public void setInventory_id(int id){
        	inventory_id = id;
		}
    	public void setDrug_id(int di){
		drug_id = di;
		}
    	public void setQuantity (int qt){
        	quantity = qt;
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
    	public int getInventory_id(){
        	return inventory_id;
        	}
    	public int getDrug_id(){
        	return drug_id;
        	}
    	public int getQuantity(){
        	return quantity;
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
