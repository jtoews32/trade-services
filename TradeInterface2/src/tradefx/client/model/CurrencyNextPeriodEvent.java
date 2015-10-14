package tradefx.client.model;

/*
<currencyNextPeriodEvents uri="http://localhost:8081/CurrencyWeb/resources/currencyNextPeriodEventss/1/">
<bankClosed>0</bankClosed>
<currency>USD</currency>
<day>2009-09-21T18:58:46-07:00</day>
<eventCount>0</eventCount>
<id>1</id>
<severity>1</severity>
</currencyNextPeriodEvents>
*/

import java.io.Serializable;

import com.extjs.gxt.ui.client.data.BaseModel;

public class CurrencyNextPeriodEvent extends BaseModel implements Serializable {

  private static int ID = 0;
  
  public CurrencyNextPeriodEvent() {
    set("id", ID++);
  }

  public CurrencyNextPeriodEvent(
		  Integer bankClosed, 
		  String currency, 
		  String day, 
		  Integer eventCount, 
		  Integer id, 
		  Integer severity) {
	  
    set("id", ID++);
    set("bankClosed", bankClosed);
    set("currency", currency);    
    set("day", day);
    set("eventCount", eventCount);
    set("idKey", id);
    set("severity", severity);
  }

  public Integer getBankClosed() {
	  return (Integer) get("bankClosed");
  }
  public String getCurrency() {
	  return (String) get("currency");
  }
  public String getDay() {
	  return (String) get("day");
  } 
  public Integer getEventCount() {
	  return (Integer) get("eventCount");
  } 
  public Integer getIdKey() {
	  return (Integer) get("idKey");
  } 
  public Integer getSeverity() {
	  return (Integer) get("severity");
  }
  public Integer getId() {
    return (Integer) get("id");
  }

  /*
  public String getName() {
    return (String) get("name");
  }

  public String toString() {
    return getName();
  }*/
  
  /*
  public CurrencyNextPeriodEvent(String name, BaseTreeModel[] children) {
    this(name);
    for (int i = 0; i < children.length; i++) {
      add(children[i]);
    }
  }*/
}