package com.food.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_table")
public class Order_Table {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "order_id", unique = true, nullable = false)
	private int order_id;
	private int user_id;
	private String dish_name;
	private String dish_img;
	private int quantity;
	private float price;
	private String user_name;
	private String email;
	private String address;
	private long ph_number;
	private String date_of_order;
	private String mode_of_payment;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getDish_name() {
		return dish_name;
	}

	public void setDish_name(String dish_name) {
		this.dish_name = dish_name;
	}

	public String getDish_img() {
		return dish_img;
	}

	public void setDish_img(String dish_img) {
		this.dish_img = dish_img;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getPh_number() {
		return ph_number;
	}

	public void setPh_number(long ph_number) {
		this.ph_number = ph_number;
	}

	public String getDate_of_order() {
		return date_of_order;
	}

	public void setDate_of_order(String date_of_order) {
		this.date_of_order = date_of_order;
	}

	public String getMode_of_payment() {
		return mode_of_payment;
	}

	public void setMode_of_payment(String mode_of_payment) {
		this.mode_of_payment = mode_of_payment;
	}

	@Override
	public String toString() {
		return "Order_Table [order_id=" + order_id + ", user_id=" + user_id + ", dish_name=" + dish_name + ", dish_img="
				+ dish_img + ", quantity=" + quantity + ", price=" + price + ", user_name=" + user_name + ", email="
				+ email + ", address=" + address + ", ph_number=" + ph_number + ", date_of_order=" + date_of_order
				+ ", mode_of_payment=" + mode_of_payment + "]";
	}

}
