package mul.cam.a.util;

import java.util.Date;

public class PdsUtil {
	// ���ϸ� -> (time)�� ���� ����
	
	
	// myfile.txt -> 3412324.txt
	public static String getNewFileName(String filename) {
		String newfilename = "";
		String fpost="";
		
		if(filename.indexOf('.') >= 0) { // Ȯ���� ���� ���� 
			fpost=filename.substring(filename.indexOf('.')); // . ��ġ���� ������ ������ ex) .txt
			newfilename = new Date().getTime()+fpost;
		}else { // Ȯ���� ���� ����
			newfilename=new Date().getTime()+".back";
		}
		return newfilename;
	}
	
	
}
