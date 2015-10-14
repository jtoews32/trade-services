package tradefx.client;

import java.util.Arrays;


import tradefx.client.model.Folder;

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
import com.google.gwt.core.client.GWT;
import com.google.gwt.http.client.RequestBuilder;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.user.client.Timer;
import com.google.gwt.user.client.Window;

public class TradeFXEntryPoint2 {
	private class EventsCurrencyPane1 extends Composite {
		
		public EventsCurrencyPane1() {
			VerticalPanel vp = new VerticalPanel();
		
			vp.setSpacing(10);  
					
			String txt = "No Shit";   
			   
			TabPanel folder = new TabPanel();  
			folder.setWidth(450);  
			folder.setAutoHeight(true);  
			   
			TabItem shortText = new TabItem("Short Text");  
			shortText.addStyleName("pad-text");  
			shortText.addText(txt);  
			folder.add(shortText);  
			   
			TabItem longText = new TabItem("Long Text");  
			longText.addStyleName("pad-text");  
			longText.addText(txt + "<br>" + txt);  
			folder.add(longText);  
			   
			TabPanel panel = new TabPanel();  
			panel.setPlain(true);  
			panel.setSize(450, 250);  
			   
			TabItem normal = new TabItem("Normal");  
			normal.addStyleName("pad-text");  
			normal.addText("Just a plain old tab");  
			panel.add(normal);  
			   
			TabItem ajax1 = new TabItem("Ajax Tab");  
			ajax1.setScrollMode(Scroll.AUTO);  
			ajax1.addStyleName("pad-text");  
			ajax1.setAutoLoad(new RequestBuilder(RequestBuilder.GET, GWT.getHostPageBaseURL() +"data/ajax1.html"));  
			panel.add(ajax1);  
			   
			TabItem eventTab = new TabItem("Event Tab");  
			     eventTab.addListener(Events.Select, new Listener<ComponentEvent>() {  
			       public void handleEvent(ComponentEvent be) {  
			         Window.alert("Event Tab Was Selected");  
			       }  
			     });  
			eventTab.addStyleName("pad-text");  
			eventTab.addText("I am tab 4's content. I also have an event listener attached.");  
			panel.add(eventTab);  
			   
			TabItem disabled = new TabItem("Disabled");  
			disabled.setEnabled(false);  
			panel.add(disabled);  
			  
			// vp.add(pane1Widget);
			vp.add(folder);  
			vp.add(panel);  
			
			initComponent(vp);
		}
	}
	
	
	
	private class NavigationOptionsControllerWidget extends Composite {
		
		public NavigationOptionsControllerWidget() {

			
		     setStyleAttribute("margin", "10px");  
		       
		     ContentPanel panel = new ContentPanel();  
		     panel.setSize(600, 100);  
		     panel.setFrame(true);  
		     panel.setHeading("Trade Information Navigation Control");  
		     panel.setButtonAlign(HorizontalAlignment.CENTER);  
		   
		     final CardLayout layout = new CardLayout();  
		     panel.setLayout(layout);  

		     final LayoutContainer c = new LayoutContainer();  
		     c.addText("Different Prediction Views Options Contained Below ");  
		     panel.add(c);  
		       
		     panel.addButton(new Button("Events/Currency", new SelectionListener<ButtonEvent>() {  
		         @Override  
		         public void componentSelected(ButtonEvent ce) {  
		        	 layout.setActiveItem(c);  
		         }  
		     }));     
		     		     
		     
		     final Listener<MessageBoxEvent> l = new Listener<MessageBoxEvent>() {  
					public void handleEvent(MessageBoxEvent ce) {  
						Button btn = ce.getButtonClicked();  
						Info.display("MessageBox", "The '{0}' button was pressed", btn.getText());  
					}
		     }; 
				
		     panel.addButton(new Button("Price Moves/Currency", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
			    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
			       }  
				}) );
		     
		     panel.addButton( new Button("Stock Watch/Bank", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
				         final MessageBox box = MessageBox.prompt("Name", "Please enter your name:");  
				         box.addCallback(new Listener<MessageBoxEvent>() {  
				           public void handleEvent(MessageBoxEvent be) {  
				             Info.display("MessageBox", "You entered '{0}'", new Params(be.getValue()));  
				           }  
				         });  
				       }  
				     }));
		     
		     panel.addButton( new Button("Arbitrage", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
				         MessageBox box = MessageBox.prompt("Address", "Please enter your address:", true);  
				         box.addCallback(new Listener<MessageBoxEvent>() {  
				           public void handleEvent(MessageBoxEvent be) {  
				             String v = Format.ellipse(be.getValue(), 80);  
				             Info.display("MessageBox", "You entered '{0}'", new Params(v));  
				           }  
				         });  
				       }  
				     }));
		     
		     panel.addButton(new Button("Daily News", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
				         MessageBox box = new MessageBox();  
				         box.setButtons(MessageBox.YESNOCANCEL);  
				         box.setIcon(MessageBox.QUESTION);  
				         box.setTitle("Save Changes?");  
				         box.addCallback(l);  
				         box.setMessage("You are closing a tab that has unsaved changes. Would you like to save your changes?");  
				         box.show();  
				       }  
				     }) );
		     
		     panel.addButton(new Button("Trade Tester", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
				         final MessageBox box = MessageBox.progress("Please wait", "Loading items...",   "Initializing...");  
				         final ProgressBar bar = box.getProgressBar();  
				         final Timer t = new Timer() {  
				        	 float i;  
				   
				           @Override  
				           public void run() {  
				             bar.updateProgress(i / 100, (int) i + "% Complete");  
				             i += 5;  
				             if (i > 105) {  
				               cancel();  
				               box.close();  
				               Info.display("Message", "Items were loaded", "");  
				             }  
				           }  
				         };  
				         t.scheduleRepeating(500);  
				       }  
				     }) );
		     
		     
		     panel.addButton(new Button("Calendar Import", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
			    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
			       }  
				}) );
		     
		     
		     panel.addButton(new Button("Custom Screen Creator", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
			    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
			       }  
				}) );
		     
		     
		     panel.addButton(new Button("Account Details", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
			    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
			       }  
				}) );
		     
		     
		     panel.addButton(new Button("Indicate Email Alerts", new SelectionListener<ButtonEvent>() {  
			       public void componentSelected(ButtonEvent ce) {  
			    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
			       }  
				}) );    
		     
		     
		     layout.setActiveItem(panel.getItem(0));  

		     initComponent(panel);
					   
		}	
	}	
	
	
	
	
	private class CurrencyChartSelectionWidget extends Composite {
		
		public CurrencyChartSelectionWidget() {

			final Listener<MessageBoxEvent> l = new Listener<MessageBoxEvent>() {  
				public void handleEvent(MessageBoxEvent ce) {  
					Button btn = ce.getButtonClicked();  
					Info.display("MessageBox", "The '{0}' button was pressed", btn.getText());  
				}  
			};  

			final ButtonBar buttonBar = new ButtonBar();  
			
			buttonBar.setMinButtonWidth(400);  
			
			buttonBar.add(new Button("Confirm", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		    	   MessageBox.confirm("Confirm", "Are you sure you want to do that?", l);  
		       }  
			}));  
		   
			buttonBar.add(new Button("Prompt", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         final MessageBox box = MessageBox.prompt("Name", "Please enter your name:");  
		         box.addCallback(new Listener<MessageBoxEvent>() {  
		           public void handleEvent(MessageBoxEvent be) {  
		             Info.display("MessageBox", "You entered '{0}'", new Params(be.getValue()));  
		           }  
		         });  
		       }  
		     }));  
			   
		     buttonBar.add(new Button("Multiline Prompt", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         MessageBox box = MessageBox.prompt("Address", "Please enter your address:", true);  
		         box.addCallback(new Listener<MessageBoxEvent>() {  
		           public void handleEvent(MessageBoxEvent be) {  
		             String v = Format.ellipse(be.getValue(), 80);  
		             Info.display("MessageBox", "You entered '{0}'", new Params(v));  
		           }  
		         });  
		       }  
		     }));  
		   
		     buttonBar.add(new Button("Yes/No/Cancel", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         MessageBox box = new MessageBox();  
		         box.setButtons(MessageBox.YESNOCANCEL);  
		         box.setIcon(MessageBox.QUESTION);  
		         box.setTitle("Save Changes?");  
		         box.addCallback(l);  
		         box.setMessage("You are closing a tab that has unsaved changes. Would you like to save your changes?");  
		         box.show();  
		       }  
		     }));  
			   
		     buttonBar.add(new Button("Progress", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         final MessageBox box = MessageBox.progress("Please wait", "Loading items...",  "Initializing...");  
		         final ProgressBar bar = box.getProgressBar();  
		         final Timer t = new Timer() {  
		        	 float i;  
		   
		           @Override  
		           public void run() {  
		             bar.updateProgress(i / 100, (int) i + "% Complete");  
		             i += 5;  
		             if (i > 105) {  
		               cancel();  
		               box.close();  
		               Info.display("Message", "Items were loaded", "");  
		             }  
		           }  
		         };  
		         t.scheduleRepeating(500);  
		       }  
		     }));  
			   
		     buttonBar.add(new Button("Wait", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         final MessageBox box = MessageBox.wait("Progress",  
		             "Saving your data, please wait...", "Saving...");  
		         Timer t = new Timer() {  
		           @Override  
		           public void run() {  
		             Info.display("Message", "Your fake data was saved", "");  
		             box.close();  
		           }  
		         };  
		         t.schedule(5000);  
		       }  
		     }));  
		   
		     buttonBar.add(new Button("Alert", new SelectionListener<ButtonEvent>() {  
		       public void componentSelected(ButtonEvent ce) {  
		         MessageBox.alert("Alert", "Access Denied", l);  
		       }  
		     }));  
		     

		     initComponent(buttonBar);
		   
		}	
	}

	private class EventContentPanel extends ContentPanel {
		public EventContentPanel(CurrencyEditorTreeGrid currencyEditorTreeGrid) {
			super();
		    setBodyBorder(false);  
		    setHeading("Event Details for Selected Date");  
		    
		   
		    setButtonAlign(HorizontalAlignment.CENTER);  
		    setLayout(new FitLayout());  
		    setFrame(true);  
		    setSize(600, 600);  
		    
		    add(currencyEditorTreeGrid);
		}

	}

	private class CurrencyEditorTreeGrid extends EditorTreeGrid<ModelData> {
		public CurrencyEditorTreeGrid(TreeStore treeStore, ColumnModel columnModel) {
			super(treeStore,columnModel);
			
		    setClicksToEdit(ClicksToEdit.TWO);  
		    setBorders(true);  
		    //set
		    // getStyle().setLeafIcon(IconHelper.createStyle("icon-music"));  
		    setSize(400, 400);  
		    setAutoExpandColumn("name");  
		    setTrackMouseOver(false);  	
		}
	}	

	// CurrencyEventScheduleWidget
	private class EventsCurrencyPane2Widget extends Composite {
		
		private EventContentPanel eventContentPanel;
		private Folder model;
		private TreeStore<ModelData> store;
		private ColumnConfig name;
		private TextField<String> text;
		private ColumnConfig author;
		private ColumnConfig size;
		private ColumnModel columnModel;

		
		public EventsCurrencyPane2Widget (
				String usdHigh, String usdMed, String usdLow, 
				String audHigh, String audMed, String audLow, 
				String cadHigh, String cadMed, String cadLow, 
				String chfHigh, String chfMed, String chfLow,
				String gbpHigh, String gbpMed, String gbpLow, 
				String jpyHigh, String jpyMed, String jpyLow, 
				String eurHigh, String eurMed, String eurLow		
		) {

		    model = TradeFXEntryPoint.getTreeModel(
					usdHigh, usdMed, usdLow, 
					audHigh, audMed, audLow, 
					cadHigh, cadMed, cadLow, 
					chfHigh, chfMed, chfLow,
					gbpHigh, gbpMed, gbpLow, 
					jpyHigh, jpyMed, jpyLow, 
					eurHigh, eurMed, eurLow); 
		    
		    store = new TreeStore<ModelData>();  
		    store.add(model.getChildren(), true);  
		    
		    name = new ColumnConfig("name", "Currency Symbols", 100);  
		    name.setRenderer(new TreeGridCellRenderer<ModelData>());  
		    
		    text = new TextField<String>();  
		    text.setAllowBlank(false);  
		    name.setEditor(new CellEditor(text));  

		    author = new ColumnConfig("author", "Event Time", 100);  
		    author.setEditor(new CellEditor(new TextField<String>()));  
		      
		    size = new ColumnConfig("genre", "Description", 100);  
		    size.setEditor(new CellEditor(new TextField<String>()));  
		  
		    columnModel = new ColumnModel(Arrays.asList(name, author, size));  
			
		    eventContentPanel = new EventContentPanel(new CurrencyEditorTreeGrid(store, columnModel));

		    setStyleAttribute("margin", "10px");  

		    ContentPanel panel = new ContentPanel();  
		    panel.setSize(422, 190);  
		    panel.setFrame(true);  
		    panel.setHeading("Pick Day of Month to See Events that may Cause Volatility");  
		    panel.setButtonAlign(HorizontalAlignment.CENTER);  
		   
		    
		    final DatePicker picker = new DatePicker();
		    
		    picker.addListener(Events.Select, new Listener<ComponentEvent>() {  
		      
		         public void handleEvent(ComponentEvent be) {  
		            String d = DateTimeFormat.getShortDateFormat().format(picker.getValue());  
		            Info.display("Date Selected", "You selected {0}.", new Params(d));  
		          }  
		      
		    });  
		    
		    CardLayout layout = new CardLayout();

		    panel.setLayout(layout);  
		    panel.addText("Pick a date on right to populate above widget with information and this text will change to contain details about the days events for the currencies listed above.<br> Select a currency above and combine it with a date to get information about price movements for that day.");
		    
		    VerticalPanel vertical = new VerticalPanel();
		    
		    vertical.add(eventContentPanel );
		    // vertical.add( panel);
		    HorizontalPanel horizontal = new HorizontalPanel();
		
		    horizontal.add(panel);
		    horizontal.add(picker);
		    vertical.add(horizontal);
			initComponent(vertical);
		}
	}

}
