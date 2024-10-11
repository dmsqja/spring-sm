package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime(){
        JSONObject obj = new JSONObject();
        // {'ctime','2023-12-12'}
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter =
                DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG);
        String ctime = formatter.format(now);
        obj.put("ctime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(now));
        return obj;
    }
}
