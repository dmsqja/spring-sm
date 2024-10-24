<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .info-label {
    display: block;
    font-weight: bold;
    color: #ffffff;
    margin-bottom: 0.5rem;
    background-color: #6c757d;
    padding: 0.5rem 1rem;
    border-radius: 4px;
  }
</style>
<div class="col-sm-10">
  <h2>Item Detail Page</h2>
  <div class="row">
    <div class="col-sm-8">
      <form id="register_form" enctype="multipart/form-data">

        <div class="form-group">
          <label class="info-label">Id:</label>
          <p>${item.itemId}</p>
        </div>
        <div class="form-group">
          <label class="info-label">Image:</label>
          <c:if test="${item.imgName != null}">
            <div>
              <img id="item_img" src="/imgs/${item.imgName}" style="width:500px">
            </div>
          </c:if>
        </div>
        <div class="form-group">
          <label class="info-label">Name:</label>
          <p>${item.itemName}</p></div>
        <div class="form-group">
          <label class="info-label">Price:</label>
          <p>${item.itemPrice}</p></div>
        <button type="button" class="btn btn-secondary" onclick="location.href='/item/getpage'">목록으로</button>
      </form>
    </div>
  </div>
</div>