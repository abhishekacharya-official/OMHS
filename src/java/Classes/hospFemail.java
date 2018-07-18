/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Classes;

import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author 1405299
 */
public class hospFemail {
    Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	/*public static void main(String args[]) throws AddressException,
			MessagingException {
                        
		JavaEmail1 javaEmail = new JavaEmail1();

		javaEmail.setMailServerProperties();
		javaEmail.createEmailMessage();
		javaEmail.sendEmail();
	}*/

	public void setMailServerProperties() {

		String emailPort = "587";//gmail's smtp port

		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");

	}

	public void createEmailMessage(String toEmails,String huname, int randomInt) throws AddressException,
			MessagingException {
		//String[] toEmails = { "blimpeye@gmail.com" };
                String uuidi = UUID.randomUUID().toString();
		String emailSubject = "Comfirmation code for OMHS";
                String url="http://localhost:8080/OMHS_v_2/hospFpassReq.jsp?var="+huname+"&key="+uuidi;
		String emailBody = "Code for forgot password for hospital: "+randomInt;
                emailBody+="\n";
                emailBody+="Link: ";
                emailBody+=url;

		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);

		
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails));
		

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");//for a html email
		//emailMessage.setText(emailBody);// for a text email

	}

	public void sendEmail() throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "blimpeye@gmail.com";//just the id alone without @gmail.com
		String fromUserEmailPassword = "#jignesh";

		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		//System.out.println("Email sent successfully.");
	}
}
