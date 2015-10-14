package tradefx.server;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import tradefx.client.service.BackendWrapperJSONService;
import com.google.gwt.user.server.rpc.RemoteServiceServlet;

public class BackendWrapperJSONServiceImpl extends RemoteServiceServlet implements BackendWrapperJSONService {
	public String invocation(String restUrl) {
		
		
		// HttpServletRequest request = this.getThreadLocalRequest();
		// HttpSession session = request.getSession();
			
		
		
		
		String responseBody = "";
		  
		try {
			HttpClient httpclient = new DefaultHttpClient();

			  HttpGet httpget = new HttpGet(restUrl); 
	          
			  httpget.setHeader("Accept-Language", "en-us,en;q=0.5");
			  httpget.setHeader("Accept-Encoding", "gzip,deflate");
			  httpget.setHeader("Accept-Charset","ISO-8859-1,utf-8;q=0.7,*;q=0.7");

			  httpget.setHeader("Accept", "application/json");
			  		  
			  ResponseHandler<String> responseHandler = new BasicResponseHandler();
			  responseBody = httpclient.execute(httpget, responseHandler);
			  System.out.println(responseBody);
	      
			  httpclient.getConnectionManager().shutdown();     
	     
		  } catch (Exception e) {
			  
		  }
		  		
		  return responseBody;
	}
}
