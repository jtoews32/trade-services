package tradefx.client.service;

import com.google.gwt.user.client.rpc.AsyncCallback;

public interface BackendWrapperJSONServiceAsync {
	void invocation(String restUrl, AsyncCallback<String> callback);
}
