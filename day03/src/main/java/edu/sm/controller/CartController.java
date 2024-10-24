package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.CartService;
import edu.sm.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final ItemService itemService;
    String dir = "cart/";

    @RequestMapping("")
    public String cart(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }

    @PostMapping("/addimpl")
    public String addimpl(CartDto cartdto) throws Exception{
        cartService.add(cartdto);
        return "redirect:/cart/getpage";
    }

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        List<ItemDto> items = itemService.get();
        model.addAttribute("items", items);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/getpage")
    public String getpage(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception  {
        PageInfo<CartDto> p;
        p = new PageInfo<>(cartService.getPage(pageNo),5);
        model.addAttribute("cpage",p);
        model.addAttribute("target","/cart");
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"page");
        return "index";
    }
    @RequestMapping("/search")
    public String search(Model model) {

        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
    @RequestMapping("/findimpl")
    public String findimpl(Model model, Search search, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception {
        PageInfo<CartDto> p;
        p = new PageInfo<>(cartService.getFindPage(pageNo, search), 3); // 3:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","cart");

        model.addAttribute("search",search);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
}
