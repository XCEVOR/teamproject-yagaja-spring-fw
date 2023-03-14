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
            <td colspan="3" style="height: 100px">
                <tiles:insertAttribute name="header"/>
        </tr>
        
        <!-- main -->
        <tr>
            <td align="left" valign="top" style="background-color: rgb(204, 204, 204); width: 20%;">
                <tiles:insertAttribute name="menu"/>
            </td>
            <td style="height: 90%; width: 80%; ">
                <tiles:insertAttribute name="content"/>
            </td>
            <%-- <td align="center" style="width: 15%;">
                <tiles:insertAttribute name="empty"/>
            </td> --%>
        </tr>
        
        <!-- footer -->
        <tr class="footer">
            <td colspan="3" style="height: 10%">
                <tiles:insertAttribute name="footer"/>
        </tr>

    </table>
</div>

</body>
</html>