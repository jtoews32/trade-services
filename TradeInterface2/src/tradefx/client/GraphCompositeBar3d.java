package tradefx.client;


import tradefx.client.model.ChartModelExample;
import tradefx.client.model.GalleryChartModel;

import com.extjs.gxt.charts.client.Chart;
import com.extjs.gxt.charts.client.model.ChartModel;
import com.extjs.gxt.charts.client.model.axis.XAxis;
import com.extjs.gxt.charts.client.model.axis.YAxis;
import com.extjs.gxt.charts.client.model.charts.AreaChart;
import com.extjs.gxt.charts.client.model.charts.BarChart;
import com.extjs.gxt.charts.client.model.charts.BarChart.BarStyle;
import com.extjs.gxt.ui.client.Style.LayoutRegion;
import com.extjs.gxt.ui.client.event.Events;
import com.extjs.gxt.ui.client.event.Listener;
import com.extjs.gxt.ui.client.event.SelectionChangedEvent;
import com.extjs.gxt.ui.client.event.SliderEvent;
import com.extjs.gxt.ui.client.store.ListStore;
import com.extjs.gxt.ui.client.util.Format;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.ListView;
import com.extjs.gxt.ui.client.widget.Slider;
import com.extjs.gxt.ui.client.widget.form.FieldSet;
import com.extjs.gxt.ui.client.widget.form.SliderField;
import com.extjs.gxt.ui.client.widget.layout.BorderLayout;
import com.extjs.gxt.ui.client.widget.layout.BorderLayoutData;
import com.extjs.gxt.ui.client.widget.layout.FitData;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.FormLayout;
import com.extjs.gxt.ui.client.widget.layout.MarginData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayoutData;
import com.extjs.gxt.ui.client.widget.layout.VBoxLayout.VBoxLayoutAlign;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Element;
import com.google.gwt.user.client.Random;
import com.google.gwt.user.client.Timer;


class GraphCompositeBar3d extends LayoutContainer {
	
	public GraphCompositeBar3d() {
		// TODO Auto-generated constructor stub
	}
	
	private int updateSpeed = 1500;  
	private int numSegments = 5;  
	private Timer updater;  
	private Command updateCmd;  
	private ChartModelExample example = new AreaChartExample();  
	
	@Override  
	protected void onAttach() {  
		updater.scheduleRepeating(updateSpeed);  
		super.onAttach();  
	}  
	   	
	
	@Override  
	protected void onDetach() {  
		updater.cancel();  
		super.onDetach();  
	}  
	   
	private void adjustUpdateSpeed(int newSpeed) {  
		updateSpeed = newSpeed;  
		updateCmd.execute();  
	   
		if (updater != null) 
			updater.cancel();
		
		if (updateSpeed == 0) {  
			return;  
		}  
		updater = new Timer() {  
			public void run() {  
				updateCmd.execute();  
			}  
		};  
		updater.scheduleRepeating(updateSpeed);  
	}  
	   

	private LayoutContainer getDetails() {  
		LayoutContainer lc = new LayoutContainer();  
		VBoxLayout vLayout = new VBoxLayout();  
		vLayout.setVBoxLayoutAlign(VBoxLayoutAlign.STRETCH);  
		lc.setLayout(vLayout);  
	   
		VBoxLayoutData vFlex = new VBoxLayoutData();  
		vFlex.setFlex(1);  
	   
		FieldSet controls = new FieldSet();  
		controls.setHeading("Controls");  
		FormLayout fl = new FormLayout();  
		fl.setLabelWidth(120);  
		controls.setLayout(fl);  
	   
		Slider segments = new Slider();  
		segments.setMaxValue(12);  
		segments.setMinValue(1);  
		segments.setIncrement(1);  
		segments.setValue(numSegments);  
		segments.addListener(Events.Change, new Listener<SliderEvent>() {  
			   public void handleEvent(SliderEvent be) {  
	    	   		numSegments = be.getNewValue();  
	    	   		adjustUpdateSpeed(updateSpeed);  
	       		}  
		}); 
		   
		SliderField segFld = new SliderField(segments);  
		segFld.setFieldLabel("Segments (#)");  
		controls.add(segFld);  
	   
		final Slider update = new Slider() {  
			@Override  
			protected String onFormatValue(int value) {  
				if (value == 0) 
					return "Off";  
				return super.onFormatValue(value);  
			}  
		};  
		
		update.setMinValue(0);  
		update.setMaxValue(3000);  
		update.setIncrement(100);  
		update.setValue(updateSpeed);  
		update.setMessage("{0}ms");  
		update.addListener(Events.Change, new Listener<SliderEvent>() {  
			   public void handleEvent(SliderEvent se) {  
				   adjustUpdateSpeed(se.getNewValue());  
			   }  
		});
		   
		SliderField updFld = new SliderField(update);  
		updFld.setFieldLabel("Update Interval (ms)");  
		controls.add(updFld);  
	   
		lc.add(controls, vFlex);  
	   
		FieldSet gallery = new FieldSet();  
		gallery.setHeading("Gallery");  
		gallery.setLayout(new FitLayout());  
	   
		/*
		ListStore<GalleryChartModel> store = new ListStore<GalleryChartModel>();  
		store.add(new GalleryChartModel("Area", "area.gif", new AreaChartExample()));  
		store.add(new GalleryChartModel("Pie", "pie.gif", new PieChartExample()));  
		   store.add(new GalleryChartModel("Filled Bar", "filled.gif", new FilledBarChartExample()));  
		   store.add(new GalleryChartModel("Bar - Glass", "barglass.gif", new BarGlassChartExample()));  
		   store.add(new GalleryChartModel("Bar - 3D", "bar3d.gif", new Bar3DChartExample()));  
		   store.add(new GalleryChartModel("Radar", "radar.gif", new RadarChartExample()));  
		   store.add(new GalleryChartModel("Horizontal Bar", "horizontalbar.gif", new HorizontalChartExample()));      
		   store.add(new GalleryChartModel("Cylinder", "cylinder.gif", new CylinderChartExample()));  
		   store.add(new GalleryChartModel("Sketch Bar", "sketchbar.gif", new SketchChartExample()));  
	   
		   ListView<GalleryChartModel> view = new ListView<GalleryChartModel>() {  
			   @Override  
			   protected GalleryChartModel prepareData(GalleryChartModel model) {  
				   String s = model.get("name");  
				   model.set("shortName", Format.ellipse(s, 15));  
				   return model;  
			   }  
		   };  
		   */
		 
		   /*
		   view.setId("img-chooser-view");  

		   
		   view.setTemplate(getTemplate( "../../" ));  
		   view.setStore(store);  
		   view.setItemSelector("div.thumb-wrap");  
		   view.getSelectionModel().select(0, false);  
		   view.getSelectionModel().addListener(Events.SelectionChange,  
				   new Listener<SelectionChangedEvent<GalleryChartModel>>() {  
	   
	           	public void handleEvent(SelectionChangedEvent<GalleryChartModel> be) {  
	           		example = be.getSelectedItem().getExample();  
	           		adjustUpdateSpeed(updateSpeed);  
	           	}  
		   });  
		   
		   gallery.add(view, new FitData(0, 0, 20, 0));  
	   		*/
	   
		vFlex = new VBoxLayoutData();  
		vFlex.setFlex(4);  
		lc.add(gallery, vFlex);  
		return lc;  
	}  	
	
	
	  class AreaChartExample implements ChartModelExample {
		    public ChartModel getChartModel(int segments) {
		      ChartModel cm = new ChartModel("Growth per Region",
		          "font-size: 14px; font-family: Verdana;");
		      cm.setBackgroundColour("#ffffff");
		      XAxis xa = new XAxis();
		      xa.setLabels("J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D");
		      cm.setXAxis(xa);
		      AreaChart area1 = new AreaChart();
		      area1.setFillAlpha(0.3f);
		      area1.setColour("#ff0000");
		      area1.setFillColour("#ff0000");
		      for (int n = 0; n < 12; n++) {
		        if (n % 3 != 0)
		          area1.addNullValue();
		        else
		          area1.addValues(n * Random.nextDouble());
		      }
		      cm.addChartConfig(area1);
		      AreaChart area2 = new AreaChart();
		      area2.setFillAlpha(0.3f);
		      area2.setColour("#00aa00");
		      area2.setFillColour("#00aa00");
		      int floor = Random.nextInt(3);
		      double grade = (Random.nextInt(4) + 1) / 10.0;
		      for (int n = 0; n < 12; n++) {
		        if (n % 2 != 0)
		          area2.addNullValue();
		        else
		          area2.addValues(n * grade + floor);
		      }
		      cm.addChartConfig(area2);
		      return cm;

		    }
		  }
	  
	
	private LayoutContainer getChart() {  
		FieldSet fs = new FieldSet();  
		fs.setHeading("Chart");  
		fs.setLayout(new FitLayout());  
	   
		   // String url = !Examples.isExplorer() ? "../../" : "";  
		   // String url += "gxt/chart/open-flash-chart.swf";  
		   String url = "open-flash-chart.swf"; 
		   final Chart chart = new Chart(url);  
		   
		   chart.setBorders(true);  
		   fs.add(chart, new FitData(0, 0, 20, 0));  
		   updateCmd = new Command() {  
			   public void execute() {  
				   chart.setChartModel(example.getChartModel(numSegments));
				   
				   
	       		}  
		   };  
	   
		   adjustUpdateSpeed(updateSpeed);  
		   return fs;  
	}  	
	
	@Override  
	protected void onRender(Element parent, int index) {  
		super.onRender(parent, index);  
		ContentPanel cp = new ContentPanel();  
		cp.setHeading("Charts Gallery");  
		cp.setFrame(true);  
		cp.setSize(700, 350);  
		cp.setLayout(new BorderLayout());  
	   
		BorderLayoutData eastData = new BorderLayoutData(LayoutRegion.EAST, 370);  
	   
		BorderLayoutData centerData = new BorderLayoutData(LayoutRegion.CENTER);  
		centerData.setMargins(new Margins(0, 5, 0, 0));  
	   
		cp.add(getChart(), centerData);  
		cp.add(getDetails(), eastData);  
	   
		add(cp, new MarginData(20));       
	}  	
	
	public GraphCompositeBar3d(int segments) {  
		ChartModel cm = new ChartModel("Sales by Month 2008", "font-size: 14px; font-family: Verdana; color:#ffff00;");  
		cm.setBackgroundColour("#000077");  
		XAxis xa = new XAxis();  
		xa.setLabels(TestData.getShortMonths(segments));  
		xa.getLabels().setColour("#ffff00");  
		xa.setGridColour("-1");  
		xa.setColour("#aa5500");  
		xa.setZDepth3D(5);  
		cm.setXAxis(xa);  
		YAxis ya = new YAxis();  
		ya.setSteps(16);  
		ya.setMax(160);  
		ya.setGridColour("#000099");  
		ya.setColour("#ffff00");  
		cm.setYAxis(ya);  
		cm.setYAxisLabelStyle(10, "#ffff00");  
		BarChart bchart = new BarChart(BarStyle.THREED);  
		bchart.setColour("#CC6600");  
		bchart.setTooltip("$#val#");  
		for (int t = 0; t < segments; t++) {  
			bchart.addValues(Random.nextInt(50) + 50);  
		}  
		cm.addChartConfig(bchart);  
	}  
}  

