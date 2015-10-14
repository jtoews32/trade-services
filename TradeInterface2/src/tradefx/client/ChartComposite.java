package tradefx.client;

import com.extjs.gxt.charts.client.Chart;
import com.extjs.gxt.charts.client.event.ChartEvent;
import com.extjs.gxt.charts.client.event.ChartListener;
import com.extjs.gxt.charts.client.model.ChartModel;
import com.extjs.gxt.charts.client.model.Legend;
import com.extjs.gxt.charts.client.model.Legend.Position;
import com.extjs.gxt.charts.client.model.axis.Label;
import com.extjs.gxt.charts.client.model.axis.XAxis;
import com.extjs.gxt.charts.client.model.axis.YAxis;
import com.extjs.gxt.charts.client.model.charts.BarChart;
import com.extjs.gxt.charts.client.model.charts.PieChart;
import com.extjs.gxt.charts.client.model.charts.BarChart.BarStyle;
import com.extjs.gxt.ui.client.Style.LayoutRegion;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.HorizontalPanel;
import com.extjs.gxt.ui.client.widget.Info;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.VerticalPanel;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.form.FieldSet;
import com.extjs.gxt.ui.client.widget.layout.BorderLayout;
import com.extjs.gxt.ui.client.widget.layout.BorderLayoutData;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FormLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.Random;
import com.google.gwt.user.client.ui.RootPanel;

public class ChartComposite extends AbstractChartComposite {
	public ChartComposite (RootPanel rootPanel) {
		super(rootPanel);
		
		createLhsVerticalPanel();
		createRhsLayoutContainer();
		createBottomHorizontalPanel();
		
		contentPanel = new ContentPanel();
		contentPanel.setHeading("Currency Charts Gallery and Trade Station");  
		contentPanel.setFrame(true);  
		contentPanel.setSize(900, 500);
	
		contentPanel.setLayout(new BorderLayout());  
	   
		BorderLayoutData eastData = new BorderLayoutData(LayoutRegion.EAST, 250);  
	   
		BorderLayoutData centerData = new BorderLayoutData(LayoutRegion.CENTER);  
		centerData.setMargins(new Margins(0, 5, 0, 0));  
	   	     
	    BorderLayoutData bottomData = new BorderLayoutData(LayoutRegion.SOUTH, 30);  
	    centerData.setMargins(new Margins(0, 5, 0, 0));  
	  	     
	    contentPanel.add(getLhsVerticalPanel(), centerData);
	    contentPanel.add(getRhsLayoutContainer(), eastData);  
	    contentPanel.add(getBottomHorizontalPanel(), bottomData);
	      
	    initComponent(contentPanel);
	    
	    rootPanel.add(this);
	}

	@Override
	public void createLhsVerticalPanel() {

		setLhsVerticalPanel(new VerticalPanel());
		
		setUsdEurPieChartContentPanel(getGlassBarChart("USD EUR", 10) );
		setUsdJpyPieChartContentPanel(getGlassBarChart("USD AUD", 10));
		setUsdAudPieChartContentPanel(getGlassBarChart("USD JPY", 10));
		
		setUsdGbpPieChartContentPanel(getGlassBarChart("USD GBP", 10));
		setUsdChfPieChartContentPanel(getGlassBarChart("USD CHF", 10));
		setUsdCadPieChartContentPanel(getGlassBarChart("USD CAD", 10) );
		
		HorizontalPanel hPanel1 = new HorizontalPanel();
		
		hPanel1.add(getUsdEurPieChartContentPanel() );
		hPanel1.add(getUsdAudPieChartContentPanel());
		hPanel1.add(getUsdJpyPieChartContentPanel() );
		
		HorizontalPanel hPanel2 = new HorizontalPanel();
		
		hPanel2.add(getUsdGbpPieChartContentPanel());
		hPanel2.add(getUsdChfPieChartContentPanel());
		hPanel2.add(getUsdCadPieChartContentPanel());


		getLhsVerticalPanel().add(hPanel1);
		getLhsVerticalPanel().add(hPanel2);
	}
	
	@Override
	public void createRhsLayoutContainer() {

		setRhsLayoutContainer(new LayoutContainer());
		
		VBoxLayout vLayout = new VBoxLayout();  
		vLayout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);  
		getRhsLayoutContainer().setLayout(vLayout);  
	   
		VBoxLayoutData vFlex = new VBoxLayoutData();  
		vFlex.setFlex(1);  
	   
		FieldSet controls = new FieldSet();  
		controls.setHeading("Controls");  
		FormLayout fl = new FormLayout();  
		fl.setLabelWidth(30);  
		controls.setLayout(fl);  
	   
		getRhsLayoutContainer().add(controls, vFlex);  
	   		
		FieldSet gallery = new FieldSet();  
		gallery.setHeading("Gallery");  
		gallery.setLayout(new FitLayout());  
		   
		vFlex = new VBoxLayoutData();  
		vFlex.setFlex(4);  
		getRhsLayoutContainer().add(gallery, vFlex);

	}
	
	@Override
	public void createBottomHorizontalPanel() {
		
		setBottomHorizontalPanel(new HorizontalPanel());
		
		SelectionListener<ButtonEvent> usdCross = new SelectionListener<ButtonEvent>() {     
			@Override  
			public void componentSelected(ButtonEvent ce) {
				// Info.display("Click", ce.getButton().getItemId() + " clicked");				
				Button hc = new  Button("Hello");
				contentPanel.remove(getLhsVerticalPanel());
				contentPanel.add(hc);
				// contentPanel.layout();
				refreshUI();
				Info.display("Click", ce.getButton().getText() + " clicked");  
      		}  
    	}; 
    	    	
		SelectionListener<ButtonEvent> arbitrage = new SelectionListener<ButtonEvent>() {     
			@Override  
			public void componentSelected(ButtonEvent ce) {
				contentPanel.removeAll();
				Info.display("Click", ce.getButton().getText() + " clicked");  
      		}  
    	}; 

		SelectionListener<ButtonEvent> tomorrow = new SelectionListener<ButtonEvent>() {     
			@Override  
			public void componentSelected(ButtonEvent ce) {  
				contentPanel.removeAll();
				Info.display("Click", ce.getButton().getText() + " clicked");  
      		}  
    	}; 

    	getBottomHorizontalPanel().add(new Button(" USD/CROSS ", usdCross));
    	getBottomHorizontalPanel().add(new Button(" Arbitrage ", arbitrage));
    	getBottomHorizontalPanel().add(new Button(" Tomorrow ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" Events ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" UnTouchable ", tomorrow));
    	
    	getBottomHorizontalPanel().add(new Button(" Best ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" Average ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" STD ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" Switch ", tomorrow));
    	getBottomHorizontalPanel().add(new Button(" Trade Station ", tomorrow));	
	}

	private ChartListener listener = new ChartListener() {  		      
		public void chartClick(ChartEvent ce) {  
			Info.display("Chart Clicked", "You selected {0}.", "" + ce.getValue());  
		}  
	};  
	
	
	public ContentPanel getPieChart(String title) {
		ContentPanel cp = new ContentPanel();  
		cp.setHeading(title);  
		cp.setFrame(true);  
		cp.setSize(200, 200);  
	    cp.setLayout(new FitLayout());  

	    String url = "open-flash-chart.swf";
	    
	    final Chart chart = new Chart(url);  
	    chart.setBorders(true);  

	    // cp.add(chart);      
	    // add(cp, new MarginData(20));  	  
	  
	    ChartModel cm = new ChartModel("Sales by Region",  
        	"font-size: 14px; font-family: Verdana; text-align: center;");  
	    cm.setBackgroundColour("#fffff5");  
	    Legend lg = new Legend(Position.RIGHT, true);  
	    lg.setPadding(10);  
	    cm.setLegend(lg);  
      
	    PieChart pie = new PieChart();  
	    pie.setAlpha(0.5f);  
	    pie.setNoLabels(true);  
	    pie.setTooltip("#label# $#val#M<br>#percent#");  
	    pie.setColours("#ff0000", "#00aa00", "#0000ff", "#ff9900", "#ff00ff");  
	    pie.addSlices(new PieChart.Slice(100, "AU","Australia"));  
	    pie.addSlices(new PieChart.Slice(200, "US", "USA"));  
	    pie.addSlices(new PieChart.Slice(150, "JP", "Japan"));  
	    pie.addSlices(new PieChart.Slice(120, "DE", "Germany"));  
	    pie.addSlices(new PieChart.Slice(60, "UK", "United Kingdom"));  
	    pie.addChartListener(listener);  

    	cm.addChartConfig(pie);
    	
    	chart.setChartModel(cm); 
    	cp.add(chart); 
    	
    
	    	
    	return cp;
	}
	
	public ContentPanel getBarChart(String title) {
		
		ContentPanel cp = new ContentPanel(); 
		
		cp.setSize(200, 200);  
	    cp.setLayout(new FitLayout());  

	    String url = "open-flash-chart.swf";
	    
	    final Chart chart = new Chart(url);  
	    chart.setBorders(true);  

	    // cp.add(chart);      
	    // add(cp, new MarginData(20));  	  
	  
	    ChartModel cm = new ChartModel("Sales by Region",  
        	"font-size: 14px; font-family: Verdana; text-align: center;");  
	    cm.setBackgroundColour("#fffff5");  
	    Legend lg = new Legend(Position.RIGHT, true);  
	    lg.setPadding(10);  
	    cm.setLegend(lg);  
      
	    /*PieChart pie = new PieChart();  
    	cm.addChartConfig(pie); 
    	
  		   ChartModel cm = new ChartModel("Sales by Month",  
       	"font-size: 16px; font-weight: bold; font-family: Verdana; color:#008800;");  
	   cm.setBackgroundColour("#eeffee");  
	   cm.setDecimalSeparatorComma(true);  
	   XAxis xa = new XAxis();  
	   xa.setLabels(TestData.getShortMonths(segments));  
	   xa.getLabels().setColour("#009900");  
	   xa.setGridColour("#eeffee");  
	   xa.setColour("#009900");  
	   cm.setXAxis(xa);  
	   YAxis ya = new YAxis();  
	   ya.setRange(5000, 20000);  
	   ya.setSteps(1000);  
	   ya.setGridColour("#eeffee");  
	   ya.setColour("#009900");  
	   cm.setYAxisLabelStyle(10, "#009900");  
	   cm.setYAxis(ya);  
	   FilledBarChart bchart = new FilledBarChart("#6666ff", "#000066");  
	   bchart.setTooltip("$#val#");  
	   for (int t = 0; t < segments; t++) {  
		   bchart.addValues(Random.nextInt(5000) + 10000);  
	   }  
	   cm.addChartConfig(bchart);    	
    
    	*/
    	
    	chart.setChartModel(cm); 
    	cp.add(chart); 		
		
    	return cp;
	}
	
	
	public ContentPanel getGlassBarChart(String title, int segments) { 
		
		ContentPanel cp = new ContentPanel();  
		cp.setHeading(title);  
		cp.setFrame(true);  
		cp.setSize(200, 200);  
	    cp.setLayout(new FitLayout());  

	    String url = "open-flash-chart.swf";
	    
	    final Chart chart = new Chart(url);  
	    chart.setBorders(true);  
	    
	    ChartModel cm = new ChartModel(); // "Sales by Month 2007",  "font-size: 14px; font-family: Verdana;");  
	    // cm.setBackgroundColour("-1");
	    
	    cm.setBackgroundColour("#ffffff");
	    
	    XAxis xa = new XAxis();  
		for (String m : TestData.getMonths()) {  
			Label l = new Label(m, 45);  
			l.setSize(10);  
			l.setColour("#000000");  
			xa.addLabels(l);  
		}  
		   
		xa.setGridColour("-1");  
		cm.setXAxis(xa);  
		YAxis ya = new YAxis();  
		ya.setSteps(16);  
		ya.setMax(160);  
		ya.setGridColour("#8888FF");  
		cm.setYAxis(ya);  
		BarChart bchart = new BarChart(BarStyle.GLASS);  
		bchart.setColour("#FF00CC");  
		bchart.setTooltip("$#val#");  
		for (int t = 0; t < 12; t++) {  
			if (t == segments - 1) {  
				bchart.addBars(new BarChart.Bar(Random.nextInt(50) + 50, "#8888FF"));  
			} else {  
				bchart.addValues(Random.nextInt(50) + 50);  
			}  
		}  
		cm.addChartConfig(bchart);  

    	chart.setChartModel(cm); 
    	cp.add(chart); 		
		
    	return cp;   
	   }  
	
}
