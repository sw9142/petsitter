<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList
				, com.kh.notice.model.vo.Notice
				, com.kh.common.model.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .outer {
        width: 1000px;
        height: 700px;
        margin: auto;
        margin-top: 50px;
      }
      .search {
        margin: auto;
      }
      .list-area {
        border: solid black 1px;
        text-align: center;
      }

      .list-area > tbody > tr:hover {
        background: gray;
        cursor: pointer;
      }
      .paging-area button {
        border: 1px solid black;
      }
      .thead-dark{
       position: relative;
      }
      
      #noresult{
      position: absolute;
     bottom: -68px;
      left: 45%;
      }
  
    </style>
  </head>
  <body>
    <%@include file="../common/menubar.jsp" %>

    <div class="outer">
      <h2 align="center" style="font-weight: bold">Admin Notice</h2>
      <br />
      <div align="center">
        <form action="<%=contextPath %>/search.no" method="post">
          <input type="hidden" name="currentPage" value="1"  />
          <input type="date" name="noStartDate" required /> ~
          <input type="date" name="noEndDate" required /> Title
          <input type="text" name="keyword" required />
          <input type="submit" value="Search" />
        </form>
      </div>
      <br />
      <table class="list-area table" align="center">
        <thead class="thead-dark">
          <tr>
            <th>Board No</th>
            <th width="400">Title</th>
            <th width="100">Writer</th>
            <th width="100">Date</th>
            <th>view</th>
          </tr>
        </thead>
        <tbody>
          <%if(list.isEmpty()){ %>
         
            
         
          <%}else{ %> <%for(Notice n : list){ %>
          <!-- ArrayList??? size() -->
          <tr>
            <td><%=n.getNoticeNum() %></td>
            <td><%=n.getNoticeTitle() %></td>
            <td><%=n.getNoticeWriter() %></td>
            <td><%=n.getNoticeDate() %></td>
            <td><%=n.getNoticeViewer() %></td>
          </tr>
          <%} %> <%} %>
        </tbody>
      </table>
      <br />
      <%if(loginUser!=null && loginUser.getMemId().equals("admin")){ %>
      <div align="center">
        <button
          class="btn btn-primary"
          style="margin-top: 2rem"
          onclick="location.href='<%=contextPath%>/enrollForm.no'"
        >
         Write
        </button>
      </div>
      <%} %>
      <br />

      <!-- ------------------------???????????? ?????? ---------------------------------- -->
      <div class="paging-area" align="center">
        <%if(currentPage != 1){ %>
        <button
          onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage-1%>'"
        >
          &lt;
        </button>
        <% }%> <%for(int i = startPage; i<=endPage; i++) {%> <%if(i !=
        currentPage){ %>
        <button
          onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=i%>'"
        >
          <%=i %>
        </button>
        <%} else{%>
        <button disabled><%=i %></button>
        <%}%> <%} %> <%if(currentPage != maxPage){ %>
        <button
          onclick="location.href='<%=contextPath%>/list.no?currentPage=<%=currentPage+1%>'"
        >
          &gt;
        </button>
        <%} %>
      </div>
      <script>
        //script ?????? ???????????? ?????????????????? ?????? jsp ????????? ??? ??? ??????.
        $(function(){
        	$(".list-area>tbody>tr").click(function(){
        		var nno = $(this).children().eq(0).text();

        		location.href="<%=contextPath%>/detail.no?nno="+nno+"&currentPage="+<%=currentPage%>;
        	});
        })
      </script>
    </div>
  </body>
  <footer><%@ include file="../common/footer.jsp" %></footer>
</html>
