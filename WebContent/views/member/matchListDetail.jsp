<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Match, com.kh.member.model.vo.Mypet, com.kh.member.model.vo.Review, com.kh.member.model.vo.Member" %>
<%
	Match m = (Match)request.getAttribute("m");

	Review re = (Review)request.getAttribute("r");
	
	Mypet mp = (Mypet)request.getAttribute("mp");
	
	Member joinMem = (Member)request.getAttribute("joinMem");
	
%> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .detail_area {
        background: #9e9e9e1a;
        width: 95%;
        margin: auto;
        margin-bottom: 4rem;
      }
      .detail_area table {
        text-align: center;
        width: 95%;
        margin: auto;
      }

      .detail_area table {
        width: 90%;
        margin: auto;
      }

      .matching-detail-pet {
        display: flex;
        justify-content: center;
        width: 90%;
        margin: auto;
      }

      .matching-detail-pet table {
        width: 700px;
        margin: 1rem;
      }
      .matching-detail-review {
        display: flex;
        justify-content: center;
      }
      .review_area {
        text-align: center;
      }
      #delete-review-btn {
        margin: 0rem 1rem;
      }
      .del_btn {
        display: inline-block;
        background: orangered;
      }

      .del_btn a {
        text-decoration: none;
        color: black;
      }
    </style>
  </head>
  <body>
    <%@ include file = "../common/menubar.jsp"%>
    <h3 align="center">Matching Info</h3>

    <div class="detail_area">
      <br />
      <table class="table table-bordered detail_table" width="80%">
        <tr>
          <th>Matching Code</th>
          <th>PetOwner</th>
          <th>PetSitter</th>
          <th>Location</th>
          <th>Application Date</th>
          <th>Care Start Date</th>
          <th>Care End Date</th>
          <th>Matching Status</th>
        </tr>
        <tr style="background: white">
          <td><%= m.getMatNo() %></td>
          <td><%= m.getPoNum() %></td>
          <td><%= m.getPsNum() %></td>
          <td><%= m.getLocation() %></td>
          <td><%= m.getRequestdate() %></td>
          <td><%= m.getCareSdate() %></td>
          <td><%= m.getCareDdate() %></td>
          <td>
          	<% if(m.getIsEnd().equals("N")) { %>
                         Ongoing
            <% } else { %>
                                    End
            <% } %>
          </td>
        </tr>
      </table>
      <br />
      <table class="table table-bordered detail_tb" width="80%">
        <tr>
          <th style="background: rgba(0, 0, 0, 0.05)" width="400">PetSitter's Location</th>
          <td style="border-bottom: 1px solid #dee2e6">
            <%= m.getAddress() %>
          </td>
        </tr>
      </table>
      <br />
      <br />
      <br />
      <h2 style="text-align: center">About PetSitter/PetOwner</h2>
      <br />
      <div>
        <table class="table table-bordered detail_tb" align="center">
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
          </tr>
          <tr style="background: white">
            <td><%= joinMem.getMemName() %></td>
            <td><%= joinMem.getEmail() %></td>
            <td><%= joinMem.getPhone() %></td>
          </tr>
        </table>
      </div>
      <br />
      <br />
      <br />
      <h2
        style="
          text-align: center;
          font-weight: bold;
          padding: 2rem;
          margin-top: 2rem;
        "
      >
        Pet Info
      </h2>
      <div class="matching-detail-pet">
        <div class="matching-detail-pet-img" style="align-self: center">
          <img src="<%= contextPath %>/<%= mp.getTitleImg() %>" width="150"
          height="100" ">
        </div>
        <table class="table detail_tb">
          <tr>
            <th>Pet Breed</th>
            <th>Pet Name</th>
            <th>Pet Gender</th>
            <th>Pet Age</th>
            <th>Pet Weight</th>
            <th>Other Info</th>
          </tr>
          <tr style="background: white">
            <td><%= m.getPetType() %></td>
            <td><%= m.getPetNum() %></td>
            <td><%= mp.getPetGender() %></td>
            <td><%= mp.getPetBirth() %></td>
            <td><%= mp.getPetWeight() %></td>
            <td><%= mp.getPetDec() %></td>
          </tr>
        </table>
      </div>
      <% String psid = m.getPsNum(); %> <% String poid = m.getPoNum(); %> <%
      String userid = loginUser.getMemId(); %> <% if(!psid.equals(userid)) { %>
      <div class="re_area1">
        <h2
          style="
            text-align: center;
            font-weight: bold;
            padding: 2rem;
            margin-top: 2rem;
          "
        >
          Uploaded Review
        </h2>
        <p align="center" style="border: 1px solid lightgray; width: 800px; margin: auto; background-color: white; padding: 2rem;">
          <% if(re != null) {%> <%= re.getReviewContent() %> <% } else {%> <% }
          %>
        </p>
      </div>
      <% } %> <% if((re == null) && (poid.equals(userid))) { %>
      <form action="<%= contextPath %>/insertreview.re" method="post">
        <div class="review_area2">
          <h2
            style="
              text-align: center;
              font-weight: bold;
              padding: 2rem;
              margin-top: 2rem;
            "
          >
          Write a review
          </h2>
          <input
            type="hidden"
            name="reviewWriter"
            value="<%= loginUser.getMemNum() %>"
          />
          <input type="hidden" name="boardNum" value="<%= m.getBoardNum() %>" />
          <div style="width: 100%; text-align: center">
            <input
              type="text"
              style="width: 800px; height: 200px"
              name="reviewContent"
            />
          </div>
        </div>
        <div align="right" style="margin-right: 10%">
          <button class="btn btn-primary sub_btn1" style="width: 100px; margin-top: 1rem; margin-right: 5rem;" type="submit">UPLOAD</button>
        </div>
      </form>
      <% } %>
      <form action="<%= contextPath %>/insertreport.re" method="post">
        <div class="review_area2">
          <h2
            style="
              text-align: center;
              font-weight: bold;
              padding: 2rem;
              margin-top: 2rem;
            "
          >
         Write a report
          </h2>
          <div style="width: 100%; text-align: center">
            <input
            type="text"
            name="reportContent"
            style="width: 800px; height: 200px"
          />
          </div>
  
        </div>
        <div align="right" style="margin-right: 10%">
          <input
            type="hidden"
            name="reportWriter"
            value="<%= loginUser.getMemNum() %>"
          />
          <% if(loginUser.getMemId().equals(m.getPsNum())) { %>
          <input type="hidden" name="reportMem" value="<%= m.getPoNum() %>" />
          <% } else { %>
          <input type="hidden" name="reportMem" value="<%= m.getPsNum() %>" />
          <% } %>
          <button  class="btn btn-danger sub_btn2"  style="width: 100px; margin-top: 1rem; margin-right: 5rem;"type="submit">??????</button>
        </div>
      </form>
      <br>
      <br>
      <br>
    </div>
  </div>
    <%@ include file="../common/footer.jsp" %>
  </body>
</html>
