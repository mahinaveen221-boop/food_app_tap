package com.tap.DAO;

import com.tap.model.User;
import java.util.List;

public interface UserDAO {
    boolean addUser(User user);
    User getUserById(int userId);
    User getUserByEmail(String email);
    User validateUser(String email, String password);
    boolean updateUser(User user);
    boolean deleteUser(int userId);
    List<User> getAllUsers();
}
