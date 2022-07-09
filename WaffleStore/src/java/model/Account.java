/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DELL
 */
@Builder
@Getter
@Setter
@ToString
public class Account {
    
    public static final String ADMIN = "ADMIN";
    public static final String USER = "USER";

    private int id;
    private String username;
    private String password;
    private String displayName;
    private String address;
    private String email;
    private String phone;
    private String role;
}
