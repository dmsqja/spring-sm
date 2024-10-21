<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let detail = {
    init:function() {
      $('#update_btn').click(() => {
        this.check();
      });
      $('#delete_btn').click(() => {
        let id = $('#carId').val();
        console.log(id);
        let c = confirm("정말로 이 차량을 삭제하시겠습니까???");
        if(c == true){
          let d = confirm("진짜진짜 리얼루다가 삭제할꺼임???세번은 안묻는다")
          if(d == true){
            location.href='<c:url value="/car/deleteimpl"/>'+'?id='+id;
          }
        }
      });
    },
    check:function(){
      let id = $('#carId').val();
      let name = $('#carName').val();
      let price = $('#carPrice').val();
      let color = $('#carColor').val();
      let type = $('#carType').val();


      if(id == '' || id == null){
        alert('Id is Mandatory');
        $('#carId').focus();
        return;
      }
      if(name == '' || name == null){
        alert('Name is Mandatory');
        $('#carName').focus();
        return;
      }
      if(price == '' || price == null){
        alert('Price is Mandatory');
        $('#carPrice').focus();
        return;
      }
      if(color == '' || color == null){
        alert('Color is Mandatory');
        $('#carColor').focus();
        return;
      }
      if(type == '' || type == null){
        alert('Type is Mandatory');
        $('#carType').focus();
        return;
      }
      this.send();
    },
    send:function(){
      // method, action
      $('#register_form').attr('method','post');

      $('#register_form').attr('action','/car/updateimpl');
      $('#register_form').submit();
    }
  };

  $(function(){
    detail.init();
  });
</script>

<div class="col-sm-10">
  <h2>Detail Page</h2>
  <div class="row">
    <div class="col-sm-8">
      <form id="register_form">
        <div class="form-group">
          <label for="carImg">Image:</label>
          <input type="text" value="${car.carImg}" class="form-control" id="carImg" name="carImg">
        </div>
        <div class="form-group">
          <label for="carId">Id:<span id="id_span"></span></label>
          <input type="text" value="${car.carId}" class="form-control" placeholder="Enter id" id="carId" name="carId">
        </div>
        <div class="form-group">
          <label for="carName">Name:</label>
          <input type="password" value="${car.carName}" class="form-control" placeholder="Enter name" id="carName" name="carName">
        </div>
        <div class="form-group">
          <label for="carPrice">Price:</label>
          <input type="text" value="${car.carPrice}" class="form-control" placeholder="Enter price" id="carPrice" name="carPrice">
        </div>
        <div class="form-group">
          <label for="carColor">Color:</label>
          <input type="text" value="${car.carColor}" class="form-control" placeholder="Enter color" id="carColor" name="carColor">
        </div>
        <div class="form-group">
          <label for="carType">Type:</label>
          <input type="text" value="${car.carType}" class="form-control" placeholder="Enter type" id="carType" name="catType">
        </div>
        <div class="form-group">
          <label for="productionDate">Production Date:</label>
          <input type="datetime-local" value="${car.productionDate}" class="form-control" id="productionDate" name="productionDate">
        </div>
        <button type="button" id="update_btn" class="btn btn-primary">Update</button>
        <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
      </form>
    </div>
    <div class="col-sm-4">
      <img src="<c:url value="/img/${car.carImg}"/> " alt="${car.carName}" style="width:100%;">
    </div>
  </div>
</div>