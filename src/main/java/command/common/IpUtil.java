package command.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.Gson;

import command.vo.SecurityBanIpVo;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
public class IpUtil {
	
	
	
	
	
	public SecurityBanIpVo  getIpInfo(SecurityBanIpVo securityBanIpVo) {
		HashMap<String, String> resultMap =null;
			try {
					Gson gson = new Gson();
					String ipAddress = securityBanIpVo.getBanIp();
					String apiKey = "85b66fdb6136e6";
					String url = "http://ipinfo.io/" + ipAddress + "?token=" + apiKey;
					URL apiURL = new URL(url);
					HttpURLConnection connection = (HttpURLConnection) apiURL.openConnection();
					connection.setRequestMethod("GET");
					
					int responseCode = connection.getResponseCode();
					if (responseCode == HttpURLConnection.HTTP_OK) {
						BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
						String line;
						StringBuilder response = new StringBuilder();

						while ((line = reader.readLine()) != null) {
 							response.append(line);
						}
						reader.close();
						String result = response.toString();
				        Type type = new TypeToken<HashMap<String, String>>() {}.getType();
				        resultMap = gson.fromJson(result, type);
				        securityBanIpVo.setCity(resultMap.get("city"));
						securityBanIpVo.setCountry(resultMap.get("country"));
						securityBanIpVo.setLoc(resultMap.get("loc"));
						securityBanIpVo.setOrg(resultMap.get("org"));
						securityBanIpVo.setTimezone(resultMap.get("timezone"));
						securityBanIpVo.setRegion(resultMap.get("region"));
						securityBanIpVo.setPostal(resultMap.get("postal"));
						
						
						// 여기에서 필요한 정보를 추출하여 사용합니다.
					} else {
						System.out.println("API 호출에 실패했습니다. 응답 코드: " + responseCode);
					}

					connection.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			return securityBanIpVo;
			
			
	}

}
