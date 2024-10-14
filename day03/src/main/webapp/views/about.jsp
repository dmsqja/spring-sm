<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #map1, #map2{
    width:400px;
    height:300px;
    border:1px solid indianred;
  }
</style>
<script>
  let about = {
    init:function(){
      this.map1();
      this.map2();
    },
    map1:function(){
      let mapContainer = document.getElementById('map1'); // 지도를 표시할 div
      let mapOption = {
                center: new kakao.maps.LatLng(36.799119, 127.075283), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
              };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      let map = new kakao.maps.Map(mapContainer, mapOption);

      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      let mapTypeControl = new kakao.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      let zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다

      // 마커가 표시될 위치입니다
      let markerPosition  = new kakao.maps.LatLng(36.799119, 127.075283);

      // 마커를 생성합니다
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);


    },
    map2:function() {
      let mapContainer = document.getElementById('map2'); // 지도를 표시할 div
      let mapOption = {
        center: new kakao.maps.LatLng(36.834385, 127.147080), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
      };
      let map = new kakao.maps.Map(mapContainer, mapOption);
      let mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      let zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      let markerPosition  = new kakao.maps.LatLng(36.834385, 127.147080);
      let marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);
    }
  };

  $(function(){
    about.init();
  });
</script>


<div class="col-sm-10">

  <h2>About Page</h2>
  <div class="row">
    <div class="col-sm-6">
      <div id="map1"></div>
    </div>
    <div class="col-sm-6">
      <div id="map2"></div>
    </div>
  </div>

</div>