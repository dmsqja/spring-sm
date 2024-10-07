package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("head", "Hello World");
        model.addAttribute("head2", "This is the head2");
        model.addAttribute("body", "this is the body");
        return "index";
    }
}
