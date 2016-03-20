/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.ucll.costcalculatorweb.controller;

import cost.domain.Cost;
import facade.CostCalculator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import user.domain.User;

/**
 *
 * @author Arne
 */
@Controller
@RequestMapping(value="/cost")
public class CostOverviewController {
    
    @Autowired
    private CostCalculator costCalculator;
    private boolean edit;
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getCosts(HttpServletRequest req){
        User owner = (User)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index");
        List<Cost> costs = owner.getCosts();
        return new ModelAndView("costOverview", "costs", costs);
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView getCostForm(HttpServletRequest req){
        User owner = (User)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index");
        this.edit=false;
        return new ModelAndView("costForm", "newCost", new Cost() );
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/save")
    public String saveCost(@ModelAttribute("newCost") Cost cost, HttpServletRequest req){
        cost.setOwner((User)req.getSession().getAttribute("owner"));
        if(!edit){
            costCalculator.addCost(cost);
        }
        else{
            costCalculator.updateCost(cost);
        }
        this.edit=false;
        return "redirect:/cost.htm";
    }
    
    @RequestMapping(value="/{id}", method = RequestMethod.GET )
    public ModelAndView getEditForm(@PathVariable long id, HttpServletRequest req){
        User owner = (User)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index");
        this.edit=true;
        return new ModelAndView("costForm", "newCost", costCalculator.getCostById(id));
    }
    
}
