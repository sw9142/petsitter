

<%@page import="com.kh.member.model.vo.Review"%>
<%@page import="com.kh.member.model.vo.Mypet"%>
<%@page import="java.util.Date"%>

<%@page import="com.kh.common.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

Board b = (Board)request.getAttribute("b");
ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
String today = (String)request.getAttribute("ftToday");
ArrayList<Mypet> petList = (ArrayList<Mypet>)request.getAttribute("petList");
ArrayList<Mypet> ownerPetList = (ArrayList<Mypet>)request.getAttribute("ownerPetList");


%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .petsitter_detail_container {
        width: 80%;

        margin: 3rem auto;
      }
      .petsitter_firstbox {
        display: flex;
      }
      .petsitter_photos_main {
        flex: 2;
      }
      .petsitter_photos_main img {
        width: 100%;
        height: 100%;
      }

      .petsitter_photos_subs {
        flex: 1;
        padding-left: 1rem;
      }
      .petsitter_photos_subs img {
        width: 100%;
      }

      .petsitter_secondbox {
        margin-top: 1rem;
        padding: 1rem;
        display: flex;
      }
      
      .bookingCal{
        display: flex;
        justify-content: center;
      }

      #calcPrice{
        border: none;
        background-color: white ;
        font-weight: bold;
        padding: 0.5rem;
      }
      .calTotalPrice h4{
        padding: 0.5rem;
        margin: 0;
        font-size: 1rem;
        align-self: center;
      }
      #calcPriceBtn:hover{
     color: greenyellow;
      }

   
      .bookingCal input{
        width:129px;
      }

      .calTotalPrice{
        display: flex;
        justify-content: space-around;

      }
      .petsitter_info{
       
        font-weight: bold;
      }

      .petsitter_info span{
        color: #423bad;
        font-size: 1rem;
      }
      .petsitter_secondbox .petsitter_greeting {
        flex: 2;
        margin: auto;
      }
      .petsitter_secondbox .petsitter_side {
        flex: 1;
        text-align: center;
      }

      .greeting_title {
        font-size: 1.5rem;
        font-weight: bold;
        text-align: center;
        margin: 0.4rem;
      }
      .greeting_content {
        padding: 0.2rem 1rem;
      }
      .app_totalprice {
        margin: 0.5rem;
      }
      .applypetsitter_btn {
        margin: 0.7rem;
      }
      .applypetsitter_btn button {
        font-size: 1.2em;
        font-weight: bold;
      }

      .petsitter_abouthome h4 {
        margin: 2rem;
        padding-left: 2rem;
        font-weight: bold;
      }
      .petsitter_abouthome table {
        margin: auto;
        width: 80%;
        text-align: center;
      }
      .petsitter_abouthome th {
        width: 145px;
      }
      .petsitter_abouthome td {
        width: 145px;
      }

      .petsitter_aboutpet{
        background: #f5f2ec;
        padding: 1rem;
        margin-top: 3rem;
      }
      .aboutpet {
        display: flex;
        margin: auto;
        width: 80%;
        padding: 1rem;
     
      }
      .petsitter_aboutpet h4 {
        margin: 2rem;
        padding-left: 2rem;
        font-weight: bold;
      }

      .aboutpet_photo {
        flex: 1;
      }
      .aboutpet_desc {
        text-align: center;
        flex: 3;
      }
      .aboutpet_desc table {
        width: 90%;
        height: 70%;
        padding: 2rem;
        margin-top: 2rem;
      }
      .aboutpet_desc table th {
        padding-left: 3rem;
      }

      .petsitter_fourthbox {
        margin: 3rem 0;
      }
      .petsitter_condition {
        width: 80%;
        margin: auto;
        display: flex;
      }
      .petsitter_condition h4 {
        font-weight: bold;
        flex: 2;
        text-align: center;
        width: 300px;
        align-self: center;
      }
      .petsitter_condition .condition_desc {
        flex: 3;
        text-align: center;
        padding: 2rem;
        background-color: aliceblue;
        margin-left: 3rem;
        border-radius: 10px;
      }
      .petsitter_fifthbox {
        width: 90%;
        margin: 1rem auto;
      }
      .petsitter_fifthbox h4 {
        padding: 1rem;
        font-weight: bold;
      }
      .review_list {
        padding: 0.5rem;
      }
      .review {
        display: flex;
        margin: 1rem;
      }
      .review .review_writerinfo {
        font-weight: bold;
        text-align: center;
        flex: 1;
        align-self: center;
      }
      .review_content {
        flex: 4;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="petsitter_detail_container">
    
    <%if(list.isEmpty()){ %>
     <div class="petsitter_firstbox petsitter_photos">
        <div class="petsitter_photos_main">
          <img width="300px" src="/pet/resources/images/main2.jpg" alt="" />
        </div>
        <div class="petsitter_photos_subs">
          <ul>
            <li>
              <img
                width="300px"
                style="padding-bottom: 1rem"
                src="/pet/resources/images/main2.jpg"
                alt=""
              />
            </li>
            <li>
              <img width="300px" src="/pet/resources/images/main2.jpg" alt="" />
            </li>
          </ul>
        </div>
      </div>
    
    <%}else{ %>
     <div class="petsitter_firstbox petsitter_photos">
        <div class="petsitter_photos_main">
          <img width="300px" src="<%= contextPath %><%= list.get(0).getFilePath()%><%= list.get(0).getChangeName() %>" alt="" />
        </div>
        <div class="petsitter_photos_subs">
          <ul>
          
          <%for(int i = 1; i <list.size(); i++){ %>
          
                 <li>
              <img
                width="300px"
                style="padding-bottom: 1rem"
                src="<%= contextPath %><%= list.get(i).getFilePath()%><%= list.get(i).getChangeName() %>"
                alt=""
              />
            </li>
          
          <%} %>
     
      
          </ul>
        </div>
      </div>
    
    <%} %>
    
     
      <br />
     
      <div class="petsitter_secondbox" style="position: relative;">
        <div class="petsitter_info" style="position: absolute; top: 3;">
         <span> Name:   &nbsp; </span> <%= b.getWriter()  %>  &nbsp;   <span> Location: </span>   &nbsp;    <%= b.getWriterLocation()  %>   &nbsp;  
         
         <% if(b.getPsExp().equals("Y")){%>
          <span> Experience: </span> &nbsp; Yes

          <%}else{%>
            <span> Experience: </span> &nbsp;  None
            <%}%>
      
         </div>
        <div class="petsitter_greeting">
          <div class="greeting_title">
            <%= b.getPsTitle() %>
          </div>
          <div class="greeting_content">
           
        
        	<%= b.getPsDesc() %>
        
          </div>
        </div>
        <div class="petsitter_side">

          <form action="<%= contextPath%>/insert.ma" method="post">
           <input type="hidden" name="bno" id="bno" value="<%= b.getBoardNum() %>" >
           
           <%if(loginUser != null){ %>
           
           
            <input type="hidden" name="memNum" value="<%= loginUser.getMemNum() %>" >
           
           <%} %>
   
            <div class="petsitter_appointment">

            <div class="bookingCal">
              <div class="bookstart">
                <input type="date" required name="bookStart" id="bookStart" min=<%= today %> />  ~ 
              
              </div>
              <div class="bookend">
                <input type="date" required name="bookEnd" id="bookEnd" min=<%= today %>  />
              </div>
            </div>
              <div class="app_totalprice">
                <h5 style="text-align: end; margin-right: 0.5rem"><span style="color: #423bad; font-weight: bold;">Price per day:</span> <span id="pricePerDay" style="font-weight: bold;"> <%= b.getPrice() %> Won</span></h5>
               
               <div class="calTotalPrice">
                <button type="button"  id="calcPrice" >Total Amount? (click!)</button>
                <h4> <span id="numOfDays"></span><span id="totalAmt"></span></h4>
              </div>
              </div>
            </div>
           
    
            <div class="applypetsitter_btn">
   
          
            
              <%if(loginUser == null){ %>
              
                <button class="btn btn-primary" disabled onclick="window.alert('Please Login first')">Apply for PetSitter Care!</button>
              <%} else if(loginUser != null && loginUser.getMemNum().equals("ME1") ){%>
             
                <button  type="button" id="deleteBtn" class="btn btn-danger btn-sm" style="padding: 0.3rem 1rem;">Delete</button>
              <%}else { %>
               
              <!---->
                  
                  	<% if(b.getWriter().equals(loginUser.getMemName())){ %>
                  
	              <hr />
                        <div class="memo" align="center">
               
                          <button
                          type="button"
                            class="btn btn-warning btn-sm"
                            onclick="location.href='<%=contextPath%>/updateDetailForm.bo?bno=<%= b.getBoardNum() %>'">
                         		   UPDATE
                          </button>
                          <button  type="button" id="deleteBtn" class="btn btn-danger btn-sm" style="padding: 0.3rem 1rem;">Delete</button>
                        </div>
                  <hr />	
                  	
                  	
                  	<%}else if(ownerPetList != null){ %>
	                 
	                    <button type="submit" class="btn btn-primary" onclick="return psInsertValidate()">Apply for PetSitter Care!</button>
	                  <%}else{ %>	
	                
	                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath %>/myPet.me'">Please Enroll your pet first</button>
	                  <%} %>          				
                  	
              <%} %>

            </div>
          </form>
     
        </div>

      </div>
      <br />
      <hr />
      <div class="petsitter_thirdbox">
        <div class="petsitter_abouthome">
          <h4>우리집은요...</h4>
          <div class="abouthome">
            <table class="table">
              <tr>
                <th class="table-secondary">Location</th>
                <td><%= b.getWriterLocation() %></td>

                <th class="table-secondary">Smoking</th>
                  <td><%= b.getPsSmoke() %></td>
              </tr>
              <tr>
                <th class="table-secondary">Kid(under 12)</th>
                 <td><%= b.getPsKid() %></td>

                <th class="table-secondary">The max number of dogs PetSitter can take care of</th>
                   <td><%= b.getPetCap() %> puppies</td>
              </tr>
            </table>
          </div>
        </div>
        <br />
        <div class="petsitter_aboutpet">
          <h4>Want to know about my puppy?</h4>
          
          
          <% if(petList != null){ %>
          	
          	<%for(Mypet p : petList) {%>
          	
			          	<div class="aboutpet">
			            <div class="aboutpet_photo">
			              <img
			                src="<%= contextPath %>/<%= p.getTitleImg() %>"
			                width="200px"
			                height="200px"
			                alt=""
			              />
			            </div>
			            <div class="aboutpet_desc">
			              <table>
			                <tr>
			                  <th>Name:</th>
			                  <td><%= p.getPetName() %></td>
			                </tr>
			                <tr>
			                  <th>BOD:</th>
			                   <td><%= p.getPetBirth() %></td>
			                </tr>
			                <tr>
			                  <th>Breed:</th>
			                  <td><%= p.getPetType() %></td>
			                </tr>
			                <tr>
			                  <th>Characteristic:</th>
			                   <td><%= p.getPetDec() %></td>
			                </tr>
			              </table>
			            </div>
			          </div>
          	
          	
          	<%} %>
          <%}else{ %>
          <div class="aboutpet">
           
            <div class="aboutpet_desc">
        
                  <p>PetSitter dose not have a dog yet!</p>
     
            </div>
          </div>
          <%} %>
          
        </div>
        <br /><br />
        <hr />
      </div>
      <br />
      <div class="petsitter_fourthbox">
        <div class="petsitter_condition">
          <h4>Dear PetOwner...</h4>
          <div class="condition_desc" >
				<%= b.getCondition() %>
          </div>
        </div>
      </div>
      <br />
      <hr />
      <div class="petsitter_fifthbox review_container">
        <h4>REVIEWS</h4>

        <div class="review_list">
        
     
        </div>
      </div>
            <script>
				
           function psInsertValidate(){

            console.log("$(#bookStart).val():", $("#bookStart").val().length);
            console.log("$(#bookEnd).val():", $("#bookEnd").val().length);
             if($("#bookStart").val().length > 0 && $("#bookEnd").val().length > 0 ){
                  console.log("날짜들어옴")
     
             }else{
              
                window.alert("Please enter the date for the petsitting service!")
                return false;

             }
           }
    	  
           


              $(function(){
              

        		

            	  //리뷰 AJAX 작선란
               $.ajax({

                url: "list.re",
                data: {
                  bno: $("#bno").val()
                },
                type:"get",
                success: function(res){
           

                  let review_list = $(".review_list");
                  let str = "";

                  if(res.length > 0){
                    for(let i=0; i<res.length; i++){
                    
                      str +=          "<div class='review'>"
                                      +  "<div class='review_writerinfo'>"
                                      +   "<div class='review_writerid'>"+res[i].writerName+ "</div>"
                                        +  "<div class='review_date'>"+ res[i].reviewDate +"</div>"
                                      + "</div>"
                                      + "<div class='review_content'>"
                                        +   res[i].reviewContent
                                      + "</div>"
                                    + "</div>";
                    }
              
                  }else{
                    str +=          "<div class='review'>"
                                     + "<div class='review_content' style='text-align: center;' >"
                                      +   res.reviewContent
                                     + "</div>"
                                   + "</div>";
                  }

                  review_list.append(str);
        

                },
                error: function(err){
                  console.log("err: ", err);
                }

               })
      


            	  // 서비스 날짜 계산란
                document.getElementById("calcPrice").addEventListener("click", function(){
                  
                  let start = $("#bookStart").val();
                  let  end = $("#bookEnd").val();
          

                       if(start.length > 0 && end.length > 0){
                   
                            if(start > end){
                            alert("Wrong date.")
                          }else{
                            let startDate = new Date(start);
                            let endDate = new Date(end)
                            let diffMs = endDate.getTime() - startDate.getTime() 
                            let diffDay = diffMs/(1000*60*60*24);
                         
                          
                            $("#numOfDays").text((diffDay+1)+"day(s) ");
                            let pricePerDay = $("#pricePerDay").text();
                           
                            let totalPrice =  (parseInt(pricePerDay) * diffDay);
                     
                            $("#totalAmt").text(totalPrice + "Won");
                          }
                       }else{
                      
                         $("#numOfDays").text("Please Enter the date! ");
                       }
                })


                
                // 삭제버튼 처리란
            deleteHandler = function(){
              console.log("deleteHandler!")
        	   
        	   if(window.confirm("Are you sure?")){
        		   location.href="<%=contextPath %>/delete.bo?bno=<%= b.getBoardNum() %>";
        	   }else{
        		   console.log("Cancel")
        	   }
        	   

           }
                document.getElementById("deleteBtn").addEventListener("click", deleteHandler);
         
           
           
        
              })

            </script>
    </div>

    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
