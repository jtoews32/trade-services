package tradefx.client.model;

import com.extjs.gxt.ui.client.data.BaseModelData;

public class GalleryChartModel extends BaseModelData {

  protected GalleryChartModel() {

  }

  public GalleryChartModel(String name, String path,ChartModelExample example) {
    setName(name);
    setPath(path);
    setExample(example);
  }

  public void setName(String name) {
    set("name", name);
  }

  public void setPath(String path) {
    set("path", path);
  }

  public void setExample(ChartModelExample example) {
    set("example", example);
  }

  public String getName() {
    return get("name");
  }

  public String getPath() {
    return get("path");
  }

  public ChartModelExample getExample() {
    return get("example");
  }
}
