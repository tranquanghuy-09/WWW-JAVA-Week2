package models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "order")
public class Order {
    private long id;
    private LocalDateTime orderDate;

}
