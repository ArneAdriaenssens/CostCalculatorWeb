package org.ucll.costcalculatorcost.controller;

import cost.domain.Category;
import cost.domain.Cost;
import facade.CostCalculator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.ucll.webservice.WebServiceExchange;
import owner.domain.Owner;

/**
 *
 * @author Arne
 */
@Controller
@RequestMapping(value="/cost")
public class CostController {
    
    @Autowired
    private CostCalculator costCalculator;
    
    private WebServiceExchange webExchange;
    
    private boolean edit;
    
    public CostController(){
        this.webExchange=new WebServiceExchange();
    }
        
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView getCosts(HttpServletRequest req){
        Owner owner = (Owner)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index", "user", new Owner());
        List<Cost> costs = costCalculator.getCostsByEmail(owner.getEmail());
        ModelAndView model = new ModelAndView("costOverview");
        model.addObject("costs", costs);
        model.addObject("total", costCalculator.calculateAmountOfCostsForUser(owner.getEmail()));
        model.addObject("totalPrice", costCalculator.calculateTotalPriceForUser(owner.getEmail()));
        model.addObject("exchange", webExchange.getExchange());
        return model;
    }
    
    @RequestMapping(value="/new", method=RequestMethod.GET)
    public ModelAndView getCostForm(HttpServletRequest req){
        Owner owner = (Owner)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index", "user", new Owner());
        this.edit=false;
        ModelAndView model = new ModelAndView("costForm");
        model.addObject("cost", new Cost());
        model.addObject("categories", Category.values());
        return model;
    }
    
    @RequestMapping(method = RequestMethod.POST, value="/save")
    public String saveCost(@ModelAttribute("cost") Cost cost, BindingResult result, HttpServletRequest req){
        if(result.hasErrors()){
            req.setAttribute("categories", Category.values());
            return "costForm";
        }
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
        Owner owner = (Owner)req.getSession().getAttribute("owner");
        if(owner==null) return new ModelAndView("index", "user", new Owner());
        this.edit=true;
        ModelAndView model = new ModelAndView("costForm");
        model.addObject("cost", costCalculator.getCostById(id));
        model.addObject("categories", Category.values());
        return model;
    }
    
}
