<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .petSitterRegister_container {
        margin-bottom: 2rem;
      }
      .petSitterRegister_form_container {
        width: 800px;
        margin: auto;
        padding: 2rem;
      }
      .petSitterRegister_form_container form {
        padding: 1rem;
      }
      .petSitterRegister_container table {
        padding: 1rem;
        margin: auto;
        width: 600px;
      }

      .petSitterRegister_container td {
        text-align: center;
      }
      .ps_agreement_container {
        width: 600px;
        margin: 3rem auto;
      }
      .ps_agreement {
        width: 100%;
        text-align: end;
        padding: 2rem;
      }
      #upfiles_wrap {
        display: flex;
      }
      #upfiles_wrap span,
      #upfiles_wrap input {
        padding: 0.5rem;
      }
      
      .register_btns{
      	margin-top : 2rem;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="petSitterRegister_container">
      <h2 style="text-align: center; font-weight: bold; margin-top: 3rem">
        Detail Information About You
      </h2>
      <div class="petSitterregister_form_container">
        <form
          action="<%= contextPath %>/insert.bo"
          method="post"
          enctype="multipart/form-data"
          style="padding: 2rem"
        >
          <input
            type="hidden"
            name="memNum"
            value="<%= loginUser.getMemNum() %>"
          />
          <table class="table table-borderless">
            <tr>
              <th>Do you have experience?</th>
              <td>
                <input type="radio" name="psExp" value="Y" id="exyes" />
                <label for="exyes">Yes</label>

                <input type="radio" name="psExp" value="N" id="exno" />
                <label for="exno">No</label>
              </td>
            </tr>
            <tr>
              <th>Do you have a dog in your home?</th>
              <td>
                <input type="radio" name="psPet" value="Y" id="petyes" />
                <label for="petyes">Yes</label>

                <input type="radio" name="psPet" value="N" id="petno" />
                <label for="petno">No</label>
              </td>
            </tr>
            <tr>
              <th>Do you have Kid(under 12) in your home?</th>
              <td>
                <input type="radio" name="psKid" value="Y" id="kidyes" />
                <label for="kidyes">Yes</label>

                <input type="radio" name="psKid" value="N" id="kidno" />
                <label for="kidno">No</label>
              </td>
            </tr>
            <tr>
              <th>Do you smoke?</th>
              <td>
                <input type="radio" name="psSmoke" value="Y" id="smokeyes" />
                <label for="smokeyes">Yes</label>

                <input type="radio" name="psSmoke" value="N" id="smokeno" />
                <label for="smokeno">No</label>
              </td>
            </tr>
            <tr>
              <th>How many dogs can you take care of?</th>
              <td>
                <select name="petCap" required>
                  <option selected>0</option>
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  <option>9</option>
                  <option>10</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>Your service price</th>
              <td>
                <select name="price" required>
                  <option selected value="7000">7,000 won</option>
                  <option value="8000">8,000 won</option>
                  <option value="9000">9,000 won</option>
                  <option value="10000">10000 won</option>
                  <option value="11000">11000원</option>
                  <option value="12000">12000원</option>
                  <option value="13000">13000원</option>
                  <option value="14000">14000원</option>
                  <option value="15000">15000원</option>
                  <option value="16000">16000원</option>
                  <option value="17000">17000원</option>
                  <option value="18000">18000원</option>
                  <option value="19000">19000원</option>
                  <option value="20000">20000원</option>
                  <option value="21000">21000원</option>
                  <option value="22000">22000원</option>
                  <option value="23000">23000원</option>
                  <option value="24000">24000원</option>
                  <option value="25000">25000원</option>
                  <option value="26000">26000원</option>
                  <option value="27000">27000원</option>
                  <option value="28000">28000원</option>
                  <option value="29000">29000원</option>
                  <option value="30000">30000원</option>
                </select>
              </td>
            </tr>
            <tr>
              <th colspan="2">
                Any things in your mind to tell PetOnwer?
                <p style="margin: 0">
                  ex)  I can't take care of a dog weighing more than 15 kg! 
                </p>
              </th>
            </tr>
            <tr>
              <td colspan="2" style="padding: 0">
                <textarea
                  placeholder="tell them what you in your mind"
                  name="condition"
                  rows="5"
                  cols="80"
                ></textarea>
              </td>
            </tr>
            <tr>
              <th colspan="2">Tell them about you!</th>
            </tr>
            <tr>
              <td colspan="2">
                <input
                  type="text"
                  name="psTitle"
                  size="82"
                  placeholder="ex) I am a very experienced petsitter!"
                  required
                />
              </td>
            </tr>
            <tr>
              <td colspan="2" style="padding: 0">
                <textarea
                  placeholder="tell them who you are!"
                  name="psDesc"
                  rows="5"
                  cols="80"
                ></textarea>
              </td>
            </tr>
            <tr>
              <th>Any pictures to upload?</th>

              <td>
                <div id="upfiles_wrap">
                  <span>MAIN</span>
                  <input type="file" name="upfiles1" required />
                </div>
                <div id="upfiles_wrap">
                  <span>SUB1</span>
                  <input type="file" name="upfiles2" />
                </div>
                <div id="upfiles_wrap">
                  <span>SUB2</span>
                  <input type="file" name="upfiles3" />
                </div>
              </td>
            </tr>
          </table>

  

          <div class="register_btns" align="center">
            <button class="btn btn-primary" type="submit">APPLY</button>
            <button class="btn btn-secondary" type="reset">CANCEL</button>
          </div>
        </form>
      </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
