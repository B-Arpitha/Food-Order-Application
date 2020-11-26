package com.food.services;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.food.model.Menu_Table;
import com.food.repository.MenuTableRepository;

@Service
@Transactional
public class UserCartService {
	private static final int ZERO = 0;
	@Autowired
	MenuTableRepository menuTableRepository;

	public List<Menu_Table> viewMenu() {
		List<Menu_Table> menuList = new ArrayList<Menu_Table>();
		try {
			for (Menu_Table menu : menuTableRepository.findAll()) {

				if ((menu.getAvailable_Quantity() > ZERO)
						&& (menu.getDate_Of_Updation().equals(LocalDate.now().toString())))
					menuList.add(menu);
			}
		} catch (Exception exception) {
			System.out.println("Exception caught in viewMenu Method :" + exception);
		}
		return menuList;
	}

	public void saveOrUpdateEmployee(Menu_Table menu) {
		try {
			menuTableRepository.save(menu);
		} catch (Exception exception) {
			System.out.println("Exception caught in viewMenu Method :" + exception);
		}
	}
}