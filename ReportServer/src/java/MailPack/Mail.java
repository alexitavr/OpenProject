package MailPack;

import com.sun.mail.util.MailSSLSocketFactory;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Properties; 
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message; 
import javax.mail.MessagingException; 
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress; 
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage; 
import javax.mail.internet.MimeMultipart;

public class Mail{
    private Multipart multipart = null;
    private MimeMessage message = null;
    private String[] sendto;

    
    private ArrayList returnTO() throws FileNotFoundException{
        String[] to = sendto;
        ArrayList<String> copy = new ArrayList<>(); 
        for (int i = 0; i < to.length; i++){
            copy.add(to[i]);
        }
        return copy;
    }
    public void setString(String[] to){
        this.sendto = to;
    }
    
    
    public void mailSend(String content, String Theme) throws MessagingException, UnsupportedEncodingException, FileNotFoundException, GeneralSecurityException {
        
        MailSSLSocketFactory sf = null;
        try
        {
          sf = new MailSSLSocketFactory();
        }
        catch (GeneralSecurityException e)
        {
        e.printStackTrace();
        }
        sf.setTrustAllHosts(true);
        String from = "atmmonitoring@rncb.ru";
        String host = "10.82.254.186";
        String smtpPort="25";
        String ENCODING = "UTF-8";    
        Properties properties = System.getProperties();

        properties.put("mail.smtp.host", host); 
        properties.put("mail.smtp.port", smtpPort);
        properties.put("mail.smtp.user", "atmmonitoring@rncb.ru");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.socketFactory.port", smtpPort);
        properties.put("mail.smtp.ssl.socketFactory", sf);
        Session session = Session.getInstance(properties,
         new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(
                  "atmmonitoring", "Kem39j@r6");
               }
         });  
        try{
            message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            
            message.setSubject(Theme);
            BodyPart messageBodyPart = new MimeBodyPart(); 
            messageBodyPart.setContent(content, "text/html; charset=" + ENCODING + ""); 
            multipart = new MimeMultipart(); 
            multipart.addBodyPart(messageBodyPart); 
            message.setContent(multipart);
            
        }catch(MessagingException mex){
            System.out.println(mex);
        }
    }
    
    public void SetTo() throws FileNotFoundException, MessagingException{
        ArrayList<String> copy = returnTO();
        if (!copy.isEmpty()) {
                for (int i=0; i < copy.size(); i++) {
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(copy.get(i)));
                }
            }
    }
    
    public void AddFile(String filename) throws UnsupportedEncodingException, MessagingException{
            BodyPart attachmentBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(filename); 
            attachmentBodyPart.setDataHandler(new DataHandler(source)); 
            attachmentBodyPart.setFileName(source.getName()); 
            multipart.addBodyPart(attachmentBodyPart);    
    }
    public void send(){
        try {
            Transport.send(message);
        } catch (MessagingException ex) {
            Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("mail send is successes");
    }
}