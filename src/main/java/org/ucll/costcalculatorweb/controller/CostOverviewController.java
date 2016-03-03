/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatorweb.controller;

import facade.CostCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Arne
 */
@Controller
@RequestMapping(value="/cost")
public class CostOverviewController {
    
    @Autowired
    private CostCalculator costCalculator;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getCosts(){
        return new ModelAndView("costoverview", "costs", costCalculator.getAllCosts());
    }
    
}
