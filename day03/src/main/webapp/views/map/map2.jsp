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
      this.makemap(37.548911, 126.948409, '서울여자중학교','seoul.jpg',100);

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
        level: 7
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
      this.markers(target,map);
    },
    markers:function(target,map){
      // lat, lng, title, img, code
      let datas = [];
      if(target == 100){
        datas = [
          {lat:37.568911, lng:126.958409, title:'순대국1', img:'ss1.jpg', code:101},
          {lat:37.558911, lng:126.968409, title:'순대국2', img:'ss2.jpg', code:102},
          {lat:37.578911, lng:126.978409, title:'순대국3', img:'ss3.jpg', code:103}
        ];
      }else if(target == 200){

      }else{

      }
      let imgsrc1 = 'https://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png';
      let imgsrc2 = '<c:url value="/img/m.jpg"/>';

      $(datas).each(function(index, item){
        let imgsize = new kakao.maps.Size(30,30); //여기서 30은 픽셀을 의미함
        let markerimg = new kakao.maps.MarkerImage(imgsrc2, imgsize);
        let markerposition = new kakao.maps.LatLng(item.lat,item.lng);
        let marker = new kakao.maps.Marker({
          map: map,
          position:markerposition,
          image:markerimg
        });
        let iwContent = '<p>'+item.title+'</p>';
        iwContent += '<img style="width:150px;" src="<c:url value="/img/'+item.img+'"/> ">';
        let iwPosition = new kakao.maps.LatLng(item.lat,item.lng); //인포윈도우 표시 위치입니다
        let infowindow = new kakao.maps.InfoWindow({
          position : iwPosition,
          content : iwContent
        });
        kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
        kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
        kakao.maps.event.addListener(marker,'click',clickHandler(item.code));

        function clickHandler(target){
          return function(){
            location.href='<c:url value="/map/go?target='+target+'"/> ';
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
      });
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