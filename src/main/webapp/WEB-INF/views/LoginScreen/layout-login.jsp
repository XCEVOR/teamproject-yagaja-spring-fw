<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <table style="width: 100%; height: 100%; border-color: gray;">
        <!-- header -->
        <tr align="center" style="background-color: black; color: white;">
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
        <tr align="center" style="background-color: black; color: white;">
            <td colspan="3" style="height: 10%">
                <tiles:insertAttribute name="footer"/>
        </tr>

    </table>


</body>
</html>