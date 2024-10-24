package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.ItemService;
import edu.sm.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.UUID;

@Controller
@Slf4j
@RequestMapping("/item")
public class ItemController {

    private final ItemService itemService;
    String dir = "item/";

    @Value("${app.dir.imgdir}")
    String imgdir;

    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @RequestMapping("")
    public String item(Model model) {
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/getpage")
    public String getpage(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","/item");
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"page");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) throws Exception {
        ItemDto itemDto = null;
        itemDto = itemService.get(id);
        model.addAttribute("item",itemDto);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";
    }
    @RequestMapping("/search")
    public String search(Model model) {

        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Search search, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception {
        PageInfo<ItemDto> p;
        p = new PageInfo<>(itemService.getFindPage(pageNo, search), 3); // 3:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","item");

        model.addAttribute("search",search);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
}
