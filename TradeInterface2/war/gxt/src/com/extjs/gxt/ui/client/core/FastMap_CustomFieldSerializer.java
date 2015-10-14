package com.extjs.gxt.ui.client.core;

import java.util.Map.Entry;

import com.google.gwt.user.client.rpc.SerializationException;
import com.google.gwt.user.client.rpc.SerializationStreamReader;
import com.google.gwt.user.client.rpc.SerializationStreamWriter;

public class FastMap_CustomFieldSerializer {
  public static void deserialize(SerializationStreamReader streamReader, FastMap<Object> instance)
      throws SerializationException {
    int size = streamReader.readInt();

    for (int i = 0; i < size; ++i) {
      String key = streamReader.readString();
      Object value = streamReader.readObject();

      instance.put(key, value);
    }
  }

  public static void serialize(SerializationStreamWriter streamWriter, FastMap<Object> instance)
      throws SerializationException {
    int size = instance.size();
    streamWriter.writeInt(size);

    for (Entry<String, Object> entry : instance.entrySet()) {
      streamWriter.writeString(entry.getKey());
      streamWriter.writeObject(entry.getValue());
    }
  }
}
