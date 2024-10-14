<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #map {
    width: 600px;
    height: 500px;
    border: 2px solid darkred;
  }
</style>
<script>
  let mapSearch = {
    init: function() {
      this.createMap(37.566826, 126.9786567, '서울 맛집');
    },
    createMap: function(lat, lng, keyword) {
      let mapContainer = document.getElementById('map');
      let mapOption = {
        center: new kakao.maps.LatLng(lat, lng),
        level: 7
      };
      let map = new kakao.maps.Map(mapContainer, mapOption);

      // 지도 컨트롤 추가
      map.addControl(new kakao.maps.MapTypeControl(), kakao.maps.ControlPosition.TOPRIGHT);
      map.addControl(new kakao.maps.ZoomControl(), kakao.maps.ControlPosition.RIGHT);

      let infowindow = new kakao.maps.InfoWindow({zIndex:1});
      let places = new kakao.maps.services.Places();

      // 키워드로 장소 검색
      places.keywordSearch(keyword, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          let bounds = new kakao.maps.LatLngBounds();

          for (let i = 0; i < result.length; i++) {
            displayMarker(result[i]);
            bounds.extend(new kakao.maps.LatLng(result[i].y, result[i].x));
          }

          map.setBounds(bounds);
        }
      });

      // 마커 표시 함수
      function displayMarker(place) {
        let marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(place.y, place.x)
        });

        kakao.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
          infowindow.open(map, marker);
        });
      }
    }
  };

  $(function() {
    mapSearch.init();
  });
</script>
<div class="col-sm-10">
  <h2>맛집 검색 지도</h2>
  <div id="map"></div>
</div>