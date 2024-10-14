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
        marker:null,
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
                center: new kakao.maps.LatLng(36.799119, 127.075283),
                level: 5
            };
            this.map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(36.799119, 127.075283);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '<div>Hello World!</div><img style="width:100px;" src="<c:url value="/img/sm.jpg"/> ">';
            let iwPosition = new kakao.maps.LatLng(36.799119, 127.075283); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('http://sunmoon.ac.kr'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        goseoul:function(){
            this.marker.setMap(null);

            // 37.548911, 126.948409
            var moveLatLon = new kakao.maps.LatLng(37.548911, 126.948409);
            this.map.panTo(moveLatLon);
            var markerPosition  = new kakao.maps.LatLng(37.548911, 126.948409);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });
            this.marker.setMap(this.map);

            let iwContent = '<div>서울여자중학교</div><img style="width:100px;" src="<c:url value="/img/seoul.jpg"/> ">';
            let iwPosition = new kakao.maps.LatLng(37.548911, 126.948409); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('https://seoul.sen.ms.kr/'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        gobusan:function(){
            this.marker.setMap(null);

            // 35.158861, 129.160328
            var moveLatLon = new kakao.maps.LatLng(35.158861, 129.160328);
            this.map.panTo(moveLatLon);
            this.marker = null;
            var markerPosition  = new kakao.maps.LatLng(35.158861, 129.160328);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '<div>부산해운대</div><img style="width:100px;" src="<c:url value="/img/busan.jpg"/> ">';
            let iwPosition = new kakao.maps.LatLng(35.158861, 129.160328); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000201001001000&uc_seq=373&lang_cd=ko'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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
        gojeju:function(){
            this.marker.setMap(null);
            // 33.472507, 126.485927
            var moveLatLon = new kakao.maps.LatLng(33.477162, 126.483113);
            this.map.panTo(moveLatLon);
            this.marker = null;
            var markerPosition  = new kakao.maps.LatLng(33.477162, 126.483113);
            this.marker = new kakao.maps.Marker({
                position: markerPosition
            });

            this.marker.setMap(this.map);

            let iwContent = '<div>넥슨컴퓨터박물관</div><img style="width:100px;" src="<c:url value="/img/jeju.jpg"/> ">';
            let iwPosition = new kakao.maps.LatLng(33.477162, 126.483113); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(this.marker,'mouseover',overHandler(this.map,this.marker,infowindow));
            kakao.maps.event.addListener(this.marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(this.marker,'click',clickHandler('https://computermuseum.nexon.com/'));

            function clickHandler(target){
                return function(){
                    location.href=target;
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