package com.food.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.food.model.Image;
import com.food.model.Menu_Table;
import com.food.repository.MenuTableRepository;
import com.food.services.AdminUpdateService;

@Controller
public class AdminDaoController {
	@Autowired
	AdminUpdateService adminUpdateService;
	@Autowired
	MenuTableRepository menuTableRepository;
	Image image = new Image();

	@RequestMapping("/updateAdminpage")
	public String updateAdminPage() {
		return "UpdateAdmin";
	}

	@RequestMapping(value = "/UpdateAdmin")
	public ModelAndView postAdminUpdate(Menu_Table adminUpdate) {
		ModelAndView model = new ModelAndView("AdminInterface");
		try {
			List<String> imageList = image.imageList();
			for (var img : imageList) {
				if (img.equalsIgnoreCase(adminUpdate.getDish_Name())) {
					System.out.println("entered");
					String dishImage = adminUpdate.getDish_Name() + ".jpg";
					adminUpdate.setDish_img(dishImage);
					break;
				} else
					adminUpdate.setDish_img("Default.jpg");
			}
			System.out.println(adminUpdate);
			adminUpdateService.saveMenuDetails(adminUpdate);
			model.addObject(adminUpdate);
			model.addObject("path", "Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in postAdminUpdate Method :" + exception);
		}
		return model;
	}

	@RequestMapping(value = "/updatedItemsDetails")
	public String displayAdminUpdates(ModelMap modelMap) {
		try {
			modelMap.put("Items", menuTableRepository.findAll());
			modelMap.put("path", "Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in displayAdminUpdates Method :" + exception);
		}
		return "index";
	}

	@RequestMapping("/AdminInterfacePage")
	public String AdminInterfacePage() {
		return "AdminInterface";
	}

	@RequestMapping("/delete/{dishName}")
	public ModelAndView deleteDish(@PathVariable("dishName") String dishName) {
		ModelAndView model = new ModelAndView("index");
		try {
			adminUpdateService.deletedish(dishName);
			model.addObject("Items", menuTableRepository.findAll());
			model.addObject("path", "../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in deleteDish Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/edit/{dishName}/{availableQuantity}/{price}/{ingredients}")
	public ModelAndView editDish(@PathVariable("dishName") String dishName,
			@PathVariable("availableQuantity") int availableQuantity, @PathVariable("price") float price,
			@PathVariable("ingredients") String ingredients) {
		ModelAndView model = new ModelAndView("UpdateAdmin");
		try {
			Menu_Table dish = new Menu_Table(dishName, availableQuantity, price, ingredients);
			adminUpdateService.saveDish(dish);
			model.addObject("Items", menuTableRepository.findAll());
		} catch (Exception exception) {
			System.out.println("Exception caught in editDish Method :" + exception);
		}
		return model;
	}
}