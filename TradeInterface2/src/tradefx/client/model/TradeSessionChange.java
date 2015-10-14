package tradefx.client.model;

import java.io.Serializable;
import java.util.Date;

import com.extjs.gxt.ui.client.data.BaseModelData;

/* <tradeSessionChangeAud uri="http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeAuds/193/">
	<crossName>AUD</crossName>
	<diff>97.7993</diff>
	<dollarUp>1</dollarUp>
	<id>193</id>
	<tradeSession>1</tradeSession>
</tradeSessionChangeAud> */

public class TradeSessionChange extends BaseModelData implements Serializable  {
	private static int ID = 0;
	
	public TradeSessionChange(String id, String crossName, String diff, String dollarUp, String tradeSession) {	
		ID = Integer.valueOf(id);
		set("id", ID++);
		set("crossName", crossName);
		set("diff", diff);
	    set("dollarUp", dollarUp);
	    set("tradeSession", tradeSession);
	}
	
	
	  
}
 




  /*
  public TradeSessionChange(String name, double open, double change, double pctChange, Date date, String industry) {
    	set("name", name);
    	set("open", open);
    	set("change", change);
    	set("percentChange", pctChange);
    	set("date", date);
    	set("industry", industry);
  }

*/