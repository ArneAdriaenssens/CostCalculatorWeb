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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import user.domain.User;

/**
 *
 * @author Arne
 */
@Controller
@RequestMapping(value="/user")
public class UserController {
    
    @Autowired
    private CostCalculator costCalculator;
    
    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String login(HttpServletRequest req){
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        User owner = costCalculator.getUserByEmail(email);
        if(owner==null)return "index";
        if(!owner.isSamePassword(pass)) return "index";
        HttpSession session = req.getSession();
        session.setAttribute("owner", owner);
        return "index";
    }
    
    @RequestMapping(method = RequestMethod.GET, value="/logout")
    public String logout(HttpServletRequest req){
        req.getSession().removeAttribute("owner");
        return "index";
    }
    
    @RequestMapping(method = RequestMethod.GET, value="/register")
    public ModelAndView getRegisterForm(HttpServletRequest req){
        return new ModelAndView("registerForm", "newUser", new User() );
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/save")
    public String register(@ModelAttribute("newUser") User user){
        costCalculator.addUser(user);
        return "redirect:/index.htm";
    }
    
}
