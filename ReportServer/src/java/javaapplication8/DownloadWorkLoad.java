package javaapplication8;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.ws.WebServiceContext;



@WebServlet("/HelloServlet4")
public class DownloadWorkLoad extends HttpServlet {     
            WebServiceContext webServiceContext;
            protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                Pattern pdate = Pattern.compile("((19|20)\\d\\d)-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])");
                String dates = request.getParameter("time");
                String dates1 = request.getParameter("time1");
                Matcher m1 = pdate.matcher(dates);
                Matcher m2 = pdate.matcher(dates1);
                if(!m1.matches() && !m2.matches()){dates = "2099-12-12"; dates1 = "2099-12-13";}
		ServletOutputStream out=response.getOutputStream();
		response.addHeader("Content-Disposition","attachment;filename=workload_report_"+new Date()+".xls");
		File f = new File(new CreateExelPack.CreateWorkTime().createExel(dates,dates1));
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
