package tradefx.client;

import java.util.Arrays;
import tradefx.client.model.*;
import tradefx.client.service.BackendWrapperJSONService;
import tradefx.client.service.BackendWrapperJSONServiceAsync;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Scroll;
import com.extjs.gxt.ui.client.data.ModelData;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.MessageBoxEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.store.TreeStore;
import com.extjs.gxt.ui.client.util.Format;
import com.extjs.gxt.ui.client.util.Params;
import com.extjs.gxt.ui.client.widget.Composite;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.DatePicker;
import com.extjs.gxt.ui.client.widget.HorizontalPanel;
import com.extjs.gxt.ui.client.widget.Info;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.MessageBox;
import com.extjs.gxt.ui.client.widget.ProgressBar;
import com.extjs.gxt.ui.client.widget.TabItem;
import com.extjs.gxt.ui.client.widget.TabPanel;
import com.extjs.gxt.ui.client.widget.VerticalPanel;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.button.ButtonBar;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.extjs.gxt.ui.client.widget.grid.CellEditor;
import com.extjs.gxt.ui.client.widget.grid.ColumnConfig;
import com.extjs.gxt.ui.client.widget.grid.ColumnModel;
import com.extjs.gxt.ui.client.widget.grid.EditorGrid.ClicksToEdit;
import com.extjs.gxt.ui.client.widget.layout.CardLayout;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.treegrid.EditorTreeGrid;
import com.extjs.gxt.ui.client.widget.treegrid.TreeGridCellRenderer;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.rpc.ServiceDefTarget;
import com.google.gwt.user.client.ui.RootPanel;


public class TradeFXEntryPoint implements EntryPoint {

	public TradeFXEntryPoint() {		
	}
	
	public void onModuleLoad() {
		RootPanel.get("loading").setVisible(true);
		new ChartComposite(RootPanel.get("controller"));
		RootPanel.get("loading").setVisible(false);
		
		
		restCall("http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeJpies/?start=0&max=45");
	}	

	private void restCall(String url) {
		/*
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeJpies/?start=0&max=45
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeAuds/?start=0&max=45
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeCads/?start=0&max=45
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeEurs/?start=0&max=45
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeChfs/?start=0&max=45
		http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeGbps/?start=0&max=45		
		*/
		
		BackendWrapperJSONServiceAsync backendService
			= (BackendWrapperJSONServiceAsync) GWT.create(BackendWrapperJSONService.class);
		ServiceDefTarget target = (ServiceDefTarget) backendService;
		String moduleRelativeURL = GWT.getModuleBaseURL() + "ForceJSONResponse";
		target.setServiceEntryPoint(moduleRelativeURL);
		
		backendService.invocation(
				"http://localhost:8081/CurrencyWeb/resources/tradeSessionChangeJpies/?start=0&max=45", 
			new AsyncCallback<String>() {
				public void onFailure(Throwable caught) {
		            // acceptor.failed(caught);
				}

				public void onSuccess(String result) {	  
					Info.display("JSON Reply", result);
				}
			}
		);	
	}		
	


	public static Folder getTreeModel(
			String usdHigh, String usdMed, String usdLow, 
			String audHigh, String audMed, String audLow, 
			String cadHigh, String cadMed, String cadLow, 
			String chfHigh, String chfMed, String chfLow,
			String gbpHigh, String gbpMed, String gbpLow, 
			String jpyHigh, String jpyMed, String jpyLow, 
			String eurHigh, String eurMed, String eurLow) 
	{
		
		Folder[] folders = null; 
		
		folders = new Folder[] {		
	        new Folder("USD", 
	        	new Folder[] {
	        		new Folder("HIGH (" + usdHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + usdMed + ")", 
		        			
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + usdLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        }),		        			
	        		}
	        	),
	    
			new Folder("AUD", 
		        	new Folder[] {
	        		new Folder("HIGH (" + audHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + audMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + audLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),		        			
	        		}
	        		
	        		
	        	),
					        
	        new Folder("CAD", 
		        	new Folder[] {
	        		new Folder("HIGH (" + cadHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + cadMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + cadLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),		        			
	        		}
	        ),
	            
	        new Folder("CHF", 
		        	new Folder[] {
	        		new Folder("HIGH (" + chfHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + chfMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + chfLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),		        			
	        		}
	        	),	            
	        new Folder("GBP", 
		        	new Folder[] {
	        		new Folder("HIGH (" + gbpHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + gbpMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + gbpLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        				new Music("Violin Concerto No. 4", "Mozart", "Concertos"),
			        			}),		        			
	        		}
	        	),		            
			new Folder("JPY", 
		        	new Folder[] {
	        		new Folder("HIGH (" + jpyHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + jpyMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + jpyLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        			}),		        			
	        		}
	        		
	        		
	        	),		            
		            
			new Folder("EUR", 
		        new Folder[] {
	        		new Folder("HIGH (" + eurHigh + ")", 
	        			new Music[] {
	        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
	        			}),
	        			
		        		new Folder("MED (" + eurMed + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
			        			}),			
	        		
		        		new Folder("LOW (" + eurLow + ")", 
			        			new Music[] {
			        				new Music("Piano Concerto No. 12", "Mozart", "Concertos"),
		        		}),		        			
			}   		
	    )};

		Folder root = new Folder("root");
		    
		for (int i = 0; i < folders.length; i++) {
			root.add((Folder) folders[i]);
		}

		return root;
	}	
}
