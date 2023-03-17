package mul.cam.a.util;

import java.util.Date;

public class PdsUtil {
	// 파일명 -> (time)명 으로 변경
	
	
	// myfile.txt -> 3412324.txt
	public static String getNewFileName(String filename) {
		String newfilename = "";
		String fpost="";
		
		if(filename.indexOf('.') >= 0) { // 확장자 명이 있음 
			fpost=filename.substring(filename.indexOf('.')); // . 위치부터 끝까지 가져옴 ex) .txt
			newfilename = new Date().getTime()+fpost;
		}else { // 확장자 명이 없음
			newfilename=new Date().getTime()+".back";
		}
		return newfilename;
	}
	
	
}
