package vn.vpgh.phoneshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ItemController {
    
    @GetMapping("/product/{id}")
    public String getProductPage(@PathVariable long id) {
        return "/client/product/detail";
    }
    
}
