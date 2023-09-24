package vn.edu.iuh.fit.backend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    private Order order;
    private Product product;
    private double quantity;
    private double price;
    private String note;
}
