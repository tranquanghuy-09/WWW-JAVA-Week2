package vn.edu.iuh.fit.backend.models;

import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "order")
public class Order {
    @Id
    @Column(name = "order_id", columnDefinition = "bigint(20)")
    private long id;
    @Column(name = "orderDate", columnDefinition = "datetime(6)")
    private LocalDateTime orderDate;
    @ManyToOne
    private Customer customer;
    @ManyToOne
    private Employee employee;
    @OneToMany
    private List<OrderDetail> orderDetails;


}
