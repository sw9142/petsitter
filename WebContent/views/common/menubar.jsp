<%@page import="com.kh.member.model.vo.Member"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <% Member loginUser = (Member) session.getAttribute("loginUser");
 String contextPath = request.getContextPath(); 
 System.out.println("contextPath: "+contextPath);
 String alertMsg = (String)session.getAttribute("alertMsg");
 String confiMsg = (String)session.getAttribute("confiMsg");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&family=Poor+Story&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
      integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
      crossorigin="anonymous"
    />
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
      * {
        box-sizing: border-box;
      }

      a,
      a:hover {
        text-decoration: none;
      }

      /*
        font-family: 'Jua', sans-serif;
        font-family: 'Cute Font', cursive;

        */
      body {
        margin: 0;
        font-family: "Poor Story", cursive;
        font-size: 16px;

        width: 100%;
      }

      .outer {
        height: 100vw;
      }
      ul {
        margin: 0;
        padding: 0;
      }
      li {
        list-style: none;
      }
      /*-------------- menu bar -----------*/

      .bars {
        position: fixed;
        width: 100%;
        top: 0;
        left: 0;
        right: 0;
        background-color: white;
        z-index: 100;
        position: relative;
      }

      .topbar {
        background-color: aliceblue;
        color: #3f3b75;
        padding: 0.2rem;
        font-size: 0.8rem;
        font-weight: bold;
      }

      .navbar_ {
        margin: auto;
        width: 80%;
        display: flex;
        padding: 0.5rem;
      }
      .nav_logo a {
        display: flex;
        width: auto;
        font-family: "Jua", sans-serif;
      }
      .logo {
        background: url("./resources/images/logo.png");
        background-size: cover;
        width: 80px;
        height: 81px;
      }
      .logo_name {
        font-size: 1.8rem;
        padding: 1rem 0 0 0.3rem;
        width: 200px;
        align-self: center;
        color: #423bad;
        font-weight: bold;
      }

      .nav_ {
        width: 100%;
        padding-right: 1rem;
      }
      .nav_ ul {
        display: flex;
        justify-content: end;
        height: 100%;
        align-items: center;
      }
      .nav_ li {
        font-weight: bold;
        padding: 0.8rem;
        margin: 0.5rem;
        width: 90px;
        text-align: center;
        color: rgb(85, 26, 139);
        cursor: pointer;
      }

      .nav_ li:hover {
        transform: scale(1.2);
        color: yellowgreen;
      }

      .afterlogin_bar {
        display: flex;
      }
      #adminDashBoard {
        width: 120px;
      }

      #afterlogin_welcome {
        position: absolute;
        text-align: end;
        font-size: 14px;
        top: 4.5rem;
        right: 6rem;
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <section class="section_header">
      <div class="bars">
        <div class="topbar">
          <marquee> w   e   l   c   o   m   e   t   o   m   y   p   e   t   s   i   t   t   e   r</marquee>
        </div>
        <div class="navbar_">
          <div class="nav_logo">
            <a href="/petsitter/">
              <div class="logo"></div>
              <div class="logo_name">MyPetSitter</div>
            </a>
          </div>
          <div class="nav_">
            <ul>
              <%if(loginUser != null && loginUser.getMemId().equals("admin") ){
              %>

              <p style="margin: 0">
                <%= loginUser.getMemName() %> WELCOME!
              </p>
              <li
                id="adminDashBoard"
                onclick="location.href='/petsitter/adminDashBoard.bo'"
              >
                Admin DashBoard
              </li>
              <li onclick="location.href='<%= contextPath %>/logout.me'">
                Logout
              </li>

              <% }else if( loginUser!= null &&
              !loginUser.getMemName().equals("admin")){%>
              <div class="afterlogin">
                <div class="afterlogin_bar">
                  <li onclick="location.href='<%= contextPath %>/myPage.me'">
                    MyPage
                  </li>
                  <li onclick="location.href='<%= contextPath %>/support.ad'">
                    Support
                  </li>
                  <li
                    onclick="location.href='<%= contextPath %>/list.no?currentPage=1'"
                  >
                    Notice
                  </li>
                  <li onclick="location.href='<%= contextPath %>/logout.me'">
                    Logout
                  </li>
                </div>
                <div id="afterlogin_welcome"><%= loginUser.getMemName() %></div>
              </div>

              <%} else{%>
              <li onclick="location.href='<%= contextPath %>/loginForm.me'">
                LogIn
              </li>
              <li onclick="location.href='<%= contextPath %>/registerForm.me'">
                Registration
              </li>
              <li
                onclick="location.href='<%= contextPath %>/list.no?currentPage=1'"
              >
                Notice
              </li>
              <li onclick="location.href='<%= contextPath %>/support.ad'">
                Support
              </li>
              <%} %>
            </ul>
          </div>
        </div>
      </div>
      <div class="gap"></div>
    </section>
    <script>

      let msg =  "<%= alertMsg%>";
      if(msg != "null"){
       window.alert(msg);
       <% session.removeAttribute("alertMsg"); %>
      }

      let confiMsg = "<%= confiMsg%>";
    </script>
  </body>
</html>
