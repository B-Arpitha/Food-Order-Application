package com.food.services;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.model.Menu_Table;
import com.food.model.Order_Table;
import com.food.repository.MenuTableRepository;
import com.food.repository.OrderTableRepository;

@Service
@Transactional
public class UserService {
	@Autowired
	MenuTableRepository menuTableRepository;
	@Autowired
	OrderTableRepository orderTableRepository;

	public List<Menu_Table> searchMenuList(String search_dish) {
		List<Menu_Table> searchResultList = new ArrayList<Menu_Table>();
		try {
			List<Menu_Table> menuList = (List<Menu_Table>) menuTableRepository.findAll();
			LocalDate date = LocalDate.now();

			for (var dishMenu : menuList) {
				if ((dishMenu.getDishName().contains(search_dish))
						&& (dishMenu.getDate_Of_Updation().equals(date.toString()))
						&& (dishMenu.getAvailable_Quantity() > 0))
					searchResultList.add(dishMenu);
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in searchMenuList Method :" + exception);
		}
		return searchResultList;
	}

	public List<Order_Table> searchOrderList(String search_order, int id) {
		List<Order_Table> searchResultList = new ArrayList<Order_Table>();
		try {
			List<Order_Table> menuAllList = (List<Order_Table>) orderTableRepository.findAll();

			for (var dishMenu : menuAllList) {
				if ((search_order.contains(Integer.toString(dishMenu.getOrder_id()))
						|| (Integer.toString(dishMenu.getOrder_id()).contains(search_order))
						|| search_order.equalsIgnoreCase("ORD")) && (dishMenu.getUser_id() == id))
					searchResultList.add(dishMenu);
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in searchOrderList Method :" + exception);
		}
		return searchResultList;
	}

	public void orderSave(Order_Table orderDetails) {
		orderTableRepository.save(orderDetails);
	}

	public List<Order_Table> searchOrderList1(String search_order,int user_id) {

		List<Order_Table> searchResultList = new ArrayList<Order_Table>();
		try {
			List<Order_Table> orderList = (List<Order_Table>) orderTableRepository.findAll();
			for (var order : orderList) {
				String orderId = "ord" + (Integer.toString(order.getOrder_id()));
				String orderId1 = "ORD" + (Integer.toString(order.getOrder_id()));
				if ((orderId.contains(search_order) || orderId1.equals(search_order)
						|| search_order.equalsIgnoreCase("ord") || orderId.contentEquals(search_order))
						&& order.getUser_id()==user_id)
					searchResultList.add(order);
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in searchOrderList1 Method :" + exception);
		}
		return searchResultList;
	}

}
