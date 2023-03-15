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
            <td colspan="2" style="height: 20%">
                <tiles:insertAttribute name="header"/>
        </tr>
        
        <!-- main -->
        <tr>
	        <td style="background-color: grey;">
	            <div align="center">
		            <div  align="center" style="background-color: pink; width: 100%; height: 700px;">
		               <tiles:insertAttribute name="Content-L-1"/>
		            </div>
		            <div  align="center" style="background-color: yellow; width: 100%; height: 100px;">
		               <tiles:insertAttribute name="Content-L-2"/>
		            </div>
	            </div>
	        </td>
	        <td style="background-color: lightgrey;">
	            <div align="center">
	                <div  align="center" style="background-color: green; width: 100%; height: 400px;">
	                   <tiles:insertAttribute name="Content-R-1"/>
	                </div>
	                <div  align="center" style="background-color: purple; width: 100%; height: 400px;">
	                   <tiles:insertAttribute name="Content-R-2"/>
	                </div>
	            </div>
	        </td>
        </tr>
        
        <!-- footer -->
        <tr align="center" style="background-color: black; color: white;">
            <td colspan="2" style="height: 10%">
                <tiles:insertAttribute name="footer"/>
        </tr>
    </table>


</body>
</html>