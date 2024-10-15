<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #container1, #container2, #container3, #container4{
    width: 400px;
    height: 400px;
    margin-bottom: 20px;
  }
  #container1 { border: 2px solid orangered; }
  #container2 { border: 2px solid darkgreen; }
  #container3 { border: 2px solid blueviolet; }
  #container4 { border: 2px solid deepskyblue; }
</style>


<script>
  let chart3 = {
    init:function(){
      this.getdata();
    },
    getdata:function(){
      $.ajax({
        url:'/charts/chart3',
        success:(data)=>{
          this.display(data);
        }
      });
    },
    display:function(data) {
      if(data.chart1) this.displayChart1(data.chart1);
      if(data.chart2) this.displayChart2(data.chart2);
      if(data.chart3) this.displayChart3(data.chart3);
      if(data.chart4) this.displayChart4(data.chart4);
    },
    displayChart1:function(data){
      Highcharts.chart('container1',{
        chart: { type: 'column' },
        title: { text: '분기별 매출' },
        xAxis: { categories: ['Q1','Q2','Q3','Q4'] },
        yAxis: { title: { text: '매출 (백만원)' } },
        series: [{ name: '매출', data: data }]
      });
    },
    displayChart2:function(data){
      Highcharts.chart('container2',{
        chart: { type: 'pie' },
        title: { text: '제품별 판매 비율' },
        series: [{
          name: '판매 비율',
          data: data
        }]
      });
    },
    displayChart3:function(data){
      Highcharts.chart('container3',{
        chart: { type: 'line' },
        title: { text: '월별 사용자 수' },
        xAxis: { categories: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월' ] },
        yAxis: { title: { text: '사용자 수' } },
        series: [{ name: '사용자 수', data:data } ]
      });
    },
    displayChart4:function(data){
      Highcharts.chart('container4',{
        chart: { type: 'area' },
        title: { text: '부서별 비용' },
        xAxis: { categories: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월' ] },
        yAxis: { title: { text: '비용 (만원)' } },
        series: data
      });
    }
  };
  $(function(){
    chart3.init();
  });
</script>


<div class="col-sm-10">
  <h2>Chart3 Page</h2>
  <div class="row">
    <div class="col-sm-7">
      <div id="container1"></div>
      <p/>
      <div id="container3"></div>
    </div>
    <div class="col-sm-5">
      <div id="container2"></div>
      <p/>
      <div id="container4"></div>
    </div>
  </div>
</div>