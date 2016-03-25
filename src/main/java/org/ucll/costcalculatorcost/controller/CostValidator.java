/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatorcost.controller;

import cost.domain.Cost;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author arnea
 */
@Component
public class CostValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
       return Cost.class.equals(type); 
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "location", "", "Location can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "description", "", "Description can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "price","", "Price can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "owner","", "You are logged out, please log in again");
        Cost cost = (Cost) o;
        if(cost.getPrice()<=0) errors.rejectValue("price", "", "Price must be greater then 0.");
    }
    
}
