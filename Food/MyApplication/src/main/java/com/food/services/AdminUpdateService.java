package com.food.services;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.food.model.Menu_Table;
import com.food.repository.MenuTableRepository;

@Service
public class AdminUpdateService {
	@Autowired
	MenuTableRepository menuTableRepository;

	public void saveMenuDetails(Menu_Table adminUpdate) {
		try {
			LocalDate date = LocalDate.now();
			System.out.println(date);
			String d = date.toString();
			adminUpdate.setDateOfUpdation(d);
			menuTableRepository.save(adminUpdate);
		} catch (Exception exception) {
			System.out.println("Exception caught in saveMenuDetails Method :" + exception);
		}
	}

	public List<Menu_Table> menuList() {
		List<Menu_Table> menuList = new ArrayList<Menu_Table>();
		try {
			menuList = (List<Menu_Table>) menuTableRepository.findAll();
		} catch (Exception exception) {
			System.out.println("Exception caught in menuList Method :" + exception);
		}
		return menuList;
	}

	public void deletedish(String dishName) {
		try {
			menuTableRepository.deleteById(dishName);
		} catch (Exception exception) {
			System.out.println("Exception caught in deletedish Method :" + exception);
		}
	}

	public void saveDish(Menu_Table dish) {
		try {
			LocalDate date = LocalDate.now();

			dish.setDateOfUpdation(date.toString());
			menuTableRepository.save(dish);
		} catch (Exception exception) {
			System.out.println("Exception caught in saveDish Method :" + exception);
		}
	}
}
