package vn.edu.iuh.fit.frontend.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.iuh.fit.backend.models.Product;
import vn.edu.iuh.fit.backend.models.ProductImage;
import vn.edu.iuh.fit.backend.models.ProductPrice;
import vn.edu.iuh.fit.frontend.models.ProductModel;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.Flow;

@WebServlet(urlPatterns = {"/control-servlet"})
public class ControlServlet extends HttpServlet {
    private final ProductModel productModel = new ProductModel();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action){
            case "getListProduct":
                handleGetListProduct(req, resp);
                break;
            case "getListProduct2":

                break;
        }
    }

    private void handleGetListProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<Product> productList = productModel.getAll();
        for (Product p : productList) {
            System.out.println(p);
            ProductImage productImage = p.getProductImageList().get(0);
            System.out.println(productImage);
            ProductPrice productPrice = p.getProductPriceList().get(0);
            System.out.println(productPrice);
        }
        HttpSession session = req.getSession();
        session.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


}
