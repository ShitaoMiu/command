package command.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class DataUtil {
	
	//List to JsonArray
	  public JsonArray listToJsonArray(List<?> list, String voName) {
	        JsonArray jsonArray = new JsonArray();
	        Gson gson = new GsonBuilder().serializeNulls().create();
	        for (Object vo : list) {
	            JsonObject jsonObject = new JsonObject();
	            JsonElement element = gson.toJsonTree(vo);
	            if (element.isJsonObject()) {
	                jsonObject.add(voName, element.getAsJsonObject());
	            } else if (element.isJsonArray()) {
	                jsonObject.add(voName, element.getAsJsonArray());
	            } else {
	                jsonObject.add(voName, element);
	            }
	            jsonArray.add(jsonObject);
	        }
	        return jsonArray;
	    }
	  
	  // List 널 체크 
	  public List<?> nullCheckList(List<?> list)
	  {
		  Optional<List> opList = Optional.ofNullable(list);
		  if(opList.isPresent()) 
		  {
			  return opList.get();
		  }else 
		  {
			  return list =  new ArrayList();
		  }
	  }
	  
	 
	  
	  
}
