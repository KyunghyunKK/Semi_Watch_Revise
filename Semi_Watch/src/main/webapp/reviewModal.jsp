<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<%-- ���� ��������/��Ʈ��Ʈ�� --%>
	<script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
	<script type="text/javascript">
		$(function () {
		 
			$("#rateYo").rateYo({
		        rating: 3, // �ʱ� ����
		        fullStar: true // ������ �����θ� ������ ���
		    }).on("rateyo.set", function (e, data) {
		        // ����ڰ� ������ �������� �� ����Ǵ� �̺�Ʈ
		        $("#ratingValue").text(data.rating); // ������ ������ ǥ��
		        console.log("The rating is " + data.rating); // ������ ������ �ֿܼ� ���
		    });
		 
		});
		
		// Getter
		var normalFill = $("#rateYo").rateYo("option", "fullStar"); //returns true
		 
		// Setter
		$("#rateYo").rateYo("option", "fullStar", true); //returns a jQuery Element
	</script>
	<title>���</title>
</head>

<body>
<div id="rateYo"></div>
<p>Selected Rating: <span id="ratingValue">0</span></p>
</body>

</html>