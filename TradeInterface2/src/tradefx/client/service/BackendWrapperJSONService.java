package tradefx.client.service;

import com.google.gwt.user.client.rpc.RemoteService;
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;

@RemoteServiceRelativePath("ForceJSONResponse")
public interface BackendWrapperJSONService extends RemoteService {
	String invocation(String restUrl);
}
