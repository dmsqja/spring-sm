<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #container{
    width:800px;
    height:600px;
    border: 2px solid blueviolet;
  }
  #controls{
    margin-bottom: 20px;
  }
</style>

<script>
  let chart2 ={
    init:function(){
      this.chart = null;
      this.bindEvents();
      this.getdata();
    },
    bindEvents:function(){
      $('#updateChart').on('click',()=>{
        this.getdata();
      })
    },
    getdata:function(){
      const year = $('#yearSelect').val();
      $.ajax({
        url:'/charts/chart2',
        data: {year:year},
        success:(datas)=>{
          this.display(datas,year);
        }
      })
    },
    display:function(datas, year){
      if(this.chart){
        this.chart.destroy();
      }
      this.chart = Highcharts.chart('container', {
        chart: {
          type: 'area'
        },
        title: {
          text: year + '년 남녀 월별 매출'
        },
        xAxis: {
          categories: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          accessibility: {
            description: '월'
          }
        },
        yAxis: {
          title: {
            text: '매출 (원)'
          }
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.y:,.0f}원</b>'
        },
        plotOptions: {
          area: {
            marker:{
              enabled: false,
              symbol: 'circle',
              radius: 2,
              states:{
                hover:{
                  enabled:true
                }
              }
            }
          }
        },
        series: datas
      });
    }
  };
  $(function(){
    chart2.init();
  });
</script>

<div class="col-sm-10">
  <h2>Chart2 Page</h2>
  <div id="controls">
    <select id="yearSelect">
      <option value="2020">2020</option>
      <option value="2021">2021</option>
      <option value="2022">2022</option>
      <option value="2023">2023</option>
      <option value="2024">2024</option>
    </select>
    <button id="updateChart">Update Chart</button>
  </div>
  <div id="container"></div>
</div>