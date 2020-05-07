/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Users;
import Repositories.UsersRepository;
import java.util.ArrayList;

/**
 *
 * @author DIEGO
 */
public class UsersController {

    public Exception Exception;
    private final UsersRepository UsersRepository;

    public UsersController() {
        UsersRepository = new UsersRepository();
    }

    public boolean Add(Users user) {
        try {
            if (user == null) {
                Exception = new Exception("Ingrese los datos");
                return false;
            }
            if (!UsersRepository.Add(user)) {
                Exception = UsersRepository.Exception;
                return false;
            }
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }

    public ArrayList<Users> List() {
        try {
            ArrayList<Users> response = UsersRepository.List();
            if (response == null) {
                Exception = UsersRepository.Exception;
                return null;
            }
            return response;
        } catch (Exception ex) {
            Exception = ex;
            return null;
        }
    }

    public Users GetUser(String idSelected) {
        try {
            Users user = UsersRepository.GetUser(idSelected);
            if (user == null) {
                Exception = UsersRepository.Exception;
                return null;
            }
            return user;
        } catch (Exception ex) {
            Exception = ex;
            return null;
        }
    }

    public boolean Update(Users user) {
        try {
            if (!UsersRepository.Update(user)) {
                Exception = UsersRepository.Exception;
                return false;
            }
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }

    public boolean Delete(String idSelected) {
        try {
            if(!UsersRepository.Delete(idSelected)){
                Exception = UsersRepository.Exception;
                return false;
            }
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }
}
