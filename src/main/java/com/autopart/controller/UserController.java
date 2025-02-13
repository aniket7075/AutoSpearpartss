package com.autopart.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.autopart.model.Product;
import com.autopart.model.user;
import com.autopart.model.Order;
import com.autopart.respo.OrderRepository;
import com.autopart.respo.productinfo;
import com.autopart.respo.userinfo;



@Controller
public class UserController 
{

    @Autowired
    private userinfo userRepo;
    @Autowired
    private productinfo productRepo;

    @Autowired
    private  OrderRepository orderRepo;

    @RequestMapping("/")
    public String home() 
    {
        return "Home.jsp";
    }


	 @RequestMapping("/registration")
	    public String register(@ModelAttribute user newUser) 
	 {
		 userRepo.save(newUser);
	        return "login.jsp"; 
	    }
	    @RequestMapping("/login")
	    public String login(@RequestParam String email, 
	                        @RequestParam String password, 
	                        Model model, 
	                        HttpSession session) 
	    {

	        if ("admin@admin.com".equals(email) && "admin123".equals(password)) 
	        {
	            session.setAttribute("role", "ADMIN");
	            return "redirect:/adminDashboard";
	        }

	        user userFromDb =  userRepo.findByEmail(email);
	        if (userFromDb != null) 
	        {
	            if (userFromDb.getPassword().equals(password)) 
	            {
	                session.setAttribute("currentUser", userFromDb);
	                session.setAttribute("role", "USER");
	                return "redirect:/dashboard";
	                
	            } else 
	            {
	                model.addAttribute("error", "Invalid password");
	            }
	        } else 
	        {
	            model.addAttribute("error", "User not found");
	        }
	        return "login.jsp";
	    }
    @RequestMapping("/adminDashboard")
    public String showAdminDashboard(Model model) 
    {
        List<Product> products = productRepo.findAll();
        model.addAttribute("products", products);
        List<user> users = userRepo.findAll();
        model.addAttribute("users", users);
        return "adminDashboard.jsp";
    }

    @RequestMapping("/dashboard")
    public String showUserDashboard(Model model, HttpSession session) 
    {
        user currentUser = (user) session.getAttribute("currentUser");

        if (currentUser == null)
        {
            return "login.jsp"; // Redirecting to login page
        }

        model.addAttribute("currentUser", currentUser);
        List<Product> products = productRepo.findAll();
        model.addAttribute("products", products);

        Integer cartCount = (Integer) session.getAttribute("cartCount");
        if (cartCount == null) 
        {
            cartCount = 0;
        }
        model.addAttribute("cartCount", cartCount);

        return "Dashbord.jsp";
    }

    @RequestMapping("/fetchUsers")
    public String fetchUsers(Model model) 
    {
        List<user> userList = userRepo.findAll();
        model.addAttribute("users", userList);
        return "fetch.jsp";
    }

    @PostMapping("/addduser")
    public String useradd(@ModelAttribute user newUs) 
    {
        userRepo.save(newUs);
        return "fetchUsers";
    }

    @GetMapping("/editt")
    public String showEditUserForm(@RequestParam Integer id, Model model) 
    {
        user userToEdit = userRepo.findById(id).orElse(null);
        if (userToEdit != null) {
            model.addAttribute("user", userToEdit);
            return "editUser.jsp";
        }
        return "redirect:/fetchUsers";
    }

    @PostMapping("/editt")
    public String editUser(@ModelAttribute user editedUser) 
    {
        userRepo.save(editedUser);
        return "redirect:/fetchUsers";
    }

    @GetMapping("/deletee")
    public String deleteUser(@RequestParam Integer id) 
    {
        userRepo.deleteById(id);
        return "redirect:/fetchUsers";
    }

    @GetMapping("/add")
    public String showAddProductForm(Model model) 
    {
        model.addAttribute("product", new Product());
        return "addproduct.jsp";
    }

    @PostMapping("/add")
    public String addProduct(@ModelAttribute Product product, 
                             @RequestParam("photo") MultipartFile photo, 
                             RedirectAttributes redirectAttributes) throws IOException 
    {
        if (!photo.isEmpty()) 
        {
            String fileName = photo.getOriginalFilename();
            Path path = Paths.get("src/main/resources/static/img/" + fileName);
            File directory = new File("src/main/resources/static/img");
            if (!directory.exists()) 
            {
                directory.mkdirs();
            }
            photo.transferTo(path);
            product.setImage("/img/" + fileName);
        }
        productRepo.save(product);
        redirectAttributes.addFlashAttribute("message", "Product added successfully!");
        return "redirect:/list";
    }
    @RequestMapping("/list")
    public String listProducts(Model model)
    {
        List<Product> products = productRepo.findAll();
        model.addAttribute("products", products);
        return "productList.jsp";
    }

    @RequestMapping("/listt")
    public String listProductss(Model model)
    {
        List<Product> products = productRepo.findAll();
        model.addAttribute("products", products);
        return "productciew.jsp";
    }

    @GetMapping("/delete")
    public String deleteProduct(@RequestParam Integer id)
    {
        productRepo.deleteById(id);
        return "redirect:/list";
    }

    @GetMapping("/edit")
    public String showEditProductForm(@RequestParam Integer id, Model model)
    {
        Product product = productRepo.findById(id).orElse(null);
        model.addAttribute("product", product);
        return "editProduct.jsp";
    }

    @PostMapping("/editProduct")
    public String editProduct(@ModelAttribute Product product) 
    {
        productRepo.save(product);
        return "redirect:/list";
    }

    @PostMapping("/addToCart")
    public String addToCart(@RequestParam Integer productId, HttpSession session) 
    {
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null) 
        {
            cart = new ArrayList<>();
        }

        Product product = productRepo.findById(productId).orElse(null);
        if (product != null) {
            cart.add(product);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cartCount", cart.size());

        return "redirect:/dashboard";
    }

    @PostMapping("/removeFromCart")
    public String removeFromCart(@RequestParam Integer productId, HttpSession session) 
    {
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart != null) 
        {
            Iterator<Product> iterator = cart.iterator();
            while (iterator.hasNext()) 
            {
                Product product = iterator.next();
                if (product.getId().equals(productId)) 
                {
                    iterator.remove();
                    break;
                }
            }

            session.setAttribute("cart", cart);
            session.setAttribute("cartCount", cart.size());
        }

        return "redirect:/dashboard";
    }

    @PostMapping("/editCart")
    public String editCart(@RequestParam Integer productId, @RequestParam Integer quantity, HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null) {
            for (Product product : cart) {
                if (product.getId().equals(productId)) {
                    product.setQuantity(quantity);
                    break;
                }
            }
        }
        session.setAttribute("cart", cart);
        return "redirect:/dashboard";
    }
    @PostMapping("/clearCart")
    public String clearCart(HttpSession session)
    {
        session.removeAttribute("cart");
        session.setAttribute("cartCount", 0);
        return "redirect:/dashboard";
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session, Model model)
    {
        @SuppressWarnings("unchecked")
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null) {
            model.addAttribute("cart", cart);
        }
        return "checkout.jsp";
    }

    @PostMapping("/placeOrder")
    public String placeOrder(HttpSession session, Model model) 
    {
        List<Product> attribute = (List<Product>) session.getAttribute("cart");
		List<Product> cart = attribute;
        if (cart == null || cart.isEmpty()) 
        {
            model.addAttribute("message", "Your cart is empty!");
            return "redirect:/dashboard";
        }

        double totalAmount = 0;
        for (Product product : cart) 
        {
            totalAmount += product.getPrice();
        }
        model.addAttribute("cart", cart);
        model.addAttribute("totalAmount", totalAmount);

        session.removeAttribute("cart");

        return "Placed.jsp";
    }
    
   
}
