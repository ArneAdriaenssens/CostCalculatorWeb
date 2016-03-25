/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatoruser.controller;

import facade.CostCalculator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import owner.domain.Owner;

/**
 *
 * @author Arne
 */
@Controller
@RequestMapping(value="/user")
public class UserController {
    
    @Autowired
    private UserValidator validator;
    
    @Autowired
    private CostCalculator costCalculator;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getIndex(){
        return new ModelAndView("index", "user", new Owner());
    }
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("user") Owner user,BindingResult result, HttpServletRequest req){
        validator.validate(user, result);
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        Owner owner = costCalculator.getUserByEmail(email);
        if(owner==null)return "index";
        if(!owner.isSamePassword(pass)) return "index";
        HttpSession session = req.getSession();
        session.setAttribute("owner", owner);
        return "index";
    }
    
    @RequestMapping(method = RequestMethod.GET, value="/logout")
    public String logout(HttpServletRequest req){
        req.getSession().removeAttribute("owner");
        return "redirect:/user.htm";
    }
    
    @RequestMapping(method = RequestMethod.GET, value="/register")
    public ModelAndView getRegisterForm(HttpServletRequest req){
        return new ModelAndView("registerForm", "newUser", new Owner() );
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/save")
    public String register(@ModelAttribute("newUser") Owner owner, BindingResult result){
        validator.validate(owner, result);
        if(result.hasErrors()){
            return "registerForm";
        }
        costCalculator.addUser(owner);
        return "redirect:/user.htm";
    }
    
}
