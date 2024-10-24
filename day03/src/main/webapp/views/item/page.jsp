<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Item Page Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
  <table class="table">
    <thead class="thead-dark">
    <tr>
      <th>Image</th>
      <th>Id</th>
      <th>Name</th>
      <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${cpage.getList()}">
      <tr>
        <td>
          <c:if test="${c.imgName != null}">
            <img id="item_img" src="/imgs/${c.imgName}">
          </c:if>
        </td>
        <td><a href="/item/detail?id=${c.itemId}">${c.itemId}</a></td>
        <td>${c.itemName}</td>
        <td>${c.itemPrice}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <jsp:include page="../nav.jsp"/>
</div>
