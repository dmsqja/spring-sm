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
  let map2 = {
    init:function(){
      $('#sbtn').click(()=>{
        // 37.548911, 126.948409
        this.makemap(37.548911, 126.948409, '서울여자중학교','seoul.jpg',100);
      });
      $('#bbtn').click(()=>{
        // 35.158861, 129.160328
        this.makemap(35.158861, 129.160328, '부산 해운대','busan.jpg',200);
      });
      $('#jbtn').click(()=>{
        // 33.472507, 126.485927
        this.makemap(33.472507, 126.485927, '제주 넥슨컴퓨터박물관','jeju.jpg',300);
      });
    },
    makemap:function(lat,lng,title, img, target){
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(lat, lng),
        level: 5
      };
      let map = new kakao.maps.Map(mapContainer, mapOption);
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var markerPosition  = new kakao.maps.LatLng(lat,lng);
      let marker = new kakao.maps.Marker({
        map:map,
        position: markerPosition
      });

      let iwContent = '<p>'+title+'</p>';
      iwContent += '<img style="width:150px;" src="<c:url value="/img/'+img+'"/> ">';
      let iwPosition = new kakao.maps.LatLng(lat,lng); //인포윈도우 표시 위치입니다
      let infowindow = new kakao.maps.InfoWindow({
        position : iwPosition,
        content : iwContent
      });
      kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
      kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
      kakao.maps.event.addListener(marker,'click',clickHandler(target));

      function clickHandler(target){
        return function(){
          location.href='<c:url value="/map/go?target='+target+'"/>';
        };
      };
      function overHandler(map,marker,infowindow){
        return function(){
          infowindow.open(map, marker);
        };
      };
      function outHandler(infowindow){
        return function(){
          infowindow.close();
        };
      };
    },
    markers:function(target){
      // lat, lng, title, img, code
      let datas = [];

    }
  };

  $(function(){
    map2.init();
  });
</script>
<div class="col-sm-10">

  <h2>Map2 Page</h2>
  <button id="sbtn">Seoul</button>
  <button id="bbtn">Busan</button>
  <button id="jbtn">Jeju</button>
  <div id="map"></div>

</div>