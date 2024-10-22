package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.service.CarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/car")
public class CarController {

    private final CarService carService;
    String dir = "car/";

    @RequestMapping("")
    public String car(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"center");
        return "index";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id ) throws Exception {
        CarDto carDto = carService.get(id);
        model.addAttribute("car", carDto);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"detail");
        return "index";
    }
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, CarDto carDto) throws Exception {
        carService.modify(carDto);
        return "redirect:/car/detail?id="+carDto.getCarId();
    }
    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, @RequestParam("id") int id) throws Exception {
        carService.del(id);
        return "redirect:/car/get";
    }
    @RequestMapping("/findbyname")
    public String findByName(Model model, @RequestParam("id") int id ) throws Exception {
        List<CarDto> cars = carService.get();
        model.addAttribute("car", cars);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"detail");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/get")
    public String get(Model model, @RequestParam(required = false) String name) throws Exception {
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        List<CarDto> cars = carService.get();
        List<CarDto> cars;
        if (name != null && !name.trim().isEmpty()) {
            // 검색어가 있는 경우
            cars = carService.findByName(name);
        } else {
            // 검색어가 없는 경우 전체 목록
            cars = carService.get();
        }
        model.addAttribute("cars", cars);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"get");
        return "index";
    }
    @RequestMapping("/getpage")
    public String getpage(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) throws Exception  {
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.getPage(pageNo),5);
        model.addAttribute("cpage",p);
        model.addAttribute("target","/cust");
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
        PageInfo<CarDto> p;
        p = new PageInfo<>(carService.getFindPage(pageNo, search), 3); // 3:하단 네비게이션 개수
        model.addAttribute("cpage",p);
        model.addAttribute("target","cust");

        model.addAttribute("search",search);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"search");
        return "index";
    }
}
