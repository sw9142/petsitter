<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>펫시터 등록하기</title>
    <style>
      .psenroll_container {
        margin: 2rem;
        margin-top: 3rem;
      }
      .ps_agreement_container {
        width: 600px;
        margin: 3rem auto;
      }

      .ps_agreement_content {
        border: 1px solid lightgray;
        padding: 2rem;
      }
      .ps_agreement {
        width: 100%;
        text-align: end;
        padding: 2rem;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="psenroll_container">
      <h3 align="center" class="psenroll-title">
  Will you join us MyPetSitter? :)  
      </h3>

      <div align="center" class="ps_agreement_container">
        <div class="ps_agreement_content">
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni architecto magnam, porro dicta doloribus, odit nostrum repellat quos adipisci iusto, quis recusandae consequatur praesentium ipsa distinctio totam excepturi. Velit, laborum?
Aspernatur ullam vel facilis soluta cumque quam! Corporis, soluta. Cumque natus sint perferendis, praesentium atque eaque beatae. Nesciunt eum ut sint molestias optio! Itaque aliquid adipisci enim officiis dicta. Rem.
Nemo excepturi officia sapiente v
        </div>

        <div class="ps_agreement">
          <input type="radio" id="yesAgree" required />
          <label for="yesAgree"> I agree</label>
        </div>
      </div>

      <div align="center">
        <button
          type="button"
          onclick="location.href='<%= contextPath%>/register.pe'"
          class="btn btn-primary"
          type="submit"
        >
          APPLY
        </button>
      </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
