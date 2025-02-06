//package com.example.cake.Cake_Shop.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.example.cake.Cake_Shop.model.Product;
//
//import com.example.cake.Cake_Shop.respo.productinfo;
//
//import java.util.List;
//
//@Controller
////@RequestMapping("/product")
////public class ProductController {
////
////    @Autowired
////    private productinfo productRepo;
////
////    // Show Add Product Form
////    @GetMapping("/add")
////    public String showAddProductForm(Model model) {
////        model.addAttribute("product", new Product());
////        return "addProduct.jsp";
////    }
////
////    // Handle Add Product Submission
////    @PostMapping("/add")
////    public String addProduct(@ModelAttribute Product product) {
////        productRepo.save(product);
////        return "redirect:/product/list";
////    }
////
////    // List All Products
////    @GetMapping("/list")
////    public String listProducts(Model model) {
////        List<Product> products = productRepo.findAll();
////        model.addAttribute("products", products);
////        return "productList.jsp";
////    }
////
////    // Delete a Product
////    @GetMapping("/delete")
////    public String deleteProduct(@RequestParam Integer id) {
////        productRepo.deleteById(id);
////        return "redirect:/product/list";
////    }
////
////    // Show Edit Product Form
////    @GetMapping("/edit")
////    public String showEditProductForm(@RequestParam Integer id, Model model) {
////        Product product = productRepo.findById(id).orElse(null);
////        model.addAttribute("product", product);
////        return "editProduct.jsp";
////    }
////
////    // Handle Edit Product Submission
////    @PostMapping("/edit")
////    public String editProduct(@ModelAttribute Product product) {
////        productRepo.save(product);
////        return "redirect:/product/list";
////    }
//}



