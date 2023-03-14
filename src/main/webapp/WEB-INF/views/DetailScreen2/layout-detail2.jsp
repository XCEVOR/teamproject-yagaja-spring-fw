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
        <tr align="center" style="background-color: black; color: white;">
            <td colspan="2" style="height: 20%">
                <tiles:insertAttribute name="header"/>
        </tr>
        
        <!-- main -->
        <tr>
	        <td style="background-color: grey;">
                <div  align="center" style="width: 100%; height: 600px;">
				    <tiles:insertAttribute name="Content-1"/>
                </div>
	        </td>
	        <td style="background-color: blue;">
	            <div  align="center" style="width: 100%; height: 600px;">
                    <tiles:insertAttribute name="Content-2"/>
	            </div>
	        </td>
        </tr>
        <tr>
            <td colspan="2" style="background-color: green;">
                <div  align="center" style="width: 100%; height: 200px;">
                    <tiles:insertAttribute name="Content-3"/>
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