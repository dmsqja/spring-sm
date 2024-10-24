<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Cart Search Page</h2>
  <form action="/cart/findimpl" method="get">
    <div class="form-group">
      <div class="row">
        <div class="col-sm-2">
          <h5>Search</h5>
        </div>
        <div class="col-sm-3">
          <select class="form-control" name="keyword">
            <option value="custid"
                    <c:if test="${search.keyword == 'custid'}"> selected </c:if>
            >CUSTID</option>
            <option value="itemid"
                    <c:if test="${search.keyword == 'itemid'}"> selected </c:if>
            >ITEMID</option>
          </select>
        </div>
        <div class="col-sm-4">
          <input type="text" class="form-control" name="search"
          <c:if test="${search.search != null}"> value="${search.search}" </c:if>
          >
        </div>
        <div class="col-sm-3">
          <button type="submit" class="btn btn-primary">Search</button>
        </div>
      </div>
    </div>
  </form>
  <table class="table">
    <thead class="thead-dark">
    <tr>
      <th>Cust_Id</th>
      <th>Item_Id</th>
      <th>Count</th>
      <th>Reg_Date</th>
      <th>Item_Name</th>
      <th>Item_Price</th>
      <th>Img_Name</th>
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
        <td>${c.imgName}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <c:if test="${cpage.getSize() != null}">
    <jsp:include page="../searchnav.jsp"/>
  </c:if>
</div>