<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/mainpage.css" />
<link rel="stylesheet" href="assets/css/noscript.css" />
<link rel="stylesheet" href="assets/css/layout.css" />
<style>

html, body, #fullheight {

height:100%;

}


</style>
</head>
<body>


   <div id="fullheight">
    <table id="fullheight"  style="width: 100%; border-color: gray;">
        <!-- header -->
        <tr align="center">
            <td colspan="2" style="height: 20%">
                <tiles:insertAttribute name="header"/>
        </tr>
        
        <!-- main -->
        <tr>
	        <td style="background-color: grey;">
	            <div  align="center" style="background-color: pink; width: 100%; height: 100%;">
	               <tiles:insertAttribute name="Content"/>
	            </div>
	        </td>
        </tr>
        
        <!-- footer -->
        <tr class="footer">
            <td colspan="2" style="height: 10%">
                <tiles:insertAttribute name="footer"/>
        </tr>
    </table>

</div>
</body>
</html>