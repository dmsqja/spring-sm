package edu.sm.controller;

import com.opencsv.CSVReader;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Random;

@RestController
@Slf4j
@RequestMapping("/charts")
public class ChartRestController {

    @Value("${app.dir.readlogdir}")
    String readlogdir;  // 컨트롤러가 실행이 되면서 자동으로 세팅이 됨

    @RequestMapping("/chart1")
    public Object chart1() throws Exception {
        String logfile = readlogdir+"power.log";

        JSONObject result = new JSONObject();

        // [{}]
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("name","Power");

        CSVReader reader = null;
        reader = new CSVReader(new FileReader(logfile));

        String [] lineData = null;
        JSONArray jsonArray1 = new JSONArray();
        JSONArray timeArray = new JSONArray();
        String endline = "";
        String endTime = "";
        while((lineData = reader.readNext()) != null){
            jsonArray1.add(Float.parseFloat(lineData[1]));
            timeArray.add(lineData[0]);
            endTime = lineData[0];
            endline = lineData[1];
        }

        jsonObject.put("data",jsonArray1);

        jsonArray.add(jsonObject);
        log.info(jsonObject.toJSONString());

        // [{}]
        // {'x':[], result:[{}]}
        result.put("result",jsonArray);
        result.put("x", timeArray);
        result.put("endtime", endTime);
        result.put("ednline", Float.parseFloat(endline));
        log.info(result.toJSONString());
        return result;
    }

//    @RequestMapping("/chart2")
//    public Object chart2(@RequestParam(value = "year", defaultValue = "2020") int year){
//        JSONArray jsonArray = new JSONArray();
//        String[] gender = {"남자", "여자"};
//
//        for(int i=0;i<2;i++){
//            JSONObject obj = new JSONObject();
//            obj.put("name", gender[i]);
//            JSONArray jsonArray1 = new JSONArray();
//            for(int j=1;j<=12;j++){
//                jsonArray1.add(r.nextInt(40000) + 1);
//            }
//            obj.put("data",jsonArray1);
//            jsonArray.add(obj);
//        }
//        return jsonArray;
//    }
//
//    @RequestMapping("/chart3")
//    public Object chart3(){
//        JSONObject result = new JSONObject();
//        result.put("chart1", getChart1Data());
//        result.put("chart2", getChart2Data());
//        result.put("chart3", getChart3Data());
//        result.put("chart4", getChart4Data());
//        return result;
//    }
//
//    private JSONArray getChart1Data(){
//        JSONArray data = new JSONArray();
//        for (int i = 0; i < 4; i++) {
//            data.add(r.nextInt(1000) + 500);
//        }
//        return data;
//    }
//
//    private JSONArray getChart2Data(){
//        JSONArray data = new JSONArray();
//        String[] products = {"제품A", "제품B", "제품C", "제품D"};
//        for(String product : products){
//            JSONObject obj = new JSONObject();
//            obj.put("name", product);
//            obj.put("y", r.nextInt(30)+10);
//            data.add(obj);
//        }
//        return data;
//    }
//
//    private JSONArray getChart3Data(){
//        JSONArray data = new JSONArray();
//        for (int i = 0; i < 12; i++) {
//            data.add(r.nextInt(10000) + 5000);
//        }
//        return data;
//    }
//
//    private JSONArray getChart4Data(){
//        JSONArray data = new JSONArray();
//        String[] departments = {"인사부", "영업부","개발부"};
//        for(String dept : departments){
//            JSONObject series = new JSONObject();
//            series.put("name", dept);
//            JSONArray seriesData = new JSONArray();
//            for (int i = 0; i < 6; i++) {
//                seriesData.add(r.nextInt(500) + 100);
//            }
//            series.put("data", seriesData);
//            data.add(series);
//        }
//        return data;
//    }
}
