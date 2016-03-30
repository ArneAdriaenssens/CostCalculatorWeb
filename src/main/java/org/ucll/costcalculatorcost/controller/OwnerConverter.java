/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatorcost.controller;

import facade.CostCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import owner.domain.Owner;

/**
 *
 * @author arnea
 */
public class OwnerConverter implements Converter<String, Owner>{
    
    @Autowired
    private CostCalculator costCalculator;
    
    public OwnerConverter(){
        super();
    }
    
    @Override
    public Owner convert(String email) {
        Owner owner = null;
        try{ 
            owner = costCalculator.getUserByEmail(email);
        } catch(Exception e){
            System.out.println(e);
        }
        return owner;
    }
}
