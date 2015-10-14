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
 * A <code>XmlReader</code> implementation that reads XML data using a
 * <code>ModelType</code> definition and returns a paging list load result
 * instance.
 * 
 * @param <D> the type of list load result being returned by the reader
 */
public class XmlPagingLoadResultReader<D extends PagingLoadResult<? extends ModelData>> extends XmlLoadResultReader<D> {
  /**
   * Creates a new reader.
   * 
   * @param modelType the model type definition
   */
  public XmlPagingLoadResultReader(ModelType modelType) {
    super(modelType);
  }

  @Override
  protected BasePagingLoadResult<ModelData> newLoadResult(Object loadConfig, List<ModelData> models) {
    return new BasePagingLoadResult<ModelData>(models);
  }

}
