<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  #car_img{
    width:200px;
  }
  .search-box {
       margin-bottom: 20px;
  }
</style>


<div class="col-sm-10">
  <h2>Car Get Page</h2>

  <div class="search-box">
    <form class="form-inline" action="<c:url value='/car/get'/>">
      <div class="input-group">
        <input type="text" class="form-control" name="name" placeholder="차량 이름 검색" value="${param.name}">
        <div class="input-group-append">
          <button class="btn btn-outline-success" type="submit">검색</button>
        </div>
      </div>
    </form>
  </div>



  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>Img</th>
        <th>Name</th>
        <th>Price</th>
        <th>Color</th>
        <th>Type</th>
        <th>Production Date</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${cars}">
      <tr>
        <td><img id="car_img" src="<c:url value="/img"/>/${c.carImg}"></td>
        <td><a href="<c:url value="/car/detail?id=${c.carId}"/>">${c.carName}</a></td>
        <td><fmt:formatNumber type="number" pattern="###,###,###원" value="${c.carPrice}"/></td>
        <td>${c.carColor}</td>
        <td>${c.carType}</td>
<%--    <td><fmt:formatDate value="${c.productionDate}" pattern="yyyy년MM월dd일 HH시mm분ss초"/></td>--%>
        <td>${c.productionDate}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>