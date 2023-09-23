package models;

import enums.ProductStatus;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private long id;
    @Column(name = "name", length = 150, nullable = false)
    private String name;
    @Column(name = "description", length = 250, nullable = true)
    private String description;
    @Column(name = "unit",length = 25, nullable = false)
    private int unit;
    @Column(name = "manufacturer_name", length = 100, nullable = true)
    private String manufacturerName;
    @Column(name = "status", nullable = false)
    private ProductStatus status;

    @OneToMany(mappedBy="product")
    private List<ProductPrice> listOrder;

    public Product() {
    }

    public Product(long id, String name, String description, int unit, String manufacturerName, ProductStatus status, List<ProductPrice> listOrder) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.unit = unit;
        this.manufacturerName = manufacturerName;
        this.status = status;
        this.listOrder = listOrder;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public String getManufacturerName() {
        return manufacturerName;
    }

    public void setManufacturerName(String manufacturerName) {
        this.manufacturerName = manufacturerName;
    }

    public ProductStatus getStatus() {
        return status;
    }

    public void setStatus(ProductStatus status) {
        this.status = status;
    }

    public List<ProductPrice> getListOrder() {
        return listOrder;
    }

    public void setListOrder(List<ProductPrice> listOrder) {
        this.listOrder = listOrder;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", unit=" + unit +
                ", manufacturerName='" + manufacturerName + '\'' +
                ", status=" + status +
                ", listOrder=" + listOrder +
                '}';
    }
}
