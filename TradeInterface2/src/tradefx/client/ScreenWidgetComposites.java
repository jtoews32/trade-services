package tradefx.client;

import com.extjs.gxt.ui.client.widget.Composite;

public class ScreenWidgetComposites {
	public Composite pane1;
	public Composite pane2;
	
	
	public ScreenWidgetComposites(Composite pane1, Composite pane2) {
		super();
		this.pane1 = pane1;
		this.pane2 = pane2;
	}
	public Composite getPane1() {
		return pane1;
	}
	public void setPane1(Composite pane1) {
		this.pane1 = pane1;
	}
	public Composite getPane2() {
		return pane2;
	}
	public void setPane2(Composite pane2) {
		this.pane2 = pane2;
	}
	
	
}
