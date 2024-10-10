<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
let js5 = {
  init:function(){
    $('#login-form > button').click(()=>{
      this.check();
    });
  },
  check:function(){
    let id = $('#id').val();  //id 영역에 있는 값을 가져옴
    let pwd = $('#pwd').val();  //pwd 영역에 있는 값을 가져옴
    if(id == '' || id == null){
      alert('Id is Mandatory');
      $('#id').focus();
      return;
    }
    if(pwd == '' || pwd == null){
      alert('Pwd is Mandatory');
      $('#pwd').focus();
      return;
    }
    this.send();
  },
  send:function(){
    // method, action 두가지를 넣어야 함
    $('#login-form').attr('method','post');
    $('#login-form').attr('action','/loginimpl');
    $('#login-form').submit();
  }
};

$(document).ready(function (){
  js5.init();
});
</script>
<div class="col-sm-10">

  <h2>JS5 Page</h2>
  <form id="login-form">
    <div class="form-group">
      <label for="id">id:</label>
      <input type="text" class="form-control" placeholder="Enter id" id="id" name="id">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="pwd">
    </div>

<%--    <button type="submit" class="btn btn-primary">Submit</button> // 이새기 때문에 id 와 pwd를 넣지 않고 진행하면 초기화댐--%>
    <button type="button" class="btn btn-primary">Submit</button>
  </form>

</div>