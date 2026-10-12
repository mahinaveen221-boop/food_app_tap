package com.tap.DAOImpl;

import com.tap.DAO.MenuDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.model.Menu;
import com.tap.model.Restaurant;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDAOImpl implements RestaurantDAO {
    private static final List<Restaurant> restaurants = new ArrayList<>();

    static {
        // ==========================================
        // 1. TAMIL NADU DISTRICTS (தமிழ்நாடு மாவட்டங்கள்)
        // ==========================================
        // CHENNAI
        restaurants.add(new Restaurant(1, "Aalishan Biryani & Grill", "Chicken Biryani, Mutton Chukka, Chettinad Spices", "25-35 mins", "Anna Nagar, Chennai District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "Tamil Nadu", "Chennai"));
        restaurants.add(new Restaurant(2, "Murugan Idli Shop", "Podi Idli, Ghee Onion Rava Dosa, Jigarthanda", "15-20 mins", "T. Nagar, Chennai District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80", true, true, "Tamil Nadu", "Chennai"));
        
        // MADURAI
        restaurants.add(new Restaurant(3, "Madurai Amma Mess", "Ayirai Meen Kuzhambu, Bone Marrow Omelette, Crab Roast, Mutton Chukka", "20-30 mins", "Tallakulam, Madurai District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", true, true, "Tamil Nadu", "Madurai"));
        restaurants.add(new Restaurant(4, "Madurai Konar Kadai & Kari Dosa", "Konar Kari Dosa, Elumbu Roast, Bun Parotta, Jigarthanda", "15-25 mins", "Simmakkal, Madurai District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", true, true, "Tamil Nadu", "Madurai"));
        
        // TRICHY (TIRUCHIRAPPALLI)
        restaurants.add(new Restaurant(5, "Trichy Ezham Suvai Mess & Biryani", "Trichy Mutton Biryani, Nandu Masala, Parotta", "20-30 mins", "Chatram Bus Stand, Trichy District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "Tamil Nadu", "Trichy"));
        
        // SALEM
        restaurants.add(new Restaurant(6, "Salem Selvi Mess & Mutton Roast", "Salem Special Mutton Chukka, Pallipalayam Chicken, Meals", "20-30 mins", "Five Roads, Salem District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", true, true, "Tamil Nadu", "Salem"));
        
        // TIRUNELVELI
        restaurants.add(new Restaurant(7, "Tirunelveli Iruttukadai Halwa & Nellai Mess", "Nellai Sodhi Meals, Tirunelveli Wheat Halwa, Chicken Fry", "15-25 mins", "Town, Tirunelveli District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", true, true, "Tamil Nadu", "Tirunelveli"));

        // ERODE
        restaurants.add(new Restaurant(8, "Erode Kongu Nattu Samayal Mess", "Erode Pallipalayam Chicken, Pichipotta Kozhi, Kongu Meals", "20-30 mins", "Perundurai Road, Erode District, Tamil Nadu", 4.7, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", true, true, "Tamil Nadu", "Erode"));

        // VELLORE
        restaurants.add(new Restaurant(9, "Vellore Star Ambur Biryani & Grill", "Ambur Seeraga Samba Mutton Biryani, Chicken 65", "25-35 mins", "Green Circle, Vellore District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "Tamil Nadu", "Vellore"));

        // THANJAVUR
        restaurants.add(new Restaurant(10, "Thanjavur Maratha Heritage Mess", "Thanjavur Fish Curry Meals, Fish Fry, Crab Masala", "20-30 mins", "South Rampart, Thanjavur District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", true, true, "Tamil Nadu", "Thanjavur"));

        // KANYAKUMARI / NAGERCOIL
        restaurants.add(new Restaurant(11, "Kanyakumari Sea View Fish Mess", "Nagercoil Fish Curry Meals, Prawn Fry, Coconut Seafood", "20-30 mins", "Beach Road, Kanyakumari District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", true, true, "Tamil Nadu", "Kanyakumari"));

        // DINDIGUL
        restaurants.add(new Restaurant(12, "Dindigul Thalappakatti Original Biryani", "Dindigul Mutton Biryani, Pepper Chicken, Chukka", "20-30 mins", "Main Bus Stand, Dindigul District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", true, true, "Tamil Nadu", "Dindigul"));

        // KARAIKUDI / SIVAGANGAI
        restaurants.add(new Restaurant(13, "Chettinad Karaikudi Heritage Mess", "Chettinad Chicken, Nattu Kozhi Roast, Crab Curry", "30-40 mins", "Main Road, Karaikudi, Sivagangai District, Tamil Nadu", 4.9, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", true, true, "Tamil Nadu", "Karaikudi"));

        // COIMBATORE
        restaurants.add(new Restaurant(14, "Coimbatore Annapoorna Gowrishankar", "Sambar Vadai, Ghee Roast, Filter Coffee", "15-20 mins", "RS Puram, Coimbatore District, Tamil Nadu", 4.8, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", true, true, "Tamil Nadu", "Coimbatore"));


        // ==========================================
        // 2. KERALA DISTRICTS (கேரளா மாவட்டங்கள்)
        // ==========================================
        // KOCHI / ERNAKULAM
        restaurants.add(new Restaurant(15, "Malabar Coast Kitchen & Paragon", "Kozhikode Biryani, Kerala Appam, Beef Roast, Fish Curry", "30-40 mins", "MG Road, Kochi, Ernakulam District, Kerala", 4.8, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", true, true, "Kerala", "Kochi"));

        // KOZHIKODE (CALICUT)
        restaurants.add(new Restaurant(16, "Kozhikode Paragon Biryani & Halwa", "Iconic Kozhikode Dum Biryani, Kozhikode Halwa, Fish Mango Curry", "25-35 mins", "Mavoor Road, Kozhikode District, Kerala", 4.9, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "Kerala", "Kozhikode"));

        // ALLEPPEY (ALAPPUZHA)
        restaurants.add(new Restaurant(17, "Alleppey Backwater Toddy & Grill", "Karimeen Pollichathu, Duck Roast, Puttu Kadala", "35-45 mins", "Finishing Point, Alleppey District, Kerala", 4.8, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", true, true, "Kerala", "Alleppey"));

        // TRIVANDRUM
        restaurants.add(new Restaurant(18, "Trivandrum Mothers Veg Sadya", "Traditional Kerala Feast, Aviyal, Payasam", "20-30 mins", "Palayam, Trivandrum District, Kerala", 4.7, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", true, true, "Kerala", "Trivandrum"));


        // ==========================================
        // 3. ANDHRA & TELANGANA DISTRICTS (ஆந்திரா)
        // ==========================================
        // HYDERABAD
        restaurants.add(new Restaurant(19, "Paradise Biryani & Bawarchi", "Hyderabadi Dum Biryani, Double Ka Meetha, Haleem", "20-30 mins", "Banjara Hills, Hyderabad District, Telangana", 4.9, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", true, true, "Andhra", "Hyderabad"));

        // VIJAYAWADA
        restaurants.add(new Restaurant(20, "Vijayawada Spicy Royyala Mess", "Royyala Biryani (Prawns), Gongura Chicken Meals", "25-35 mins", "Benz Circle, Vijayawada, Andhra Pradesh", 4.7, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", true, true, "Andhra", "Vijayawada"));

        // VIZAG (VISAKHAPATNAM)
        restaurants.add(new Restaurant(21, "Vizag Bamboo Chicken Kitchen", "Araku Bamboo Chicken, Spicy Fish Fry", "30-40 mins", "RK Beach Road, Vizag District, Andhra Pradesh", 4.6, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", true, true, "Andhra", "Vizag"));

        // TIRUPATI
        restaurants.add(new Restaurant(22, "Tirupati Bhimas Pure Veg Mess", "Pure Ghee Meals, Tirupati Dosa, Filter Coffee", "15-25 mins", "Near Bus Stand, Tirupati District, Andhra Pradesh", 4.8, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", true, true, "Andhra", "Tirupati"));


        // ==========================================
        // 4. KARNATAKA DISTRICTS (கர்நாடகா)
        // ==========================================
        // BANGALORE
        restaurants.add(new Restaurant(23, "Meghana Foods Biryani", "Special Chicken Biryani, Boneless Chicken Biryani, Paneer 65", "20-30 mins", "Koramangala, Bangalore District, Karnataka", 4.9, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "Karnataka", "Bangalore"));
        restaurants.add(new Restaurant(24, "Vidyarthi Bhavan Heritage Dosa", "Crispy Masala Dosa, Rava Vada, Filter Coffee", "15-25 mins", "Basavanagudi, Bangalore District, Karnataka", 4.9, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", true, true, "Karnataka", "Bangalore"));

        // MYSORE
        restaurants.add(new Restaurant(25, "Mysore Hotel RRR Mutton Biryani", "Mysore Style Mutton Biryani, Mysore Pak, Chilli Chicken", "20-30 mins", "Near Palace, Mysore District, Karnataka", 4.8, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", true, true, "Karnataka", "Mysore"));

        // MANGALORE
        restaurants.add(new Restaurant(26, "Mangalore Giri Manjas Seafood Mess", "Mangalore Fish Curry, Anjal Tawa Fry, Neer Dosa", "25-35 mins", "Car Street, Mangalore District, Karnataka", 4.9, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", true, true, "Karnataka", "Mangalore"));


        // ==========================================
        // 5. NORTH INDIA, MAHARASHTRA, WEST BENGAL
        // ==========================================
        // DELHI
        restaurants.add(new Restaurant(27, "Royal Punjab Rasoi & Karim's", "Butter Chicken, Dal Makhani, Tandoori Naan, Seekh Kebab", "25-35 mins", "Connaught Place, Delhi District", 4.8, "https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500&q=80", true, true, "North Indian", "Delhi"));

        // MUMBAI
        restaurants.add(new Restaurant(28, "Mumbai Chowpatty Pav Bhaji & Vada Pav", "Special Pav Bhaji, Vada Pav, Misal Pav", "15-25 mins", "Marine Drive, Mumbai District, Maharashtra", 4.7, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", true, true, "Maharashtra", "Mumbai"));

        // PUNE
        restaurants.add(new Restaurant(29, "Pune Vaishali Cafe & Misal House", "Pune Special Misal Pav, Sabudana Vada, Filter Coffee", "15-25 mins", "FC Road, Pune District, Maharashtra", 4.8, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", true, true, "Maharashtra", "Pune"));

        // KOLKATA
        restaurants.add(new Restaurant(30, "Kolkata Arsalan Biryani & Kati Roll", "Kolkata Potato Biryani, Chicken Kati Roll, Rasgulla", "25-35 mins", "Park Street, Kolkata District, West Bengal", 4.8, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", true, true, "West Bengal", "Kolkata"));
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        return new ArrayList<>(restaurants);
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {
        for (Restaurant r : restaurants) {
            if (r.getRestaurantId() == restaurantId) {
                return r;
            }
        }
        return null;
    }

    @Override
    public List<Restaurant> searchRestaurants(String query) {
        return filterRestaurants(query, null, null);
    }

    @Override
    public List<Restaurant> filterRestaurants(String query, String state, String city) {
        List<Restaurant> result = new ArrayList<>();
        String q = (query != null) ? query.trim().toLowerCase() : "";
        String s = (state != null) ? state.trim().toLowerCase() : "";
        String c = (city != null) ? city.trim().toLowerCase() : "";

        String[] tokens = q.isEmpty() ? new String[0] : q.split("\\s+");

        MenuDAO menuDAO = new MenuDAOImpl();

        for (Restaurant r : restaurants) {
            boolean matchQuery = q.isEmpty();

            if (!matchQuery) {
                // Check full string match
                boolean fullMatch = r.getName().toLowerCase().contains(q) 
                    || r.getCuisineType().toLowerCase().contains(q)
                    || r.getAddress().toLowerCase().contains(q)
                    || r.getStateCuisine().toLowerCase().contains(q)
                    || r.getCityLocation().toLowerCase().contains(q);

                if (fullMatch) {
                    matchQuery = true;
                } else {
                    // Check individual word token matching (e.g. "Trichy", "Salem", "Tirunelveli", "Halwa", "Amma")
                    for (String token : tokens) {
                        if (token.length() > 2 && (r.getName().toLowerCase().contains(token) 
                            || r.getCuisineType().toLowerCase().contains(token)
                            || r.getAddress().toLowerCase().contains(token)
                            || r.getCityLocation().toLowerCase().contains(token))) {
                            matchQuery = true;
                            break;
                        }
                    }
                }

                // Check menu items
                if (!matchQuery) {
                    List<Menu> items = menuDAO.getMenuByRestaurantId(r.getRestaurantId());
                    if (items != null) {
                        for (Menu item : items) {
                            if (item.getName().toLowerCase().contains(q) 
                                || item.getDescription().toLowerCase().contains(q) 
                                || item.getCategory().toLowerCase().contains(q)) {
                                matchQuery = true;
                                break;
                            }
                        }
                    }
                }
            }

            boolean matchState = s.isEmpty() || s.equals("all") || r.getStateCuisine().toLowerCase().contains(s) || r.getCityLocation().toLowerCase().contains(s);
            boolean matchCity = c.isEmpty() || c.equals("all") || r.getCityLocation().toLowerCase().contains(c) || r.getAddress().toLowerCase().contains(c);

            if (matchQuery && matchState && matchCity) {
                result.add(r);
            }
        }
        return result;
    }
}
