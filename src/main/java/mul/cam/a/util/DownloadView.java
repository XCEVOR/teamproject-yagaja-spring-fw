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
	
	// �ٿ�ε带 ������ �ִ� �� ����
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DownloadView renderMergedOutputModel");
		
		File downloadFile = (File)model.get("downloadFile");
		String filename = (String)model.get("filename");	// ���� ���ϸ�
		int seq = (Integer)model.get("seq");
		
		response.setContentType(this.getContentType());
		response.setContentLength((int)downloadFile.length());
		
		// �� ������ �ѱ۸� ������ ��� ����ȴ�
		filename = URLEncoder.encode(filename, "utf-8");
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");	// �ٿ�ε� �޾��� �� ���� ���ϸ����� �ٲ���
		response.setHeader("Content-Transfer-Encoding", "binary;");		// 2�������·� �ޱ�	
		response.setHeader("Content-Length", "" + downloadFile.length());	// ������ ����. ������
		response.setHeader("Pragma", "no-cache;"); 	// ������ ��������(no-cache : ����x)
		response.setHeader("Expires", "-1;");		// ����(-1 : �ʿ����)
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(downloadFile);
		
		// ���� �����͸� ����
		FileCopyUtils.copy(fis, os);
		
		// download count ����
		//service.downCount(seq);
		
		if(fis != null) {
			fis.close();
		}
	}
}