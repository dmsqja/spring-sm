<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let center = {
    init:function(){
      $.ajax({
        url:'<c:url value="/wh"/>',
        success:(result)=>{
          // alert(result);
          let wtext = result.response.body.items.item[0].wfSv;
          $('#wh').text(wtext);
        }
      });
    }
  };
  $(function(){
    center.init();
  });
</script>

<div class="col-sm-10">

  <h2>TITLE HEADING</h2>
  <h5>Title description, Sep 2, 2017</h5>
  <p id="wh"></p>
  <p>Some text..</p>
  <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
</div>