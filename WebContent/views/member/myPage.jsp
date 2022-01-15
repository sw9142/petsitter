	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>

	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>My Page</title>
	
	<style>
	
	    .mypage_container {
	        background : #d3d3d336;
	       
	     width: 80%;
	      
	        margin : auto;
	        margin-top : 50px;
			margin-bottom: 5rem;
	    }
	
	  .mypage-togo{
		  display: flex;
		  justify-content: flex-end;
		  padding: 1rem;
	  }
	  .mypage-togo button{
		padding: 0.7rem;
		border: none;
		margin: 0.5rem;
		background-color: #423bad;
		align-self: center;
		border-radius: 5px;
		color: white;
		font-weight: bold;
	  }
	  .mypage-togo button:hover{
		background-color: #38338a;
	  }
	  #mypage-form table{
		  width: 40%;
		  margin: auto;
		  border: none;
	  }
	  #mypage-form table th{
		  text-align: center;
	  }
	  #mypage-form table input{
		  width: 100%;
	  }
	</style>
	</head>
	<body>
		
		
	   <header>
		<%@ include file="../common/menubar.jsp" %> 
		
		<%
			String memNum = loginUser.getMemNum();
			String memId = loginUser.getMemId();
			String memName = loginUser.getMemName();
			String idNum = loginUser.getIdNum();
			String email = loginUser.getEmail();
			String phone = loginUser.getPhone();
			String location = loginUser.getLocation();
			String address = loginUser.getAddress();
			
			
		%>
	  </header>
	
	
	
	    <div class="mypage_container" >
	
			<div class="mypage-togo">	       
				<form action="<%= contextPath %>/matchList.ma?currentPage=1" method="post">
					<input type="hidden" name="loginUser" value="<%= memNum %>">
					<div align="right">
						<button  type="submit">My Matching list</button>
					</div>
				</form>
				
				<form action="<%= contextPath %>/myPet.me" method="post">
					<input type="hidden" name="memNum" value="<%= memNum %>">
						<div align="right">     
							<button  type="submit"  >MyPet Page</button>
						</div>
				</form>
				
			</div>
			<hr style="margin: 0;">

	        <h2 align="center" style="margin: 3rem; font-weight: bold;">My Account</h2>
	       
	        

	
	        <form id="mypage-form" action="<%= contextPath %>/update.me" method="post">
	
	            <!-- 아이디, 이름, 주민등록번호, 이메일, 핸드폰, 주소, -->
	            <table align ="center" class="table table-borderless">
	                <tr> 
	                    <th>ID</th>
	                    <td><input type="text" name="memId" maxlength="12" value="<%= memId %>" readonly></td>
	                    
	               
	                </tr>
	                <tr>
	                    <th>Name</th>
	                    <td><input type="text" name="memName" maxlength="6" value="<%= memName %>" required></td>
	                    
	                </tr>
				
					<tr>
	                    <th>Email</th>
	                    <td><input type="email" name="email" value="<%= email %>"></td>
	                   
	                </tr>
	                <tr>
	                    <th>Phone</th>
	                    <td><input type="text" name="phone" value="<%= phone %>"></td>
	                   
	                </tr>
	                <tr>
	                    <th>Address</th>
	                    <td>
							<div class="location"> 
						   		<select name="location" id="location">
									<option value="Seoul">Seoul</option>
				                    <option value="KyungKi">KyungKi</option>
				                    <option value="Incheon">Incheon</option>
				                    <option value="KangWon">KangWon</option>
				                    <option value="ChungBook">ChungBook</option>
				                    <option value="ChungNam">ChungNam</option>
				                    <option value="JunBook">JunBook</option>
				                    <option value="JunNam">JunNam</option>
				                    <option value="kwangJu">kwangJu</option>
				                    <option value="WoolSan">WoolSan</option>
				                    <option value="KyungBuk">KyungBuk</option>
				                    <option value="KyungNam">KyungNam</option>
				                    <option value="DaeGu">DaeGu</option>
				                    <option value="Busan">Busan</option>
				                    <option value="SeJong">SeJong</option>
				                    <option value="DaeJun">DaeJun</option>
				                    <option value="Jeju">Jeju</option>
								 </select> 시
					 		</div>
							<input type = "text"
							 name="address"
							 id="address"
							 value="<%= address %>"
							 style="height: 80px;">
							</input>
						</td>
	                </tr>
					<script>
					
					 $(function(){
						
						

							 var loc = "<%= location%>";	

							 console.log("loc: ", loc)
							$("#location option").each(function(){
								if($(this).val() === loc){
									$(this).attr("selected", true);
								}
							})

						
					 });
					
					</script>
	
	            </table>
	
	
	            <div align="center" style="padding: 2rem;">
	                <button type="submit" style="width: 80px; font-weight: bold;" class="btn btn-danger btn-sm">UPDATE</button>
	                <button type="button" style="width: 150px; font-weight: bold" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updatePwdForm">UPDATE PASSWORD</button>
	            </div>
	
	           
	
	           
	
	        </form>
	        
	    </div>
	
	    <!-- The Modal : 비밀번호변경 -->
	    <div class="modal" id="updatePwdForm">
	        <div class="modal-dialog">
	            <div class="modal-content">
	        
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">Change Password</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	            
	                <!-- Modal body -->
	                <div class="modal-body" align="center">
	                    
	                    <form action="<%= contextPath %>/updatePwd.me" method="post">
	                        <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 확인 (재입력) -->
	
	                        <!-- 확실하게 주인을 판별할 수 있는 id 도 같이 넘겨야 한다. -->
	                        <input type="hidden" name="memId" value="<%= memId %>">
	
	                        <table>
	                            <tr>
	                                <td>Current Password</td>
	                                <td><input type="password" name="memPwd" required></td>
	                            </tr>
	                            <tr>
	                                <td>New Password</td>
	                                <td><input type="password" name="updatePwd" required></td>
	                            </tr>
	                            <tr>
	                                <td>Confirm Password</td>
	                                <td><input type="password" name="checkPwd" required></td>
	                            </tr>
	                        </table>
	
	                        <br>
	
	                        <button type="submit" style="width: 80px" class="btn btn-secondary btn-sm" onclick="return validatePwd();">변경</button>
	                    </form>
	
	                    <script>
	                        function validatePwd() {
	
	                            if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
	                                alert("passwords do not match.");
	
	                                return false;
	                            }
	                            else {
	                                return true;
	                            }
	
	                        }
	                    </script>
	
	                </div>
	        
	            </div>
	        </div>
	        </div>
	
	
		<footer>
		<%@ include file="../common/footer.jsp" %>
		</footer>
	  </body>
	  </html>