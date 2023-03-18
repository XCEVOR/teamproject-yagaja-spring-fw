package mul.cam.a.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import mul.cam.a.service.BbsService;

public class DownloadView extends AbstractView {

	@Autowired
	BbsService service;
	
	// 다운로드를 받을수 있는 뷰 설정
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DownloadView renderMergedOutputModel");
		
		File downloadFile = (File)model.get("downloadFile");
		String filename = (String)model.get("filename");	// 원본 파일명
		int seq = (Integer)model.get("seq");
		
		response.setContentType(this.getContentType());
		response.setContentLength((int)downloadFile.length());
		
		// 이 설정은 한글명 파일의 경우 적용된다
		filename = URLEncoder.encode(filename, "utf-8");
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");	// 다운로드 받았을 때 원본 파일명으로 바꿔줌
		response.setHeader("Content-Transfer-Encoding", "binary;");		// 2진수형태로 받기	
		response.setHeader("Content-Length", "" + downloadFile.length());	// 내용의 길이. 렌더링
		response.setHeader("Pragma", "no-cache;"); 	// 저장을 할지말지(no-cache : 저장x)
		response.setHeader("Expires", "-1;");		// 기한(-1 : 필요없음)
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(downloadFile);
		
		// 실제 데이터를 기입
		FileCopyUtils.copy(fis, os);
		
		// download count 증가
		//service.downCount(seq);
		
		if(fis != null) {
			fis.close();
		}
	}
}