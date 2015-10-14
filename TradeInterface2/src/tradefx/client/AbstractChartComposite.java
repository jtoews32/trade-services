package tradefx.client;

import com.extjs.gxt.ui.client.widget.Composite;
import com.extjs.gxt.ui.client.widget.ContentPanel;
import com.extjs.gxt.ui.client.widget.HorizontalPanel;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.VerticalPanel;
import com.google.gwt.user.client.ui.RootPanel;

public abstract class AbstractChartComposite extends Composite {
	
	protected RootPanel rootPanel;
	protected ContentPanel contentPanel;
	
	protected ContentPanel usdEurPieChartContentPanel;
	protected ContentPanel usdAudPieChartContentPanel;
	protected ContentPanel usdCadPieChartContentPanel;
	protected ContentPanel usdGbpPieChartContentPanel;
	protected ContentPanel usdJpyPieChartContentPanel;
	protected ContentPanel usdChfPieChartContentPanel;
			
	protected ContentPanel usdEurBarChartContentPanel;
	protected ContentPanel usdAudBarChartContentPanel;
	protected ContentPanel usdCadBarChartContentPanel;
	protected ContentPanel usdGbpBarChartContentPanel;
	protected ContentPanel usdJpyBarChartContentPanel;
	protected ContentPanel usdChfBarChartContentPanel;
			
	protected VerticalPanel lhsVerticalPanel;
	protected LayoutContainer rhsLayoutContainer;
	protected HorizontalPanel bottomHorizontalPanel;
	
	public abstract void createLhsVerticalPanel();
	public abstract void createRhsLayoutContainer();
	public abstract void createBottomHorizontalPanel();

	public AbstractChartComposite(RootPanel rootPanel) {
		this.rootPanel = rootPanel;
	}
	
	@Deprecated
	protected void load() {
		rootPanel.add(this);
	}
	
	protected void refreshUI() {
		contentPanel.layout();
	}
	
	/**
	 * @return the rootPanel
	 */
	protected RootPanel getRootPanel() {
		return rootPanel;
	}
	/**
	 * @param rootPanel the rootPanel to set
	 */
	protected void setRootPanel(RootPanel rootPanel) {
		this.rootPanel = rootPanel;
	}
	/**
	 * @return the usdEurPieChartContentPanel
	 */
	protected ContentPanel getUsdEurPieChartContentPanel() {
		return usdEurPieChartContentPanel;
	}
	/**
	 * @param usdEurPieChartContentPanel the usdEurPieChartContentPanel to set
	 */
	protected void setUsdEurPieChartContentPanel(
			ContentPanel usdEurPieChartContentPanel) {
		this.usdEurPieChartContentPanel = usdEurPieChartContentPanel;
	}
	/**
	 * @return the usdAudPieChartContentPanel
	 */
	protected ContentPanel getUsdAudPieChartContentPanel() {
		return usdAudPieChartContentPanel;
	}
	/**
	 * @param usdAudPieChartContentPanel the usdAudPieChartContentPanel to set
	 */
	protected void setUsdAudPieChartContentPanel(
			ContentPanel usdAudPieChartContentPanel) {
		this.usdAudPieChartContentPanel = usdAudPieChartContentPanel;
	}
	/**
	 * @return the usdCadPieChartContentPanel
	 */
	protected ContentPanel getUsdCadPieChartContentPanel() {
		return usdCadPieChartContentPanel;
	}
	/**
	 * @param usdCadPieChartContentPanel the usdCadPieChartContentPanel to set
	 */
	protected void setUsdCadPieChartContentPanel(
			ContentPanel usdCadPieChartContentPanel) {
		this.usdCadPieChartContentPanel = usdCadPieChartContentPanel;
	}
	/**
	 * @return the usdGbpPieChartContentPanel
	 */
	protected ContentPanel getUsdGbpPieChartContentPanel() {
		return usdGbpPieChartContentPanel;
	}
	/**
	 * @param usdGbpPieChartContentPanel the usdGbpPieChartContentPanel to set
	 */
	protected void setUsdGbpPieChartContentPanel(
			ContentPanel usdGbpPieChartContentPanel) {
		this.usdGbpPieChartContentPanel = usdGbpPieChartContentPanel;
	}
	/**
	 * @return the usdJpyPieChartContentPanel
	 */
	protected ContentPanel getUsdJpyPieChartContentPanel() {
		return usdJpyPieChartContentPanel;
	}
	/**
	 * @param usdJpyPieChartContentPanel the usdJpyPieChartContentPanel to set
	 */
	protected void setUsdJpyPieChartContentPanel(
			ContentPanel usdJpyPieChartContentPanel) {
		this.usdJpyPieChartContentPanel = usdJpyPieChartContentPanel;
	}
	/**
	 * @return the usdChfPieChartContentPanel
	 */
	protected ContentPanel getUsdChfPieChartContentPanel() {
		return usdChfPieChartContentPanel;
	}
	/**
	 * @param usdChfPieChartContentPanel the usdChfPieChartContentPanel to set
	 */
	protected void setUsdChfPieChartContentPanel(
			ContentPanel usdChfPieChartContentPanel) {
		this.usdChfPieChartContentPanel = usdChfPieChartContentPanel;
	}
	/**
	 * @return the usdEurBarChartContentPanel
	 */
	protected ContentPanel getUsdEurBarChartContentPanel() {
		return usdEurBarChartContentPanel;
	}
	/**
	 * @param usdEurBarChartContentPanel the usdEurBarChartContentPanel to set
	 */
	protected void setUsdEurBarChartContentPanel(
			ContentPanel usdEurBarChartContentPanel) {
		this.usdEurBarChartContentPanel = usdEurBarChartContentPanel;
	}
	/**
	 * @return the usdAudBarChartContentPanel
	 */
	protected ContentPanel getUsdAudBarChartContentPanel() {
		return usdAudBarChartContentPanel;
	}
	/**
	 * @param usdAudBarChartContentPanel the usdAudBarChartContentPanel to set
	 */
	protected void setUsdAudBarChartContentPanel(
			ContentPanel usdAudBarChartContentPanel) {
		this.usdAudBarChartContentPanel = usdAudBarChartContentPanel;
	}
	/**
	 * @return the usdCadBarChartContentPanel
	 */
	protected ContentPanel getUsdCadBarChartContentPanel() {
		return usdCadBarChartContentPanel;
	}
	/**
	 * @param usdCadBarChartContentPanel the usdCadBarChartContentPanel to set
	 */
	protected void setUsdCadBarChartContentPanel(
			ContentPanel usdCadBarChartContentPanel) {
		this.usdCadBarChartContentPanel = usdCadBarChartContentPanel;
	}
	/**
	 * @return the usdGbpBarChartContentPanel
	 */
	protected ContentPanel getUsdGbpBarChartContentPanel() {
		return usdGbpBarChartContentPanel;
	}
	/**
	 * @param usdGbpBarChartContentPanel the usdGbpBarChartContentPanel to set
	 */
	protected void setUsdGbpBarChartContentPanel(
			ContentPanel usdGbpBarChartContentPanel) {
		this.usdGbpBarChartContentPanel = usdGbpBarChartContentPanel;
	}
	/**
	 * @return the usdJpyBarChartContentPanel
	 */
	protected ContentPanel getUsdJpyBarChartContentPanel() {
		return usdJpyBarChartContentPanel;
	}
	/**
	 * @param usdJpyBarChartContentPanel the usdJpyBarChartContentPanel to set
	 */
	protected void setUsdJpyBarChartContentPanel(
			ContentPanel usdJpyBarChartContentPanel) {
		this.usdJpyBarChartContentPanel = usdJpyBarChartContentPanel;
	}
	/**
	 * @return the usdChfBarChartContentPanel
	 */
	protected ContentPanel getUsdChfBarChartContentPanel() {
		return usdChfBarChartContentPanel;
	}
	/**
	 * @param usdChfBarChartContentPanel the usdChfBarChartContentPanel to set
	 */
	protected void setUsdChfBarChartContentPanel(
			ContentPanel usdChfBarChartContentPanel) {
		this.usdChfBarChartContentPanel = usdChfBarChartContentPanel;
	}
	/**
	 * @return the lhsVerticalPanel
	 */
	protected VerticalPanel getLhsVerticalPanel() {
		return lhsVerticalPanel;
	}
	/**
	 * @param lhsVerticalPanel the lhsVerticalPanel to set
	 */
	protected void setLhsVerticalPanel(VerticalPanel lhsVerticalPanel) {
		this.lhsVerticalPanel = lhsVerticalPanel;
	}
	/**
	 * @return the rhsLayoutContainer
	 */
	protected LayoutContainer getRhsLayoutContainer() {
		return rhsLayoutContainer;
	}
	/**
	 * @param rhsLayoutContainer the rhsLayoutContainer to set
	 */
	protected void setRhsLayoutContainer(LayoutContainer rhsLayoutContainer) {
		this.rhsLayoutContainer = rhsLayoutContainer;
	}
	/**
	 * @return the bottomHorizontalPanel
	 */
	protected HorizontalPanel getBottomHorizontalPanel() {
		return bottomHorizontalPanel;
	}
	/**
	 * @param bottomHorizontalPanel the bottomHorizontalPanel to set
	 */
	protected void setBottomHorizontalPanel(HorizontalPanel bottomHorizontalPanel) {
		this.bottomHorizontalPanel = bottomHorizontalPanel;
	}
	
	
}
