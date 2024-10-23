<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .error-message{
    color: #dc3545; /* 에러 메시지를 위한 빨간색 계열 */
    font-size: 18px;
    padding: 15px;
    margin: 10px 0;
    background-color: #f8d7da; /* 연한 빨간색 배경 */
    border-radius: 4px;
    border: 1px solid #f5c6cb;
  }
</style>
<div class="col-sm-10">

  <h2>Error Page</h2>
  <p class="error-message">${msg}</p>
</div>