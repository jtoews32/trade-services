/*
 * Ext GWT - Ext for GWT
 * Copyright(c) 2007-2009, Ext JS, LLC.
 * licensing@extjs.com
 * 
 * http://extjs.com/license
 */
package com.extjs.gxt.ui.client.data;

import java.util.List;

/**
 * A <code>JsonReader</code> implementation that reads JSON data using a
 * <code>ModelType</code> definition and returns a paging list load result.
 * 
 * @param <D> the <code>ListLoadResult</code> type being returned by the reader
 */
public class JsonPagingLoadResultReader<D> extends JsonLoadResultReader<D> {

  /**
   * Creates a new reader.
   * 
   * @param modelType the model type definition
   */
  public JsonPagingLoadResultReader(ModelType modelType) {
    super(modelType);
  }

  @Override
  protected BasePagingLoadResult<ModelData> newLoadResult(Object loadConfig, List<ModelData> models) {
    return new BasePagingLoadResult<ModelData>(models);
  }
}
