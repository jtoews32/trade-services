package tradefx.client.model;

import java.util.Date;
import com.extjs.gxt.ui.client.data.BaseModel;

public class TrialExamples extends BaseModel {

	  public TrialExamples() {
	  }

	  public TrialExamples(String name) {
	    set("name", name);

	  }

	  public Date getLastTrans() {
	    return (Date) get("date");
	  }

	  public String getName() {
	    return (String) get("name");
	  }

	  public String toString() {
	    return getName();
	  }
	
}
