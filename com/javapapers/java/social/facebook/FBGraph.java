package com.javapapers.java.social.facebook;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

public class FBGraph {
	private final String accessToken;

	public FBGraph(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getFBGraph() {
		String graph = null;
		try {

			String g = "https://graph.facebook.com/me?" + accessToken;
			URL u = new URL(g);
			URLConnection c = u.openConnection();
                        StringBuffer b;
                    try (BufferedReader in = new BufferedReader(new InputStreamReader(
                            c.getInputStream()))) {
                        String inputLine;
                        b = new StringBuffer();
                        while ((inputLine = in.readLine()) != null)
                            b.append(inputLine).append("\n");
                    }
			graph = b.toString();
			System.out.println(graph);
		} catch (IOException e) {
			throw new RuntimeException("ERROR in getting FB graph data. " + e);
		}
		return graph;
	}

	public Map getGraphData(String fbGraph) {
		Map fbProfile = new HashMap();
		try {
			JSONObject json = new JSONObject(fbGraph);
			fbProfile.put("id", json.getString("id"));
			fbProfile.put("first_name", json.getString("first_name"));
			if (json.has("email"))
				fbProfile.put("email", json.getString("email"));
			if (json.has("gender"))
				fbProfile.put("gender", json.getString("gender"));
		} catch (JSONException e) {
			throw new RuntimeException("ERROR in parsing FB graph data. " + e);
		}
		return fbProfile;
	}
}