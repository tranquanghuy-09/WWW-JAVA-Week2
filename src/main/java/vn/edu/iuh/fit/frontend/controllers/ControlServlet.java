package vn.edu.iuh.fit.frontend.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.iuh.fit.backend.models.*;
import vn.edu.iuh.fit.backend.services.ProductService;
import vn.edu.iuh.fit.frontend.models.ProductModel;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
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
            case "addToCart":
                handleAddToCart(req, resp);
                break;
        }
    }

    private void handleAddToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        long idProduct = Integer.parseInt(req.getParameter("id"));
        HttpSession session = req.getSession();
        List<CartDetail> cartDetailList = (List<CartDetail>) session.getAttribute("cartDetailList");
        if (cartDetailList==null){
            cartDetailList = new ArrayList<>();
        }

        Optional<Product> optionalProduct = productModel.findById(idProduct);
        if (optionalProduct.isPresent()){
            Product product = optionalProduct.get();
            CartDetail cartDetail = new CartDetail(product, 1);
            cartDetailList.add(cartDetail);

        }
        session.setAttribute("cartDetailList", cartDetailList);
        resp.sendRedirect("index.jsp");
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
