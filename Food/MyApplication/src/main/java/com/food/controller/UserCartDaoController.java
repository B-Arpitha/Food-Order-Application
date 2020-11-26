package com.food.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import com.food.model.Cart_Table;
import com.food.model.Menu_Table;
import com.food.model.User_Table;
import com.food.repository.CartTableRepository;
import com.food.repository.MenuTableRepository;
import com.food.repository.OrderTableRepository;
import com.food.services.UserCartService;

@Controller
@RequestMapping("/user")
public class UserCartDaoController {
	private static final int ONE = 1;
	private static final int ZERO = 0;
	@Autowired
	UserCartService userTableService;
	@Autowired
	MenuTableRepository menuRepository;
	@Autowired
	CartTableRepository cartRepository;
	@Autowired
	OrderTableRepository orderRepository;
	LocalDate date = LocalDate.now();

	@RequestMapping("/viewmenu")
	public ModelAndView viewMenu() {
		ModelAndView model = new ModelAndView("menudetails");
		try {
			List<Menu_Table> menuList = userTableService.viewMenu();
			model.addObject("list", menuList);
		} catch (Exception exception) {
			System.out.println("Exception caught in viewMenu Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/addwithQuant/{dish_Name}")
	public ModelAndView addQuant(@PathVariable("dish_Name") String dish_Name) {
		ModelAndView model = new ModelAndView("AddCartQuantTable");
		try {
			Menu_Table dishMenu = menuRepository.findById(dish_Name).get();
			model.addObject("list", dishMenu);
			model.addObject("path", "../../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in addQuant Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/addToCart/{dish_Name}")
	public ModelAndView addToCart1(@PathVariable("dish_Name") String dish_Name, @RequestParam int quantity,
			@SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("cart");
		try {
			Menu_Table dishMenu = menuRepository.findById(dish_Name).get();
			float totalPrice = ZERO;
			List<Cart_Table> cartlist = (List<Cart_Table>) cartRepository.findAll();
			List<Cart_Table> cartlist1 = new ArrayList<Cart_Table>();
			Cart_Table cartTable = new Cart_Table();
			for (var cart : cartlist) {
				if ((cart.getUser_id() == user.getUser_id()) && (cart.getDate_of_insert().equals(date.toString())))
					cartlist1.add(cart);
			}
			String success = null;
			for (var cart : cartlist1) {
				if (cart.getDish_name().equals(dish_Name)) {
					int quant = ONE;
					if ((cart.getQuantity() + quantity) > dishMenu.getAvailable_Quantity())
						quant = dishMenu.getAvailable_Quantity();
					else if ((cart.getQuantity() + quantity) < ONE)
						quant = ONE;
					else
						quant = cart.getQuantity() + quantity;
					cart.setQuantity(quant);
					cart.setPrice(dishMenu.getPrice() * quant);
					cartRepository.save(cart);
					success = "sucess";
					model.addObject("msd", "Successfully Updated in cart for Cart Id:" + cart.getCart_id());
					break;
				}
			}
			if (success == null) {
				int quant = ONE;
				if (quantity > dishMenu.getAvailable_Quantity())
					quant = dishMenu.getAvailable_Quantity();
				else if (quantity < ONE)
					quant = ONE;
				cartTable.setDish_img(dishMenu.getDish_img());
				cartTable.setDish_name(dish_Name);
				cartTable.setPrice(dishMenu.getPrice() * quant);
				cartTable.setQuantity(quant);
				cartTable.setUser_id(user.getUser_id());
				cartTable.setDate_of_insert(date.toString());
				cartRepository.save(cartTable);
			}
			List<Cart_Table> cartTableList = (List<Cart_Table>) cartRepository.findAll();
			List<Cart_Table> cartTableList1 = new ArrayList<Cart_Table>();
			for (var cart : cartTableList) {
				if ((cart.getDish_img().equals(cartTable.getDish_img()))
						&& (cart.getDish_name().equals(cartTable.getDish_name()))
						&& (cart.getPrice() == cartTable.getPrice()) && (cart.getQuantity() == cartTable.getQuantity()))
					model.addObject("msd", "Successfully Added into cart for Cart Id:" + cart.getCart_id());
				if ((cart.getUser_id() == user.getUser_id()) && (cart.getDate_of_insert().equals(date.toString())))
					cartTableList1.add(cart);
			}
			for (var cart : cartTableList1)
				totalPrice = totalPrice + cart.getPrice();
			model.addObject("tp", totalPrice);
			model.addObject("list", cartTableList1);
			model.addObject("path", "../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in addToCart1 Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/addToCart/{dish_Name}/{quantity}")
	public ModelAndView addToCart(@PathVariable("dish_Name") String dish_Name, @PathVariable("quantity") int quantity,
			Model model, @SessionAttribute("user") User_Table user) {
		ModelAndView model1 = new ModelAndView("cart");
		try {
			Menu_Table dishMenu = menuRepository.findById(dish_Name).get();

			float totalPrice = ZERO;
			Cart_Table cartDetails = new Cart_Table();
			cartDetails.setDish_img(dishMenu.getDish_img());
			cartDetails.setDish_name(dish_Name);
			cartDetails.setPrice(dishMenu.getPrice() * quantity);
			cartDetails.setQuantity(quantity);
			cartDetails.setUser_id(user.getUser_id());
			cartDetails.setDate_of_insert(date.toString());
			cartRepository.save(cartDetails);
			List<Cart_Table> cartList = (List<Cart_Table>) cartRepository.findAll();
			List<Cart_Table> cartList1 = new ArrayList<Cart_Table>();

			for (var cart : cartList) {
				if ((cart.getDish_img().equals(cartDetails.getDish_img()))
						&& (cart.getDish_name().equals(cartDetails.getDish_name()))
						&& (cart.getPrice() == cartDetails.getPrice())
						&& (cart.getQuantity() == cartDetails.getQuantity()))
					model1.addObject("msd", "Successfully Updated in cart for Cart Id:" + cart.getCart_id());
				if ((cart.getUser_id() == cartDetails.getUser_id())
						&& (cart.getDate_of_insert().equals(date.toString())))
					cartList1.add(cart);
			}
			for (var cart : cartList1)
				totalPrice = totalPrice + cart.getPrice();
			model1.addObject("tp", totalPrice);
			model1.addObject("list", cartList1);
			model1.addObject("path", "../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in addToCart Method :" + exception);
		}
		return model1;
	}

	@RequestMapping("/viewCart")
	public ModelAndView viewCart(@SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("cart");
		try {
			List<Cart_Table> cartList = (List<Cart_Table>) cartRepository.findAll();

			List<Cart_Table> cartList1 = new ArrayList<Cart_Table>();
			float totalPrice = ZERO;

			for (var cart : cartList) {
				if ((cart.getUser_id() == user.getUser_id()) && (cart.getDate_of_insert().equals(date.toString())))
					cartList1.add(cart);
			}
			for (var cart : cartList1)
				totalPrice = totalPrice + cart.getPrice();
			model.addObject("tp", totalPrice);
			model.addObject("list", cartList1);
			model.addObject("path", "../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in viewCart Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/deleteCart/{cart_id}")
	public ModelAndView deleteCartId(@PathVariable("cart_id") int cart_id, @SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("cart");
		try {
			cartRepository.deleteById(cart_id);
			float totalPrice = ZERO;
			List<Cart_Table> cartList = (List<Cart_Table>) cartRepository.findAll();
			List<Cart_Table> cartList1 = new ArrayList<Cart_Table>();

			for (var cart : cartList) {
				if ((cart.getUser_id() == user.getUser_id()) && (cart.getDate_of_insert().equals(date.toString())))
					cartList1.add(cart);
			}
			for (var i : cartList1)
				totalPrice = totalPrice + i.getPrice();
			model.addObject("list", cartList1);
			model.addObject("tp", totalPrice);
			model.addObject("list", cartList1);
			model.addObject("path", "../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in deleteCartId Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/editQuantity/{cart_id}")
	public ModelAndView editCartTable(@PathVariable("cart_id") int cart_id) {
		ModelAndView model = new ModelAndView("editCartQuantTable");
		try {
			Cart_Table cartDetails = cartRepository.findById(cart_id).get();

			model.addObject("list", cartDetails);
			model.addObject("path", "../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in editCartTable Method :" + exception);
		}
		return model;
	}

	@RequestMapping("/editCartQuantOpr/{cart_id}/{dish_name}")
	public ModelAndView editCartOperation(@RequestParam int quantity, @PathVariable("cart_id") int cart_id,
			@PathVariable("dish_name") String dish_name, @SessionAttribute("user") User_Table user) {
		ModelAndView model = new ModelAndView("cart");
		try {
			float totalPrice = ZERO;
			Menu_Table dishMenu = menuRepository.findById(dish_name).get();

			if ((dishMenu.getAvailable_Quantity() >= quantity) && (quantity > ZERO)) {
				Cart_Table cartDetails = cartRepository.findById(cart_id).get();
				cartDetails.setQuantity(quantity);
				cartDetails.setPrice(dishMenu.getPrice() * quantity);
				cartRepository.save(cartDetails);
				model.addObject("msd", "Quantity Successfully Updated");
			} else
				model.addObject("msd", "Quantity Not Updated Out of Range");
			List<Cart_Table> cartList = (List<Cart_Table>) cartRepository.findAll();
			List<Cart_Table> cartList1 = new ArrayList<Cart_Table>();
			for (var cart : cartList) {
				if ((cart.getUser_id() == user.getUser_id()) && (cart.getDate_of_insert().equals(date.toString())))
					cartList1.add(cart);
			}
			for (var cart : cartList1)
				totalPrice = totalPrice + cart.getPrice();
			model.addObject("list", cartList1);
			model.addObject("tp", totalPrice);
			model.addObject("path", "../../../Images/");
		} catch (Exception exception) {
			System.out.println("Exception caught in editCartOperation Method :" + exception);
		}
		return model;
	}
}
