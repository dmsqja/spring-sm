<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Cart Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
  <table class="table">
    <thead class="thead-dark">
    <tr>
      <th>Cust_Id</th>
      <th>Item_Id</th>
      <th>Count</th>
      <th>Reg_Date</th>
      <th>Item_Name</th>
      <th>Item_Price</th>
      <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${cpage.getList()}">
      <tr>
        <td>${c.cartCustId}</td>
        <td>${c.cartItemId}</td>
        <td>${c.cartCount}</td>
        <td>${c.cartRegDate}</td>
        <td>${c.itemName}</td>
        <td>${c.itemPrice}</td>
        <td>
          <c:if test="${not empty c.imgName}">
            <img src="/imgs/${c.imaName}" alt="${c.itemName}" style="width: 100px; height: 100px;">
          </c:if>
          <c:if test="${empty c.imgName}">
            No Image
          </c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <jsp:include page="../nav.jsp"/>
</div>
