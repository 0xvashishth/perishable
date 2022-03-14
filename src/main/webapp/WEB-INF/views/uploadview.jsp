<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"></meta>
<title>Insert title here</title>
</head>
<body>

<form action="/uploadfile" method="post" enctype="multipart/form-data">
	<input type="file" name="files" multiple />
	<input type="submit" value="Upload Files"/>
</form>

</body>
</html>