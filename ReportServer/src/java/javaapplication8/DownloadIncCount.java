package javaapplication8;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
 

@WebServlet("/HelloServlet5")
public class DownloadIncCount extends HttpServlet {     
            protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String dates = request.getParameter("months");
		ServletOutputStream out=response.getOutputStream();
		response.addHeader("Content-Disposition","attachment;filename=Incas_report_"+new Date()+".xls");
		File f = new File(new CreateExelPack.CreateCountInkasExel().createExel(dates));
		long len = f.length();
		response.addHeader("Content-Length", String.valueOf(len));
		FileInputStream fileInputStream = new FileInputStream(f); 
		int i;
		while((i=fileInputStream.read())!=-1){
			out.write(i);
		}
		fileInputStream.close();
                f.delete();
		out.close();		
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
}
