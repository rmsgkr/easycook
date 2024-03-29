<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body class="goto-here">
  <section class="ftco-section ftco-cart">
<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
      <div class="container"> 
      <h2>찜목록 [ ${myWishlist.size()}개 ]</h2>
        <hr>
        <br>
        <c:choose>
				<c:when test="${myWishlist.size()==0}">
         		<h2 align="center">위시리스트가 비어있습니다.</h2>
         		</c:when>
         <c:otherwise>
         <div class="row">
            <div class="col-md-12 ftco-animate">
               <div class="cart-list">
                  <table class="table">
                     <thead class="thead-primary">
                        <tr class="text-center">
                           <th></th>
                           <th></th>
                           <th>상품</th>
                           <th style="text-align: center;">중량</th>
                           <th style="text-align: center;">가격</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="list" items="${myWishlist }">
                        <tr class="text-center">                     
                           <td class="product-remove">
 								<button onclick="document.getElementById('id01').style.display='block'"
									class="ion-ios-close"></button> 
													
									<div id="id01" class="w3-modal w3-animate-opacity">
										<div class="w3-modal-content w3-card-4">
											<header class="w3-container w3-teal">
												<span
													onclick="document.getElementById('id01').style.display='none'"
													class="w3-button w3-large w3-display-topright">&times;</span>
													<h3>${list.product.productName}를 위시리스트에서 삭제하시겠습니까?</h3>
											</header>
											<div class="w3-container">																							
												<p><h3><a href="/easycook/mypage/wishlist/delete?productNo=${list.product.productNo}">
												<span>Yes</span></a></h3></p>
											</div>
										</div>				
									</div>					
                              
                                 
                           </td>

                           <td><img src="<%=request.getContextPath() %>/resources/product/${list.product.productImage }"></td>
                           <td class="product-name">
                              <h3>${list.product.productName }</h3>
                              <p>${list.product.productDetail }</p>
                           </td>
						   <td class="total">${list.product.productAmount }</td>
                           <td class="price">${list.product.productPrice }</td>             
                        </tr>
                        </c:forEach>
                        <!-- END TR-->
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         </c:otherwise>
      </c:choose>
      </div>
      
      
      
      <div class="mouse">
               <a href="#" class="mouse-icon">
                  <div class="mouse-wheel">
                     <span class="ion-ios-arrow-up"></span>
                  </div>
               </a>
      </div>
   </section>
<!--    <script>
/*       $(document).ready(function(){

      var quantitiy=0;
         $('.quantity-right-plus').click(function(e){
              
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
                  
                  $('#quantity').val(quantity + 1);

                
                  // Increment
              
          });

           $('.quantity-left-minus').click(function(e){
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
            
                  // Increment
                  if(quantity>0){
                  $('#quantity').val(quantity - 1);
                  }
          });
          
      }); */
   </script> -->

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<jsp:include page="common/header.jsp" />
<body class="goto-here">
   <!-- <div class="py-1 bg-primary">
      <div class="container">
         <div
            class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
               <div class="row d-flex">
                  <div class="col-md pr-4 d-flex topper align-items-center">
                     <div
                        class="icon mr-2 d-flex justify-content-center align-items-center">
                        <span class="icon-phone2"></span>
                     </div>
                     <span class="text">+ 1235 2355 98</span>
                  </div>
                  <div class="col-md pr-4 d-flex topper align-items-center">
                     <div
                        class="icon mr-2 d-flex justify-content-center align-items-center">
                        <span class="icon-paper-plane"></span>
                     </div>
                     <span class="text">youremail@email.com</span>
                  </div>
                  <div
                     class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                     <span class="text">3-5 Business days delivery &amp; Free
                        Returns</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <nav
      class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
      id="ftco-navbar">
      <div class="container">
         <a class="navbar-brand" href="index.jsp">Vegefoods</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#ftco-nav" aria-controls="ftco-nav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
         </button>

         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
               <li class="nav-item active dropdown"><a
                  class="nav-link dropdown-toggle" href="#" id="dropdown04"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
                  <div class="dropdown-menu" aria-labelledby="dropdown04">
                     <a class="dropdown-item" href="shop.html">Shop</a> <a
                        class="dropdown-item" href="mypage/wishlist">Wishlist</a> <a
                        class="dropdown-item" href="product-single.html">Single
                        Product</a> <a class="dropdown-item" href="mypage/cart">Cart</a> <a
                        class="dropdown-item" href="checkout.html">Checkout</a>
                  </div></li>
               <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
               <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
               <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
               <li class="nav-item cta cta-colored"><a href="cart.html"
                  class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>

            </ul>
         </div>
      </div>
   </nav>
   END nav

   <div class="hero-wrap hero-bread"
      style="background-image: url('../resources/images/bg_1.jpg');">
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="index.html">Home</a></span> <span>Wishlist</span>
               </p>
               <h1 class="mb-0 bread">My Wishlist</h1>
            </div>
         </div>
      </div>
   </div> -->
 <section class="ftco-section ftco-cart">
<jsp:include page="common/sidebar.jsp" />
      <div class="container">
         <div class="row">
            <div class="col-md-12 ftco-animate">
               <div class="cart-list">
                  <table class="table">
                     <thead class="thead-primary">
                        <tr class="text-center">
                           <th>&nbsp;</th>
                           <th>상품목록</th>
                           <th>&nbsp;</th>
                           <th>가격</th>
                           <th>수량</th>
                           <th>총액</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr class="text-center">
                           <td class="product-remove"><a href="#"><span
                                 class="ion-ios-close"></span></a></td>

                           <td class="image-prod"><div class="img"
                                 style="background-image: url(../resources/images/product-1.jpg);"></div></td>

                           <td class="product-name">
                              <h3>Bell Pepper</h3>
                              <p>Far far away, behind the word mountains, far from the
                                 countries</p>
                           </td>

                           <td class="price">$4.90</td>

                           <td class="quantity">
                              <div class="input-group mb-3">
                                 <input type="text" name="quantity"
                                    class="quantity form-control input-number" value="1" min="1"
                                    max="100">
                              </div>
                           </td>

                           <td class="total">$4.90</td>
                        </tr>
                        <!-- END TR-->

                        <tr class="text-center">
                           <td class="product-remove"><a href="#"><span
                                 class="ion-ios-close"></span></a></td>

                           <td class="image-prod"><div class="img"
                                 style="background-image: url(../resources/images/product-2.jpg);"></div></td>

                           <td class="product-name">
                              <h3>Bell Pepper</h3>
                              <p>Far far away, behind the word mountains, far from the
                                 countries</p>
                           </td>

                           <td class="price">$15.70</td>

                           <td class="quantity">
                              <div class="input-group mb-3">
                                 <input type="text" name="quantity"
                                    class="quantity form-control input-number" value="1" min="1"
                                    max="100">
                              </div>
                           </td>

                           <td class="total">$15.70</td>
                        </tr>
                        <!-- END TR-->

                        <tr class="text-center">
                           <td class="product-remove"><a href="#"><span
                                 class="ion-ios-close"></span></a></td>

                           <td class="image-prod"><div class="img"
                                 style="background-image: url(../resources/images/product-3.jpg);"></div></td>

                           <td class="product-name">
                              <h3>Bell Pepper</h3>
                              <p>Far far away, behind the word mountains, far from the
                                 countries</p>
                           </td>

                           <td class="price">$15.70</td>

                           <td class="quantity">
                              <div class="input-group mb-3">
                                 <input type="text" name="quantity"
                                    class="quantity form-control input-number" value="1" min="1"
                                    max="100">
                              </div>
                           </td>

                           <td class="total">$15.70</td>
                        </tr>
                        <!-- END TR-->
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
      <div class="mouse">
               <a href="#" class="mouse-icon">
                  <div class="mouse-wheel">
                     <span class="ion-ios-arrow-up"></span>
                  </div>
               </a>
      </div>
   </section>
   
   <!-- <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
         <div class="row d-flex justify-content-center py-5">
            <div class="col-md-6">
               <h2 style="font-size: 22px;" class="mb-0">Subcribe to our
                  Newsletter</h2>
               <span>Get e-mail updates about our latest shops and special
                  offers</span>
            </div>
            <div class="col-md-6 d-flex align-items-center">
               <form action="#" class="subscribe-form">
                  <div class="form-group d-flex">
                     <input type="text" class="form-control"
                        placeholder="Enter email address"> <input type="submit"
                        value="Subscribe" class="submit px-3">
                  </div>
               </form>
            </div>
         </div>
      </div>
   </section>
   <footer class="ftco-footer ftco-section">
      <div class="container">
         <div class="row">
            <div class="mouse">
               <a href="#" class="mouse-icon">
                  <div class="mouse-wheel">
                     <span class="ion-ios-arrow-up"></span>
                  </div>
               </a>
            </div>
         </div>
         <div class="row mb-5">
            <div class="col-md">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Vegefoods</h2>
                  <p>Far far away, behind the word mountains, far from the
                     countries Vokalia and Consonantia.</p>
                  <ul
                     class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-twitter"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-facebook"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span
                           class="icon-instagram"></span></a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md">
               <div class="ftco-footer-widget mb-4 ml-md-5">
                  <h2 class="ftco-heading-2">Menu</h2>
                  <ul class="list-unstyled">
                     <li><a href="#" class="py-2 d-block">Shop</a></li>
                     <li><a href="#" class="py-2 d-block">About</a></li>
                     <li><a href="#" class="py-2 d-block">Journal</a></li>
                     <li><a href="#" class="py-2 d-block">Contact Us</a></li>
                  </ul>
               </div>
            </div>
            <div class="col-md-4">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Help</h2>
                  <div class="d-flex">
                     <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
                        <li><a href="#" class="py-2 d-block">Shipping
                              Information</a></li>
                        <li><a href="#" class="py-2 d-block">Returns &amp;
                              Exchange</a></li>
                        <li><a href="#" class="py-2 d-block">Terms &amp;
                              Conditions</a></li>
                        <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
                     </ul>
                     <ul class="list-unstyled">
                        <li><a href="#" class="py-2 d-block">FAQs</a></li>
                        <li><a href="#" class="py-2 d-block">Contact</a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="col-md">
               <div class="ftco-footer-widget mb-4">
                  <h2 class="ftco-heading-2">Have a Questions?</h2>
                  <div class="block-23 mb-3">
                     <ul>
                        <li><span class="icon icon-map-marker"></span><span
                           class="text">203 Fake St. Mountain View, San Francisco,
                              California, USA</span></li>
                        <li><a href="#"><span class="icon icon-phone"></span><span
                              class="text">+2 392 3929 210</span></a></li>
                        <li><a href="#"><span class="icon icon-envelope"></span><span
                              class="text">info@yourdomain.com</span></a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12 text-center">

               <p>
                  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
                  Copyright &copy;
                  <script>document.write(new Date().getFullYear());</script>
                  All rights reserved | This template is made with <i
                     class="icon-heart color-danger" aria-hidden="true"></i> by <a
                     href="https://colorlib.com" target="_blank">Colorlib</a>
                  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
               </p>
            </div>
         </div>
      </div>
   </footer>

 

   loader
   <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
            stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
   </div>
 -->
   <script>
      $(document).ready(function(){

      var quantitiy=0;
         $('.quantity-right-plus').click(function(e){
              
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
                  
                  $('#quantity').val(quantity + 1);

                
                  // Increment
              
          });

           $('.quantity-left-minus').click(function(e){
              // Stop acting like a button
              e.preventDefault();
              // Get the field name
              var quantity = parseInt($('#quantity').val());
              
              // If is not undefined
            
                  // Increment
                  if(quantity>0){
                  $('#quantity').val(quantity - 1);
                  }
          });
          
      });
   </script>
<jsp:include page="common/footer.jsp" />
 --%>