<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

    <title>CSS</title>
    <style>
      #jb-container {
        width: 95%;
        margin: 0px auto;
        padding: 50px 10px 10px 10px;
        /* border: 1px solid #bcbcbc; */
      }
      #jb-content {
        width: 85%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
      }
      #jb-bottom {
        clear: both;
        padding: 20px;
      }
      #content-detail {
         width: 700px;
         padding: 30px 20px 30px;
        float: left;
        background-color: #F8F8F8;
      }
      #content-detail2 {
         text-align: left;
      }
      
      .btn-search {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       margin-left: 30px;
       width: 103px;
       height: 36px;
       line-height: 36px;
       background-color: #606060;
       font-size: 14px;
       color: white;
       vertical-align: top;
       text-align: center;
      }
      .btn-cancle {   /* 나중에 추가할 버튼양식 */
       display: inline-block;
       position : absolute;
       margin-left: 5rem;
       width: 70px;
       height: 30px;
       line-height: 30px;
       background-color: rgba(0,0,0,0.1);
       font-size: 13px;
       font-weight : border;
       color: white;
       vertical-align: top;
       margin-top : -27px;
       text-align: center;
      }
      
      #ordertable {
        border-collapse: collapse;
        width: 100%;
      }
      #ordertable th {
      border-bottom: 1px solid #ddd;
      background: #f6f6f6;
      padding: 15px 20px; 
         font-weight: bold;
       font-size: 20px;
       vertical-align: middle;
       border-bottom: 1px solid #e0e0e0;
       background: #f6f6f6;
      }
      #ordertable td {
           padding: 15px 20px; 
        vertical-align: middle;     
        font-size: 15px;     
           border-bottom: 1px solid #ddd;
      }
    
    
    </style>
  </head>
  <body>
  
    <div id="jb-container">
    <jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
   <div id="jb-content">
   <h3>주문내역</h3>
        <hr>
        <br>
        <div id="content-detail">
        
      <form id="searchgogo" name="searchgogo">
      <label for="UserCheckIN">조회기간 </label>&nbsp;&nbsp;&nbsp;
      <input type="date" name="fromDate" id="fromDate">&nbsp;&nbsp;~&nbsp;&nbsp;
      <label for="UserCheckOut"></label> 
      <input type="date" name="toDate" id="toDate">&nbsp;&nbsp;
      <input type="button"  id="btnSearch22" class="btn-search" value="조회하기"></button>
      </form>
        
      </div>         
      <br><br><br><br>
         <br><hr><br>
        <div id="content-detail2">
         <h5 >주문목록/배송조회 내역 총 -건</h5>
        <br><br>
        <table id="ordertable">
         <thead>
	       <tr>
	          <th>주문일</th>
	          <th>주문번호</th>
	          <th>총주문금액</th>
	          <th colspan="2">주문정보</th>
	        </tr>
      	 </thead>
         <tbody id = "testajax">
       <c:forEach var="orders" items="${orderList }">
        <c:if test="${orders.ordersNo != null}">        
	        <tr>
	          <td>${orders.ordersDate }</td>
	          <td>${orders.ordersNo }</td>
	          <td>${orders.ordersTotal }</td>
	          <td>
	          ${orders.ordersStatus }
	 		 <button onclick="window.open('ordersProduct/${orders.ordersNo}','상세보기','width=600,height=900,top=100,left=500' );">상세보기</button>
	          </td>
	          <td>
	         <form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >
	         <c:if test="${orders.ordersStatus eq '주문완료'}">
	         <input type="hidden" name="ordersNo" id="ordersNo" value="${orders.ordersNo}">
	         <input type="submit" class="btn-cancle" value='주문취소'>         
	         </c:if>
	         <c:if test="${orders.ordersStatus eq '배송완료'}">
	          <input type="button" class="btn-cancle" onclick="cancelPls(${orders.ordersNo})" value="반품신청"/>
	         </c:if>
	          </form>    
	         </td>
	        </tr>
        </c:if>
        <c:if test="${orders.ordersNo == null }">
	        <tr>
	        <td colspan="6">주문 내역이 없습니다.</td>
	        </tr>
        </c:if>
        </c:forEach>
        <!-- 날짜조회기능 썼을경우, 날짜조회데이터 출력시작 -->
 <%--        <c:forEach var="orders" items="${orderListDate }">
        <c:if test="${orders.ordersNo != null}">      
	        <tr>
	          <td>${orders.ordersDate }</td>
	          <td>${orders.ordersNo }</td>
	          <td>${orders.ordersTotal }</td>
	          <td>
	          ${orders.ordersStatus }
	          <button onclick="window.open('ordersProduct/${orders.ordersNo}','상세보기','width=600,height=900,top=100,left=500' );">상세보기</button>
	          </td>
	          <td>
	         <form method="post" action="<%=request.getContextPath() %>/mypage/cancelRequire" >
	         <c:if test="${orders.ordersStatus eq '주문완료'}">
	         <input type="hidden" name="ordersNo" id="ordersNo" value="${orders.ordersNo}">
	         <input type="submit" class="btn-cancle" value='주문취소'>         
	         </c:if>
	         <c:if test="${orders.ordersStatus eq '배송완료'}">
	          <input type="button" class="btn-cancle" onclick="cancelPls(${orders.ordersNo})" value="반품신청"/>
	         </c:if>
	          </form>  
	         </td>
	        </tr>
        </c:if>
        <c:if test="${orders.ordersNo == null }">
	        <tr>
	        <td colspan="6">주문 내역이 없습니다.</td>
	        </tr>
        </c:if>
        </c:forEach>
        </tbody> --%>
      </table>
        </div>        
      </div> 
     
      <div id="jb-bottom">
        <br/>
      </div>
</div>



<script src="/easycook/resources/admin/vendor/jquery/jquery.min.js"></script>
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript">

$('#btnSearch22').on('click', function(){
	/* alert($("#searchgogo").serialize()) */
	$( '#ordertable > tbody').empty();
	$.ajax({
		url : "ordersTest.action",
		type: "POST",
		data: $("#searchgogo").serialize(),
		success: function (data) {
			/* alert(data) */
			$('#ordertable').append(data);
		},
		error: function () {
			alert("안된다...");
		}
		
	});
	
	
});

//$('#btnSearch22').on('click', function(){
/*	alert($("#searchgogo").serialize())
	$.ajax({
		url : "ordersTest.action",
		type: "POST",
		data: $("#searchgogo").serialize(),
		success: function (data) {
			alert(data)
			var results = data.testajax;
            var str = '<TR>';
			$.each(results, function (i) {
				str += '<TD>' + results[i].oDate + '</TD><TD>'
				+ results[i].oNo + '</TD><TD>'
				+ results[i].oStatus + '</TD><TD>'
				+ results[i].oTotal + '</TD><TD>';
			});
			$("#testajax").append(str); 
		},
		error: function () {
			alert("안된다...");
		}
		
	});
	
	
}); */

</script>


</body>


  
<jsp:include page="/WEB-INF/views/common/footer.jsp" />