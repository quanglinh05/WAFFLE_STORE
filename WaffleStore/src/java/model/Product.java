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
public class Product {
    private int id;
    private String name;
    private int quantity; //số lượng sản phẩm trong kho
    private double price;
    private String description;
    private String imageUrl;
    private int category_Id;
}
