package com.food.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import com.food.model.Menu_Table;
import com.food.model.Order_Table;
import com.food.model.User_Table;
import com.food.services.AdminUpdateService;
import com.food.services.UserService;
import com.food.services.UserTableService;

@Controller
@RequestMapping("/user")
public class UserDaoController {
	private static final int ONE = 1;
	private static final int ZERO = 0;
	@Autowired
	AdminUpdateService adminUpdateService;
	@Autowired
	UserService userService;
	@Autowired
	UserTableService userTableService;

	@RequestMapping("/logout")
	public String login(@SessionAttribute("user") User_Table user) {
		try {
			if (user.getUser_id() != ZERO)
				user.setUser_id(ZERO);
		} catch (Exception exception) {
			System.out.println("Exception caught in login Method :" + exception);
		}
		return "login";
	}

	public List<Menu_Table> todaysMenu() {
		List<Menu_Table> todaysMenuList = new ArrayList<Menu_Table>();
		try {
			LocalDate date = LocalDate.now();
			List<Menu_Table> dishMenuList = adminUpdateService.menuList();
			System.out.println(dishMenuList);
			for (var dishMenu : dishMenuList) {
				if (dishMenu.getDateOfUpdation().equals(date.toString()) && (dishMenu.getAvailableQuantity() > ZERO))
					todaysMenuList.add(dishMenu);
				System.out.println(todaysMenuList);
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in todaysMenu Method :" + exception);
		}
		return todaysMenuList;
	}

	@RequestMapping("/userHomePage")
	public ModelAndView userHomePage(String search_dish, @SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("userhomepage");
		try {
			model.addObject("todays_menu", todaysMenu());
			model.addObject("path", "../Images/");
			if (user.getUser_id() == ZERO)
				model.addObject("cust", null);
			else {
				User_Table userInfo = userTableService.FetchUserName(user.getUser_id());
				model.addObject("cust", userInfo.getUser_name());
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in userHomePage Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/searchDish")
	public ModelAndView searchDish(@SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("searchDish1");
		try {
			if (user.getUser_id() == ZERO)
				model.addObject("msg", null);
		} catch (Exception exception) {
			System.out.println("Exception caught in searchDish Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/searchDishOpr")
	public ModelAndView searchDishOperation(String search_dish, @SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("searchDish");
		try {
			List<Menu_Table> dishMenuList = userService.searchMenuList(search_dish);
			model.addObject("SearchRes", dishMenuList);
			model.addObject("search_key", search_dish);
			if (user.getUser_id() != ZERO)
				model.addObject("msg1", "notNull");
			else
				model.addObject("msg1", null);
			if (dishMenuList.isEmpty()) {
				model.addObject("msg", "No Result Found for Search ");
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in searchDishOperation Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/searchOrder")
	public String searchOrder() {
		return "searchOrder1";
	}

	@RequestMapping("/searchOrderOpr")
	public ModelAndView searchOrderOperation(@SessionAttribute("user") User_Table user, String search_order) {
		ModelAndView model = new ModelAndView("searchOrder");
		try {
			List<Order_Table> orderList = userService.searchOrderList1(search_order, user.getUser_id());
			List<Order_Table> orderList1 = new ArrayList<Order_Table>();
			for (int j = orderList.size() - ONE; j >= ZERO; j--) {
				orderList1.add(orderList.get(j));
			}
			model.addObject("SearchRes", orderList1);
			model.addObject("search_key", search_order);
			if (orderList.isEmpty()) {
				model.addObject("msg", "No Result Found for Search ");
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in searchOrderOperation Method :" + exception);
		}
		return model;
	}
}