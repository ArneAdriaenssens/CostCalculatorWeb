/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatoruser.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import owner.domain.Owner;

/**
 *
 * @author arnea
 */
public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Owner.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "firstName", "", "Firstname can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "lastName", "", "Lastname can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "email","", "Email can't be empty");
        ValidationUtils.rejectIfEmpty(errors, "password","", "Password can't be empty");
        Owner nu = (Owner) o;
        String USERID_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        if(nu.getEmail()!=null){
            Pattern p = Pattern.compile(USERID_PATTERN);
            Matcher m = p.matcher(nu.getEmail());
            if(!m.matches())errors.rejectValue("email", "", "Email has wrong format");
        }
        
    }
    
}
