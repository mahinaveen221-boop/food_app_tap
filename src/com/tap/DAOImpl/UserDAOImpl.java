package com.tap.DAOImpl;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class UserDAOImpl implements UserDAO {
    private static final Map<Integer, User> userMap = new ConcurrentHashMap<>();
    private static final Map<String, User> emailMap = new ConcurrentHashMap<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(100);

    static {
        // Sample default user for instant testing
        User defaultUser = new User(1, "Naveen Kumar", "naveen@gmail.com", "9876543210", "password123", "Anna Nagar, Chennai", "Customer");
        userMap.put(defaultUser.getUserId(), defaultUser);
        emailMap.put(defaultUser.getEmail().toLowerCase(), defaultUser);
    }

    @Override
    public boolean addUser(User user) {
        if (user == null || user.getEmail() == null) return false;
        if (emailMap.containsKey(user.getEmail().toLowerCase())) {
            return false; // Email already registered
        }
        int newId = idGenerator.incrementAndGet();
        user.setUserId(newId);
        userMap.put(newId, user);
        emailMap.put(user.getEmail().toLowerCase(), user);
        return true;
    }

    @Override
    public User getUserById(int userId) {
        return userMap.get(userId);
    }

    @Override
    public User getUserByEmail(String email) {
        if (email == null) return null;
        return emailMap.get(email.toLowerCase());
    }

    @Override
    public User validateUser(String email, String password) {
        if (email == null || password == null) return null;
        User user = getUserByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public boolean updateUser(User user) {
        if (user == null || !userMap.containsKey(user.getUserId())) return false;
        userMap.put(user.getUserId(), user);
        emailMap.put(user.getEmail().toLowerCase(), user);
        return true;
    }

    @Override
    public boolean deleteUser(int userId) {
        User user = userMap.remove(userId);
        if (user != null) {
            emailMap.remove(user.getEmail().toLowerCase());
            return true;
        }
        return false;
    }

    @Override
    public List<User> getAllUsers() {
        return new ArrayList<>(userMap.values());
    }
}
