<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
  #map{
    width:600px;
    height:500px;
    border:2px solid darkred;
  }
</style>


<script>
  let map1 = {
    map:null,
    init:function(){
      this.makemap();
      $('#sbtn').click(()=>{
        this.goseoul();
      });
      $('#bbtn').click(()=>{
        this.gobusan();
      });
      $('#jbtn').click(()=>{
        this.gojeju();
      });
    },
    makemap:function(){
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(36.834385, 127.147080),
        level: 5
      };
      this.map = new kakao.maps.Map(mapContainer, mapOption);
      let mapTypeControl = new kakao.maps.MapTypeControl();
      this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      let zoomControl = new kakao.maps.ZoomControl();
      this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      let markerPosition  = new kakao.maps.LatLng(36.834385, 127.147080);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    },
    goseoul:function(){
      //37.548911, 126.948409
      var moveLatLon = new kakao.maps.LatLng(37.548911, 126.948409);
      this.map.panTo(moveLatLon);
      let markerPosition  = new kakao.maps.LatLng(37.548911, 126.948409);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    },
    gobusan:function(){
      //35.158861, 129.160328
      var moveLatLon = new kakao.maps.LatLng(35.158861, 129.160328);
      this.map.panTo(moveLatLon);
      let markerPosition  = new kakao.maps.LatLng(35.158861, 129.160328);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    },
    gojeju:function(){
      //33.472507, 126.485927
      var moveLatLon = new kakao.maps.LatLng(33.472507, 126.485927);
      this.map.panTo(moveLatLon);
      let markerPosition  = new kakao.maps.LatLng(33.472507, 126.485927);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(this.map);
    }
  };

  $(function(){
    map1.init();
  });
</script>


<div class="col-sm-10">

  <h2>Map1 Page</h2>
  <button id="sbtn">Seoul</button>
  <button id="bbtn">Busan</button>
  <button id="jbtn">Jeju</button>
  <div id="map"></div>

</div>