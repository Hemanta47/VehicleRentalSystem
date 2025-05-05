package com.FleetX.service;

import java.util.ArrayList;
import java.util.List;

import com.FleetX.model.CartModel;

import jakarta.servlet.http.HttpSession;

public class CartService {
    private static final String CART_SESSION_KEY = "cartItems";
    private HttpSession session;

    public CartService(HttpSession session) {
        this.session = session;
    }
    
    @SuppressWarnings("unchecked")
    public void addItem(CartModel item) {
		List<CartModel> cart = (List<CartModel>) session.getAttribute(CART_SESSION_KEY);
        if (cart == null) {
            cart = new ArrayList<>();
        }

        cart.add(item);
        session.setAttribute(CART_SESSION_KEY, cart);
    }
}
