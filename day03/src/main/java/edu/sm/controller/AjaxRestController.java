package edu.sm.controller;

import edu.sm.dto.Marker;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getmarkers")
    public Object getmarkers(@RequestParam("target") int target) {
        List<Marker> markers = new ArrayList<Marker>();
        if(target == 100){
            markers.add(new Marker(37.564472,126.990841,"순대국1","ss1.jpg",101));
            markers.add(new Marker(37.544472,126.970841,"순대국2","ss2.jpg",102));
            markers.add(new Marker(37.564472,126.970841,"순대국3","ss3.jpg",103));
        }else if(target == 200){
            markers.add(new Marker(35.158720,129.171178,"횟집1","bb1.jpg",201));
            markers.add(new Marker(35.159917,129.157196,"횟집2","bb2.jpg",202));
            markers.add(new Marker(35.166329,129.157862,"횟집3","bb3.jpg",203));
        }else if(target == 300){
            markers.add(new Marker(33.247061,126.567452,"흑돼지1","jj1.jpg",301));
            markers.add(new Marker(33.248496,126.561658,"흑돼지2","jj2.jpg",302));
            markers.add(new Marker(33.251332,126.559727,"흑돼지3","jj3.jpg",303));
        }else if(target == 400){
            markers.add(new Marker(36.341617, 127.392739, "빵집1","dd1.jpg",401));
            markers.add(new Marker(36.360697, 127.378981, "빵집2","dd2.jpg",402));
            markers.add(new Marker(36.352195, 127.395718, "빵집3","dd3.jpg",403));
        }
        return markers;
    }

    @RequestMapping("/getbike")
    public Object getbike(){
        JSONObject obj = new JSONObject();
        double lat = 36.799119;
        double lng = 127.065283;
        Random r = new Random();
        float num = r.nextFloat(1);
        lat += num/10;
        lng += num/10;
        obj.put("lat", lat);
        obj.put("lng", lng);
        return obj;
    }


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