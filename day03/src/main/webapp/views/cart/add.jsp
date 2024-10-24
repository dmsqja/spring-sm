<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Cart Add Page</h2>
  <h2>장바구니 담기</h2>

  <form action="/cart/addimpl" method="post">
    <div class="form-group">
      <label for="cartCustId">고객 ID:</label>
      <input type="number" class="form-control" id="cartCustId" name="cartCustId" required>
    </div>

    <div class="form-group">
      <label for="cartItemId">상품 ID:</label>
      <input type="number" class="form-control" id="cartItemId" name="cartItemId" required>
    </div>

    <div class="form-group">
      <label for="cartCount">수량:</label>
      <input type="number" class="form-control" id="cartCount" name="cartCount" required min="1" value="1">
    </div>

    <button type="submit" class="btn btn-primary">장바구니에 담기</button>
  </form>
</div>