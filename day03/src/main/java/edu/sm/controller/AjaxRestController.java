package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import netscape.javascript.JSObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("rid") String id){
        JSONObject obj = new JSONObject();
        if(id.equals("qqqq") || id.equals("qqqqq")){
            obj.put("result","1");
        }else{
            obj.put("result","0");
        }
        return obj;
    }

    @RequestMapping("/getctime")
    public Object getctime(){
        JSONObject obj = new JSONObject();
        // {'ctime','2023-12-12'}
        LocalDateTime now = LocalDateTime.now();
        obj.put("ctime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now));
        return obj;
    }
    @RequestMapping("/getdata")
    public Object getdata(){
        // [{"no":1, "desc":"연무5호"},{},{}]
        JSONArray arr = new JSONArray();
        for(int i=1;i<6;i++){
            JSONObject obj = new JSONObject();
            obj.put("no",i);
            obj.put("desc","연무5호");
            arr.add(obj);
        }
        return arr;
    }
}