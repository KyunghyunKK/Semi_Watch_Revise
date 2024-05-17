<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="container" style="padding: 3% 0; border: solid 1px red;">
   <h2 class="text-center mb-5"> ȸ�� ��ü ���</h2>
   
   <form name="member_search_frm">
      <select name="searchType">
         <option value="">�˻����</option>
         <option value="name">ȸ����</option>
         <option value="userid">���̵�</option>
         <option value="email">�̸���</option>
      </select>
      &nbsp;
      <input type="text" name="searchWord" /> 
       <input type="text" style="display: none;" /> 
      <button type="button" class="btn btn-secondary" onclick="goSearch()">�˻�</button>
      
      <span style="font-size: 12pt; font-weight: bold;">�������� ȸ�����&nbsp;-&nbsp;</span>
      <select name="sizePerPage">
         <option value="20">20��</option>
         <option value="10">10��</option>   
         <option value="5">5��</option>   
      </select>
   </form>
   <table class="table table-bordered" id="memberTbl">
      <thead>
          <tr>
             <th>��ȣ</th>
             <th>���̵�</th>
             <th>ȸ����</th>
             <th>�̸���</th>
             <th>����</th>	
          </tr>
      </thead>
      <tbody>
	      <c:if test="${not empty requestScope.memberList}">      
	          <c:forEach var="membervo" items="${requestScope.memberList}" varStatus="status">
	          	<tr class="memberInfo">
	          		<%-- >>> ����¡ ó���� �����ִ� ���� ���� <<<
                     �����Ͱ��� - (��������ȣ - 1) * 1�������纸���ٰ��� - �ε�����ȣ => ���� 
                     <����>
                     �����Ͱ��� : 12
                     1�������纸���ٰ��� : 5
                  
                     ==> 1 ������       
                     12 - (1-1) * 5 - 0  => 12
                     12 - (1-1) * 5 - 1  => 11
                     12 - (1-1) * 5 - 2  => 10
                     12 - (1-1) * 5 - 3  =>  9
                     12 - (1-1) * 5 - 4  =>  8
                  
                     ==> 2 ������
                     12 - (2-1) * 5 - 0  =>  7
                     12 - (2-1) * 5 - 1  =>  6
                     12 - (2-1) * 5 - 2  =>  5
                     12 - (2-1) * 5 - 3  =>  4
                     12 - (2-1) * 5 - 4  =>  3
                  
                     ==> 3 ������
                     12 - (3-1) * 5 - 0  =>  2
                     12 - (3-1) * 5 - 1  =>  1 
                 --%>
                 	<fmt:parseNumber var="currentShowPageNo" value="${requestScope.currentShowPageNo}" />
                 	<fmt:parseNumber var="sizePerPage" value="${requestScope.sizePerPage}" />
                 	<%-- fmt:parseNumber �� ���ڿ��� ������������ ����ȯ ��Ű�� ���̴�. --%>
                 	<%-- �����Ͱ��� - (��������ȣ - 1) * 1�������纸���ٰ��� - �ε�����ȣ => ���� --%>
	          		<td>${(requestScope.totalMemberCount) - (currentShowPageNo -1) * sizePerPage - (status.index)}</td>
	          		<td class="userid">${membervo.userid}</td>
	          		<td>${membervo.name}</td>
	          		<td>${membervo.email}</td>
	          		<td>
	          			<c:choose>
	          				<c:when test="${membervo.gender == '1'}">��</c:when>
	          				<c:otherwise>��</c:otherwise>
	          			</c:choose>
	          		</td>
	          	</tr>
	          </c:forEach>
	      </c:if>
	      <c:if test="${empty requestScope.memberList}">      
	          <tr>
	          	 <td colspan="5">�����Ͱ� �������� �ʽ��ϴ�.</td>
	          </tr>
	      </c:if>
      </tbody>
   </table>     

    <div id="pageBar">
       <nav>
			<ul class="pagination">
				${requestScope.pageBar}
			</ul>
       </nav>
    </div>
</div>

<form name="memberOneDetail_frm">
	<input type="hidden" name="userid"/>
	<input type="hidden" name="goBackURL" value="${requestScope.currentURL}"/>
	<%-- �� ������ ���� URL �� ������. --%>
</form>

</body>
</html>