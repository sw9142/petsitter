<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .FAQ_container p {
        display: none;
      }
      .FAQ_container {
        text-align: center;
        margin: 3rem 0 6rem 0;
      }
      .FAQ_container h3 {
        padding: 1rem;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="support_container">
      <h2 align="center" style="font-weight: bold; margin: 3rem auto">Frequently Asked Questions</h2>
      <div class="FAQ_container">
        <h3>Q. How to contact MyPetSitter?</h3>
        <p>
          MyPetSitter telephone : 1544-0000 <br />
          <br />
        </p>
        <h3>Q. Working hours</h3>
        <p>
          9: 30 am ~  6 pm(lunch break :  11:30 am)
          
        </p>
        <h3>Q. Can I make a complain?</h3>
        <p>Yes! Please let us know if you have any issue or complains. <br>Go to MyPage -> Matching list -> Select the matching case -> make a complain and send it to us <br /></p>
   
    	<h3>Q. Can I make a complain?</h3>
        <p>Yes! Please let us know if you have any issue or complains. <br>Go to MyPage -> Matching list -> Select the matching case -> make a complain and send it to us <br /></p>
        <section class="direction">
            <h3 align = "center">Q.Lorem ipsum dolor sit</h3>
            <p><img src="././resources/images/map.png" width="700px" /><br></p>
        </section>
      </div>
    </div>

    <script>
      $(function () {
        $(".FAQ_container h3").click(function () {
          if ($(this).next().css("display") == "none") {
            $(this).next().slideDown();
          } else {
            $(this).next().slideUp();
          }
        });
      });
    </script>
    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
