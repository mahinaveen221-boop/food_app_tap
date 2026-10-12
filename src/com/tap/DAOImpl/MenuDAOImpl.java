package com.tap.DAOImpl;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.model.Restaurant;
import java.util.ArrayList;
import java.util.List;

public class MenuDAOImpl implements MenuDAO {
    private static final List<Menu> allMenuItems = new ArrayList<>();

    static {
        // ==========================================
        // 1. TAMIL NADU RESTAURANTS (1 to 14)
        // ==========================================
        // Restaurant 1: Aalishan Biryani & Grill (Chennai)
        addMenu(new Menu(101, 1, "Chettinad Special Chicken Biryani", "Traditional Seeraga Samba rice cooked with aromatic herbs and tender chicken.", 280.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Biryani"));
        addMenu(new Menu(102, 1, "Nattu Kozhi Chukka", "Country chicken roasted with shallots, crushed black pepper and curry leaves.", 320.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));
        addMenu(new Menu(103, 1, "Bun Parotta with Mutton Salna", "Flaky Madurai style layered bun parotta served with piping hot mutton salna.", 140.0, 4.9, true, false, "https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=500&q=80", "Main Course"));

        // Restaurant 2: Murugan Idli Shop (Chennai)
        addMenu(new Menu(201, 2, "Ghee Podi Idli (4 Pcs)", "Soft mini idlis tossed in generous homemade ghee and aromatic spicy podi.", 110.0, 4.9, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "South Indian"));
        addMenu(new Menu(202, 2, "Special Ghee Onion Rava Dosa", "Super crispy golden semolina crepe filled with onions, chillies and cashews.", 140.0, 4.8, true, true, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "South Indian"));
        addMenu(new Menu(203, 2, "Special Madurai Jigarthanda", "Cooling dessert drink made with almond gum, nannari syrup & cream ice cream.", 90.0, 5.0, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));

        // Restaurant 3: Madurai Amma Mess (Madurai)
        addMenu(new Menu(301, 3, "Amma Mess Bone Marrow Omelette", "World famous fluffy egg omelette stuffed with rich mutton bone marrow.", 180.0, 5.0, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Madurai Special"));
        addMenu(new Menu(302, 3, "Ayirai Meen Kuzhambu & Meals", "Authentic Madurai freshwater Ayirai fish curry served with hot rice.", 280.0, 4.9, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Madurai Special"));
        addMenu(new Menu(303, 3, "Madurai Mutton Chukka Roast", "Pan roasted spicy tender mutton chukka cooked in Chettinad spices.", 240.0, 4.8, true, false, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", "Madurai Special"));

        // Restaurant 4: Madurai Konar Kadai & Kari Dosa (Madurai)
        addMenu(new Menu(401, 4, "Konar Kadai Special Kari Dosa", "Three-layered thick dosa loaded with spicy minced mutton and fluffy egg.", 220.0, 4.9, true, false, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "Madurai Special"));
        addMenu(new Menu(402, 4, "Bun Parotta & Mutton Salna", "Deep-fried flaky bun parotta served with spicy mutton gravy.", 120.0, 4.9, true, false, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Madurai Special"));
        addMenu(new Menu(403, 4, "Madurai Elumbu Roast", "Slow cooked mutton bone joint roast coated in black pepper gravy.", 250.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Madurai Special"));

        // Restaurant 5: Trichy Ezham Suvai Mess & Biryani (Trichy)
        addMenu(new Menu(501, 5, "Trichy Seeraga Samba Mutton Biryani", "Aromatic Trichy style mutton biryani served with brinjal gravy and onion raita.", 290.0, 4.8, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Trichy Special"));
        addMenu(new Menu(502, 5, "Nandu Masala Crab Roast", "Spicy coastal crab roast cooked in garlic pepper masala.", 310.0, 4.7, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Seafood"));
        addMenu(new Menu(503, 5, "Ezham Suvai Hot Parotta (3 Pcs)", "Soft Trichy parotta served with spicy chicken gravy.", 110.0, 4.8, true, false, "https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=500&q=80", "Main Course"));

        // Restaurant 6: Salem Selvi Mess & Mutton Roast (Salem)
        addMenu(new Menu(601, 6, "Salem Mutton Chukka Fry", "Famous Salem small onion mutton chukka fry.", 270.0, 4.8, true, false, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", "Salem Special"));
        addMenu(new Menu(602, 6, "Pallipalayam Chicken Curry", "Authentic Salem recipe of chicken cooked with shallots & coconut strips.", 240.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Salem Special"));
        addMenu(new Menu(603, 6, "Salem Unlimited Non-Veg Meals", "Banana leaf meals served with mutton gravy, chicken gravy & fish curry.", 220.0, 4.9, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Meals"));

        // Restaurant 7: Tirunelveli Iruttukadai Halwa & Nellai Mess (Tirunelveli)
        addMenu(new Menu(701, 7, "Tirunelveli Wheat Halwa (250g)", "World famous ghee-loaded dark Tirunelveli wheat halwa.", 130.0, 5.0, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));
        addMenu(new Menu(702, 7, "Nellai Sodhi Veg Meals", "Traditional Tirunelveli coconut milk Sodhi curry served with rice and potato roast.", 160.0, 4.9, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Nellai Special"));
        addMenu(new Menu(703, 7, "Tirunelveli Spicy Chicken Fry", "Crispy pepper chicken fry cooked in Nellai style.", 230.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));

        // Restaurant 8: Erode Kongu Nattu Samayal Mess (Erode)
        addMenu(new Menu(801, 8, "Erode Pallipalayam Kozhi Fry", "Boneless chicken fry cooked with shallots, dry chillies and coconut pieces.", 250.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Erode Special"));
        addMenu(new Menu(802, 8, "Kongu Nattu Mutton Gravy", "Rich homemade Erode style mutton curry.", 280.0, 4.7, true, false, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", "Erode Special"));
        addMenu(new Menu(803, 8, "Pichipotta Kozhi Roast", "Shredded country chicken fry tossed with crushed pepper.", 230.0, 4.8, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Starters"));

        // Restaurant 9: Vellore Star Ambur Biryani & Grill (Vellore)
        addMenu(new Menu(901, 9, "Ambur Seeraga Samba Mutton Biryani", "Authentic wood-fire cooked Ambur mutton biryani.", 300.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Ambur Special"));
        addMenu(new Menu(902, 9, "Ambur Chicken 65 Dry", "Spicy red fried chicken pieces.", 210.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));
        addMenu(new Menu(903, 9, "Egg Biryani with Ennai Kathirikai", "Fragrant samba rice served with sour brinjal curry.", 180.0, 4.7, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Biryani"));

        // Restaurant 10: Thanjavur Maratha Heritage Mess (Thanjavur)
        addMenu(new Menu(1001, 10, "Thanjavur Fish Curry Meals", "Delta region tangy fish curry served with hot rice and fish fry.", 260.0, 4.9, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Thanjavur Special"));
        addMenu(new Menu(1002, 10, "Tawa Vanjaram Fish Fry", "King fish slice marinated in red chilli paste and pan fried.", 320.0, 4.9, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Seafood"));
        addMenu(new Menu(1003, 10, "Thanjavur Crab Gravy", "Rich mud crab curry cooked with freshly ground spices.", 290.0, 4.8, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Seafood"));

        // Restaurant 11: Kanyakumari Sea View Fish Mess (Kanyakumari)
        addMenu(new Menu(1101, 11, "Nagercoil Coconut Fish Curry", "Kanyakumari style yellow coconut milk fish curry.", 270.0, 4.8, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Seafood"));
        addMenu(new Menu(1102, 11, "Kanyakumari Prawn Pepper Roast", "Fresh sea prawns tossed with crushed black pepper.", 330.0, 4.9, true, false, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Seafood"));
        addMenu(new Menu(1103, 11, "Seafood Rice & Fish Meals", "Matta rice meals served with spicy fish curry and squid fry.", 240.0, 4.7, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Meals"));

        // Restaurant 12: Dindigul Thalappakatti Original Biryani (Dindigul)
        addMenu(new Menu(1201, 12, "Dindigul Thalappakatti Mutton Biryani", "World famous Seeraga Samba mutton biryani.", 320.0, 5.0, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Biryani"));
        addMenu(new Menu(1202, 12, "Thalappakatti Pepper Chicken", "Pan fried boneless pepper chicken.", 240.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));
        addMenu(new Menu(1203, 12, "Thalappakatti Mutton Chukka", "Spicy boneless mutton chukka fry.", 290.0, 4.9, true, false, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", "Starters"));

        // Restaurant 13: Chettinad Karaikudi Heritage Mess (Karaikudi)
        addMenu(new Menu(1301, 13, "Karaikudi Nattu Kozhi Curry", "Authentic Chettinad country chicken gravy.", 290.0, 4.9, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Chettinad Special"));
        addMenu(new Menu(1302, 13, "Chettinad Mutton Varuval", "Dry spice coated tender mutton fry.", 310.0, 4.9, true, false, "https://images.unsplash.com/photo-1633945274405-b6c8069047b0?w=500&q=80", "Chettinad Special"));
        addMenu(new Menu(1303, 13, "Karaikudi Eerathal Fry", "Spiced goat liver roast cooked with black pepper.", 220.0, 4.7, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));

        // Restaurant 14: Coimbatore Annapoorna Gowrishankar (Coimbatore)
        addMenu(new Menu(1401, 14, "Coimbatore Sambar Vadai (2 Pcs)", "Crispy medu vada soaked in piping hot ghee sambar.", 80.0, 4.9, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "South Indian"));
        addMenu(new Menu(1402, 14, "Special Ghee Roast Dosa", "Golden cone dosa served with coconut chutney & sambar.", 130.0, 4.8, true, true, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "South Indian"));
        addMenu(new Menu(1403, 14, "Annapoorna Filter Coffee", "Authentic brass cup piping hot filter coffee.", 45.0, 5.0, true, true, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80", "Beverages"));


        // ==========================================
        // 2. KERALA RESTAURANTS (15 to 18)
        // ==========================================
        // Restaurant 15: Malabar Coast Kitchen & Paragon (Kochi)
        addMenu(new Menu(1501, 15, "Kozhikode Chicken Dum Biryani", "Fragrant Malabar biryani rice cooked with marinated chicken.", 280.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Malabar Special"));
        addMenu(new Menu(1502, 15, "Kerala Soft Appam with Chicken Stew", "Lacy bowl appam served with coconut milk chicken stew.", 210.0, 4.8, true, false, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Kerala Special"));
        addMenu(new Menu(1503, 15, "Malabar Beef Roast & Parotta", "Spicy Kerala style beef roast served with flaky Malabar parotta.", 240.0, 4.9, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Kerala Special"));
        addMenu(new Menu(1504, 15, "Kerala Fish Curry Meals", "Authentic Kerala Matta rice meals served with spicy red fish curry.", 260.0, 4.8, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Meals"));

        // Restaurant 16: Kozhikode Paragon Biryani & Halwa (Kozhikode)
        addMenu(new Menu(1601, 16, "Paragon Mutton Dum Biryani", "World famous Kozhikode Paragon mutton biryani.", 340.0, 5.0, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Paragon Special"));
        addMenu(new Menu(1602, 16, "Kozhikode Black Halwa (250g)", "Authentic Kozhikode coconut oil black halwa.", 140.0, 4.9, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));
        addMenu(new Menu(1603, 16, "Malabar Fish Mango Curry", "Seer fish cooked in raw mango coconut gravy.", 290.0, 4.8, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Seafood"));

        // Restaurant 17: Alleppey Backwater Toddy & Grill (Alleppey)
        addMenu(new Menu(1701, 17, "Karimeen Pollichathu", "Fresh Pearlspot fish marinated in spicy onion-tomato masala & grilled in banana leaf.", 380.0, 5.0, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Alleppey Special"));
        addMenu(new Menu(1702, 17, "Kerala Duck Roast", "Alleppey backwater duck slow-roasted in thick pepper gravy.", 340.0, 4.9, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Alleppey Special"));
        addMenu(new Menu(1703, 17, "Soft Puttu & Spicy Kadala Curry", "Steamed rice puttu served with spicy black chickpea curry.", 130.0, 4.8, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Kerala Breakfast"));
        addMenu(new Menu(1704, 17, "Toddy Shop Beef Chukka", "Spicy pan-fried beef fry with coconut slices.", 250.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));

        // Restaurant 18: Trivandrum Mothers Veg Sadya (Trivandrum)
        addMenu(new Menu(1801, 18, "Traditional 24-Item Kerala Sadya", "Grand banana leaf feast with Aviyal, Thoran, Olan, Payasam & Rice.", 240.0, 4.9, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Sadya"));
        addMenu(new Menu(1802, 18, "Special Coconut Aviyal & Matta Rice", "Mixed vegetables cooked in coconut yogurt gravy.", 150.0, 4.8, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Kerala Special"));
        addMenu(new Menu(1803, 18, "Palada Payasam Dessert", "Rich milk dessert with rice ada.", 90.0, 4.9, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));


        // ==========================================
        // 3. ANDHRA & TELANGANA RESTAURANTS (19 to 22)
        // ==========================================
        // Restaurant 19: Paradise Biryani & Bawarchi (Hyderabad)
        addMenu(new Menu(1901, 19, "Hyderabadi Double Ek Dum Mutton Biryani", "World-famous Hyderabadi mutton dum biryani with rich saffron.", 380.0, 5.0, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Hyderabadi Biryani"));
        addMenu(new Menu(1902, 19, "Hyderabadi Chicken Dum Biryani", "Classic basmati biryani with marinated chicken & mirchi ka salan.", 310.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Hyderabadi Biryani"));
        addMenu(new Menu(1903, 19, "Double Ka Meetha Dessert", "Fried bread dessert soaked in saffron syrup and condensed milk.", 120.0, 4.8, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));

        // Restaurant 20: Vijayawada Spicy Royyala Mess (Vijayawada)
        addMenu(new Menu(2001, 20, "Spicy Royyala (Prawns) Biryani", "Andhra style fiery prawn biryani.", 360.0, 4.8, true, false, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Andhra Special"));
        addMenu(new Menu(2002, 20, "Andhra Gongura Chicken Meals", "Chicken curry made with sorrel leaves served with Andhra thali.", 270.0, 4.8, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Andhra Special"));
        addMenu(new Menu(2003, 20, "Vijayawada Spicy Chilli Chicken", "Deep-fried spicy chicken tossed with green chillies.", 240.0, 4.7, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));

        // Restaurant 21: Vizag Bamboo Chicken Kitchen (Vizag)
        addMenu(new Menu(2101, 21, "Araku Bamboo Chicken Roast", "Juicy chicken roasted inside green bamboo stems with tribal herbs.", 350.0, 4.9, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Vizag Special"));
        addMenu(new Menu(2102, 21, "Vizag Spicy Bay Seafood Fry", "Fresh crab and fish fry tossed in Vizag spices.", 290.0, 4.7, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Seafood"));
        addMenu(new Menu(2103, 21, "Andhra Mutton Fry Biryani", "Spicy mutton fry layered over biryani rice.", 330.0, 4.8, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Biryani"));

        // Restaurant 22: Tirupati Bhimas Pure Veg Mess (Tirupati)
        addMenu(new Menu(2201, 22, "Tirupati Pure Ghee Meals Thali", "South Indian unlimited vegetarian thali served with pure ghee.", 170.0, 4.9, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Meals"));
        addMenu(new Menu(2202, 22, "Bhimas Ghee Karam Dosa", "Crispy dosa spread with spicy red garlic chutney and ghee.", 120.0, 4.8, true, true, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "South Indian"));
        addMenu(new Menu(2203, 22, "Kumbakonam Degree Filter Coffee", "Rich aromatic froth filter coffee.", 40.0, 4.9, true, true, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80", "Beverages"));


        // ==========================================
        // 4. KARNATAKA RESTAURANTS (23 to 26)
        // ==========================================
        // Restaurant 23: Meghana Foods Biryani (Bangalore)
        addMenu(new Menu(2301, 23, "Meghana Special Boneless Chicken Biryani", "Famous spicy basmati biryani with fried boneless chicken pieces.", 320.0, 5.0, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Bangalore Special"));
        addMenu(new Menu(2302, 23, "Meghana Mutton Biryani", "Spicy Andhra style mutton biryani.", 370.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Bangalore Special"));
        addMenu(new Menu(2303, 23, "Meghana Paneer 65 Biryani", "Spicy Paneer 65 layered with biryani rice.", 270.0, 4.8, true, true, "https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500&q=80", "Vegetarian"));

        // Restaurant 24: Vidyarthi Bhavan Heritage Dosa (Bangalore)
        addMenu(new Menu(2401, 24, "Vidyarthi Bhavan Crispy Benne Masala Dosa", "Iconic Bengaluru butter dosa with potato palya & chutney.", 110.0, 5.0, true, true, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "Bangalore Special"));
        addMenu(new Menu(2402, 24, "Golden Crispy Rava Vada (2 Pcs)", "Crispy fried lentil vadas served with sambar.", 60.0, 4.8, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "South Indian"));
        addMenu(new Menu(2403, 24, "Bangalore Filter Coffee", "Hot brass cup froth filter coffee.", 35.0, 4.9, true, true, "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=500&q=80", "Beverages"));

        // Restaurant 25: Mysore Hotel RRR Mutton Biryani (Mysore)
        addMenu(new Menu(2501, 25, "Mysore RRR Mutton Biryani", "Iconic Mysore green chilli mutton biryani served on banana leaf.", 340.0, 4.9, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Mysore Special"));
        addMenu(new Menu(2502, 25, "Original Mysore Pak Sweet (4 Pcs)", "Melt-in-mouth ghee Mysore pak.", 120.0, 5.0, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));
        addMenu(new Menu(2503, 25, "Mysore Chilli Chicken Dry", "Spicy green chilli chicken fry.", 230.0, 4.8, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Starters"));

        // Restaurant 26: Mangalore Giri Manjas Seafood Mess (Mangalore)
        addMenu(new Menu(2601, 26, "Mangalore Anjal (King Fish) Tawa Fry", "Fresh Anjal fish slice coated in red Mangalorean spices.", 390.0, 5.0, true, false, "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=500&q=80", "Mangalore Seafood"));
        addMenu(new Menu(2602, 26, "Soft Neer Dosa with Prawn Curry", "Lacy rice crepes served with coconut prawn curry.", 260.0, 4.9, true, false, "https://images.unsplash.com/photo-1610192244261-3f33de3f55e4?w=500&q=80", "Mangalore Seafood"));
        addMenu(new Menu(2603, 26, "Mangalorean Squid Sukka", "Squid roasted with fresh grated coconut & Kundapur spices.", 310.0, 4.8, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Seafood"));


        // ==========================================
        // 5. NORTH INDIA, MAHARASHTRA, WEST BENGAL (27 to 30)
        // ==========================================
        // Restaurant 27: Royal Punjab Rasoi & Karim's (Delhi)
        addMenu(new Menu(2701, 27, "Delhi Murgh Makhani Butter Chicken", "Rich cream and tomato butter chicken.", 340.0, 4.9, true, false, "https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500&q=80", "Delhi Special"));
        addMenu(new Menu(2702, 27, "Creamy Dal Makhani & Garlic Naan", "Slow-cooked black lentils with butter naan.", 240.0, 4.8, true, true, "https://images.unsplash.com/photo-1631452180519-c014fe946bc7?w=500&q=80", "North Indian"));
        addMenu(new Menu(2703, 27, "Old Delhi Seekh Kebab Platter", "Charcoal-grilled minced mutton kebabs.", 320.0, 4.9, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Kebabs"));

        // Restaurant 28: Mumbai Chowpatty Pav Bhaji & Vada Pav (Mumbai)
        addMenu(new Menu(2801, 28, "Butter Loaded Chowpatty Pav Bhaji", "Spiced vegetable mash topped with butter & served with toasted pav.", 140.0, 4.9, true, true, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Mumbai Street Food"));
        addMenu(new Menu(2802, 28, "Mumbai Special Batata Vada Pav (2 Pcs)", "Spiced potato vada inside soft bun with garlic chutney.", 60.0, 4.9, true, true, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Mumbai Street Food"));
        addMenu(new Menu(2803, 28, "Kolhapuri Spicy Misal Pav", "Spicy sprout curry topped with farsan and onions.", 120.0, 4.8, true, true, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Maharashtra Special"));

        // Restaurant 29: Pune Vaishali Cafe & Misal House (Pune)
        addMenu(new Menu(2901, 29, "Pune Puneri Spicy Misal Pav", "Fiery sprout gravy served with buttered pav buns.", 130.0, 4.8, true, true, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Pune Special"));
        addMenu(new Menu(2902, 29, "Crispy Sabudana Vada (2 Pcs)", "Tapioca sago crisp fried patties served with sweet curd.", 90.0, 4.8, true, true, "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?w=500&q=80", "Snacks"));
        addMenu(new Menu(2903, 29, "Vaishali Special Cheese Sev Puri", "Crispy puris topped with potatoes, chutneys & grated cheese.", 110.0, 4.9, true, true, "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500&q=80", "Street Food"));

        // Restaurant 30: Kolkata Arsalan Biryani & Kati Roll (Kolkata)
        addMenu(new Menu(3001, 30, "Kolkata Mutton Dum Biryani", "Aromatic basmati biryani with spiced potato, boiled egg & tender mutton.", 330.0, 5.0, true, false, "https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80", "Kolkata Special"));
        addMenu(new Menu(3002, 30, "Kolkata Egg Chicken Kati Roll", "Flaky parotta roll stuffed with grilled chicken & egg.", 120.0, 4.9, true, false, "https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?w=500&q=80", "Kati Roll"));
        addMenu(new Menu(3003, 30, "Soft Sponge Bengali Rasgulla (4 Pcs)", "Authentic cottage cheese balls in cardamom sugar syrup.", 90.0, 4.9, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Desserts"));
    }

    private static void addMenu(Menu item) {
        allMenuItems.add(item);
    }

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {
        List<Menu> result = new ArrayList<>();
        for (Menu item : allMenuItems) {
            if (item.getRestaurantId() == restaurantId) {
                result.add(item);
            }
        }
        // Fallback: If any restaurant ID doesn't have explicit menu items, generate high quality default dishes
        if (result.isEmpty()) {
            RestaurantDAOImpl rDao = new RestaurantDAOImpl();
            Restaurant r = rDao.getRestaurantById(restaurantId);
            String rName = (r != null) ? r.getName() : "Regional Restaurant";
            String cuisine = (r != null && r.getCuisineType() != null) ? r.getCuisineType() : "Speciality Food";

            result.add(new Menu(restaurantId * 100 + 1, restaurantId, rName + " Special Thali / Meals", "Signature authentic " + cuisine + " served hot.", 250.0, 4.8, true, false, "https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=500&q=80", "Signature Dish"));
            result.add(new Menu(restaurantId * 100 + 2, restaurantId, rName + " Chef Special Roast", "Chef recommended special recipe with aromatic spices.", 280.0, 4.9, true, false, "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=500&q=80", "Chef Special"));
            result.add(new Menu(restaurantId * 100 + 3, restaurantId, rName + " Special Refreshing Drink", "Traditional regional beverage to complement your meal.", 80.0, 4.7, true, true, "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=500&q=80", "Beverages"));
        }
        return result;
    }

    @Override
    public Menu getMenuItemById(int menuId) {
        for (Menu item : allMenuItems) {
            if (item.getMenuId() == menuId) {
                return item;
            }
        }
        // Fallback for dynamic menu IDs
        int restaurantId = menuId / 100;
        List<Menu> list = getMenuByRestaurantId(restaurantId);
        for (Menu item : list) {
            if (item.getMenuId() == menuId) {
                return item;
            }
        }
        return null;
    }
}
