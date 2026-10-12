package com.tap.DAO;

import com.tap.model.Restaurant;
import java.util.List;

public interface RestaurantDAO {
    List<Restaurant> getAllRestaurants();
    Restaurant getRestaurantById(int restaurantId);
    List<Restaurant> searchRestaurants(String query);
    List<Restaurant> filterRestaurants(String query, String state, String city);
}
