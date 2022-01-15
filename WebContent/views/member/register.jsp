<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .register_container {
        margin-bottom: 2rem;
      }
      .register_form_container {
        width: 800px;
        margin: auto;
        padding: 2rem;
      }
      .register_form_container table {
        padding: 1rem;
        margin: auto;
        width: 500px;
      }
      .register_form_container th {
        width: 120px;
      }
      .register_form_container td {
        width: 300px;
        text-align: center;
      }
      .location {
        text-align: left;
        padding-left: 4rem;
      }
      form {
        padding: 1rem;
      }
      tbody {
        position: relative;
      }
      #idCheckBtn {
        position: absolute;
        width: 85px;
        font-size: 11px;
        margin-left: 1rem;
      }
      .agreement {
        text-align: end;
        margin-right: 2rem;
      }
      .register_agreement {
        padding: 2rem;
      }
      .register_agreement fieldset {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="register_container">
      <h2 style="text-align: center; font-weight: bold; margin-top: 3rem">
       Sign Up
      </h2>
      <div class="register_form_container">
        <form
      
          action="<%= contextPath %>/insert.me"
          id="enroll-form"
          method="post"
        >
          <table class="table table-borderless">
            <tr>
              <th><span style="color: red">*</span> ID</th>
              <td>
                <input type="text" size="30" name="userId" required />
                <button
                  id="idCheckBtn"
                  onclick="idCheck();"
                  class="btn btn-outline-dark btn-sm"
                >
                  ID duplicate check
                </button>
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span> Password</th>
              <td>
                <input
                  type="password"
                  size="30"
                  name="userPwd"
                  required
                  disabled
                />
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span>Confirm Password</th>
              <td>
                <input type="password" size="30" name="checkPwd" required />
                <p
                  style="
                    margin: 0;
                    font-weight: bold;
                    font-size: 0.7rem;
                    padding: 0.3rem;
                  "
                  id="pwdResult"
                ></p>
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span>Name</th>
              <td><input type="text" name="userName" size="30" required />
                <p id="nameResult"       
                 style=" margin: 0;
                        font-weight: bold;
                        font-size: 0.7rem;
                        padding: 0.3rem; "></p>
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span> ID Number</th>
              <td>
                <input
                  type="text"
                  placeholder="number only"
                  name="idNo"
                  size="30"
                  required
                />
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span>Email</th>
              <td>
                <input
                  type="email"
                  placeholder="abc@email.com"
                  name="email"
                  size="30"
                  required
                />
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span> Phone</th>
              <td>
                <input
                  type="text"
                  name="phone"
                  placeholder="number only"
                  size="30"
                  required
                />
                <p id="phoneResult"
                style=" margin: 0;
                font-weight: bold;
                font-size: 0.7rem;
                padding: 0.3rem; "></p>
              </td>
            </tr>
            <tr>
              <th><span style="color: red">*</span> Address</th>
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
                  </select>
           
                </div>
                <textarea
                  name="address"
                  id="address"
                  cols="30"
                  rows="4"
                  style="resize: none"
                  required
                ></textarea>
              </td>
            </tr>
          </table>
          <div class="register_agreement">
            <fieldset>
              <legend align="center">Terms and Condition</legend>
              <textarea name="" id="" cols="90" rows="10" disabled> 
              
              Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni architecto magnam, porro dicta doloribus, odit nostrum repellat quos adipisci iusto, quis recusandae consequatur praesentium ipsa distinctio totam excepturi. Velit, laborum?
Aspernatur ullam vel facilis soluta cumque quam! Corporis, soluta. Cumque natus sint perferendis, praesentium atque eaque beatae. Nesciunt eum ut sint molestias optio! Itaque aliquid adipisci enim officiis dicta. Rem.
Nemo excepturi officia sapiente veritatis, dolorem architecto libero reprehenderit laudantium at porro officiis quos laboriosam, voluptates non possimus, perspiciatis deserunt explicabo? Cumque dolorum perspiciatis labore similique unde culpa autem esse.
Illo voluptatem iste distinctio. Tempore, excepturi reiciendis minima nulla esse ab suscipit similique! Fugiat laborum itaque, alias perspiciatis aliquam, dicta inventore reprehenderit iste ab dolorum quidem placeat? Obcaecati, modi odit.
Rem nam veniam voluptates totam deleniti, sint distinctio modi inventore velit vero quam quisquam ipsam consectetur delectus minus dicta. Cum numquam quia itaque nulla possimus officiis vero voluptas quibusdam atque!
Inventore, eius vitae. Dolores ipsa earum, nostrum soluta assumenda vero sequi eveniet repudiandae dolore quisquam, iste nam fuga. Iusto, porro alias? Neque iste nostrum aliquid error natus eligendi, vel quos!
Placeat voluptatum commodi, recusandae at consectetur iusto, ad excepturi fugit dolore illum eos nobis hic quod veniam quam modi labore autem eligendi dicta in repellat aliquam nihil delectus? Est, exercitationem.
Commodi, quod! Ut corporis voluptatibus beatae, accusantium quibusdam magni culpa optio delectus natus magnam a explicabo qui repellat unde eum voluptas. Pariatur facere modi ratione necessitatibus, dolore ipsam repellendus totam.
Est, iste maxime dignissimos sequi repudiandae officiis soluta quisquam magnam minus culpa fuga, veritatis odit? Quia, quaerat culpa eius nostrum deserunt earum explicabo fugit dicta, repellat quam hic, quo error!
Rerum, modi porro. Temporibus quae sapiente impedit incidunt repudiandae repellat velit dicta maxime quisquam ullam non sunt atque eum, totam harum commodi doloribus vitae vel, beatae eaque aliquam quam? Incidunt?
              </textarea
              >
            </fieldset>
            <div class="agreement">
              <input
                type="radio"
                name="register-agreement"
                id="agreed"
                required
              />
              <label for="agreed">Yes, Agree</label>
            </div>
          </div>
          <div class="register_btns" align="center">
            <p
              style="
                margin: 0;
                font-weight: bold;
                font-size: 0.7rem;
                padding: 0.3rem;
              "
              id="validateMsg"
            ></p>
            <button
              class="btn btn-primary"
              type="submit"
              onclick="return validate()"
            >
             SignUp
            </button>
            <button class="btn btn-secondary" type="reset">Cancel</button>
          </div>
        </form>
      </div>
    </div>
    <script>
      let idValidate = false;
      let pwdValidate = false;
      function idCheck() {
        // 아이디 인풋태그로부터 값을 뽑아와야함
        var $userId = $("#enroll-form input[name=userId]");
        $.ajax({
          url: "idCheck.me",
          data: { checkId: $userId.val() },
          success: function (result) {
            if (result == "NNNNN") {
              alert("Id in use");
              //다시입력유도
              $userId.focus();
            } else {
              if (confirm("Id is available! will you use it?")) {
                $("#enroll-form button[type=submit]").removeAttr("disabled");
                $("input[name=userPwd]").prop("disabled", false);
                $("input[name=userPwd]").focus();
                $userId.attr("readonly", true);
              } else {
                $userId.focus();
              }
            }
          },
          error: function () {
            console.log("아이디 중복체크용 ajax실패");
          },
        });
      }
      $(function () {
        $("input[name=checkPwd]").keyup(function () {
          if (
            $("input[name=userPwd]").val() === $("input[name=checkPwd]").val()
          ) {
            $("#pwdResult").text("Passwords matched!");
            $("#pwdResult").css("color", "blue");
            pwdValidate = true;
          } else {
            $("#pwdResult").text("Password do not match");
            $("#pwdResult").css("color", "red");
            pwdValidate = false;
          }
        });
        $("input[name=userPwd]").keyup(function () {
          if (
            $("input[name=userPwd]").val() === $("input[name=checkPwd]").val()
          ) {
            $("#pwdResult").text("Passwords matched!");
            $("#pwdResult").css("color", "blue");
            pwdValidate = true;
          } else {
            $("#pwdResult").text("Password do not match");
            $("#pwdResult").css("color", "red");
            pwdValidate = false;
          }
        });
      });


      let regExp = /^[a-zA-Z]+$/;
      
     
     if( $("input[name=userName]").change(function(){
         let userName = $(this).val();
         if(!regExp.test(userName)){
           $("#nameResult").text("Enter your name in the right format");
           $("#nameResult").css("color", "red");
         } else {
          $("#nameResult").text("We got your name!");
          $("#nameResult").css("color", "blue");


         }

     }));

     
    regExp2 = /^[0-10]+$/;
     if($("input[name=phone]").change(function() {

      
      let phone = $(this).val();
      if(!regExp2.test(phone)) {
        $("#phoneResult").text("Enter your phone properly");
        $("#phoneResult").css("color","red");
      } else {
        $("#phoneResult").text("We got your phone!");
        $("#phoneResult").css("color","blue");
      }
      

     }));


    
      function validate() {
        let isValidated = true;
        let messageValidation = "";
      
        if (
          $("input[name=userPwd]").val() !== $("input[name=checkPwd]").val()
        ) {
          isValidated = false;
          messageValidation = "Please enter the password again";
        }
        $("#validateMsg").text(messageValidation);
        return isValidated;
      
        

 
       
      }
    
      
    </script>
    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
















