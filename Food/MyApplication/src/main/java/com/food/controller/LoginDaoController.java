package com.food.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.food.model.Menu_Table;
import com.food.model.User_Table;
import com.food.services.UserTableService;

@Controller
@SessionAttributes("user")
public class LoginDaoController {
	@Autowired
	UserTableService userTableService;
	@Autowired
	UserDaoController userDaoController;

	@ModelAttribute("user")
	public User_Table setUpUserForm() {
		return new User_Table();
	}

	@RequestMapping("/")
	public String home() {
		return "welcomepage";
	}

	@RequestMapping("/welcomepage")
	public String welcomepage() {
		return "welcomepage";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/register")
	public String registration() {
		return "registerpage";
	}

	@PostMapping("/save-user")
	public ModelAndView registerUser(User_Table user_table) {
		ModelAndView model = new ModelAndView("login");
		try {
			User_Table userInfo = userTableService.saveMyUser(user_table);
			String message = "Not registered.. Try Again!!";
			if (userInfo != null) {
				List<User_Table> myuserList = userTableService.FetchMyUser();
				for (var user : myuserList) {
					if ((user.getUser_name().equals(user_table.getUser_name()))
							&& (user.getAddress().equals(user_table.getAddress()))
							&& (user.getEmail().equals(user_table.getEmail()))
							&& (user.getPassword().equals(user_table.getPassword()))
							&& (user.getPh_number() == user_table.getPh_number()))
						message = "Successfull Registered for User Id :  " + user.getUser_id();
				}
			}
			model.addObject("message", message);
		} catch (Exception exception) {
			System.out.println("Exception caught in registerUser Method :" + exception);
		}
		return model;
	}

	@PostMapping("/validateuser")
	public ModelAndView validateUser(@ModelAttribute("user") User_Table user_table, Model model) {
		String ret = "login";
		ModelAndView model1 = new ModelAndView();
		try {
			List<User_Table> myUserList = userTableService.FetchMyUser();
			String customer = null;
			List<Menu_Table> todaysMenu = new ArrayList<Menu_Table>();
			for (var myUser : myUserList) {
				if (myUser.getUser_id() == user_table.getUser_id()) {
					User_Table userInfo = userTableService.validateMyUser(user_table);
					if ((userInfo.getUser_id() == user_table.getUser_id())
							&& (userInfo.getPassword().equals(user_table.getPassword())
									&& (userInfo.getRole().equals("user")))) {
						todaysMenu = userDaoController.todaysMenu();
						customer = myUser.getUser_name();
						ret = "userhomepage";
					} else if ((userInfo.getUser_id() == user_table.getUser_id())
							&& (userInfo.getPassword().equals(user_table.getPassword())
									&& (userInfo.getRole().equals("admin"))))
						ret = "AdminInterface";
				}
			}
			model1 = new ModelAndView(ret);
			model1.addObject("message", "Enter Valid Credentials");
			model1.addObject("todays_menu", todaysMenu);
			model1.addObject("msg", "USER");
			model1.addObject("cust", customer);
			model1.addObject("path", "../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in validateUser Method :" + exception);
		}
		return model1;
	}
}
