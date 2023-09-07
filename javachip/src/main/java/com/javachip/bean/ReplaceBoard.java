package com.javachip.bean;

public class ReplaceBoard {
	
	public String toReplace(String str) {
		
		if(str == null) {
			return null;
		}
	
		String returnStr = str;
		
		// \n
		returnStr = returnStr.replaceAll("<br>", "\n");
		// <p>
		returnStr = returnStr.replaceAll("&lt;p", "<p");
		
		returnStr = returnStr.replaceAll("&lt;/p&gt;", "</p>");
		// <b>
		returnStr = returnStr.replaceAll("&lt;b", "<b");
		
		returnStr = returnStr.replaceAll("&lt;/b&gt;", "</b>");
		// <a>
		returnStr = returnStr.replaceAll("&lt;a", "<a");
		
		returnStr = returnStr.replaceAll("&lt;/a&gt;", "</a>");
		// <i>
		returnStr = returnStr.replaceAll("&lt;i", "<i");
		
		returnStr = returnStr.replaceAll("&lt;/i&gt;", "</i>");
		// <u>
		returnStr = returnStr.replaceAll("&lt;u", "<u");
		
		returnStr = returnStr.replaceAll("&lt;/u&gt;", "</u>");
		// <tbody>
		returnStr = returnStr.replaceAll("&lt;tbody", "<tbody");
		
		returnStr = returnStr.replaceAll("&lt;/tbody&gt;", "</tbody>");
		
		// <thead>
		returnStr = returnStr.replaceAll("&lt;thead", "<thead");
		
		returnStr = returnStr.replaceAll("&lt;/thead&gt;", "</thead>");
		// <tr>
		returnStr = returnStr.replaceAll("&lt;tr", "<tr");
		
		returnStr = returnStr.replaceAll("&lt;/tr&gt;", "</tr>");
		// <td>
		returnStr = returnStr.replaceAll("&lt;td", "<td");
		
		returnStr = returnStr.replaceAll("&lt;/td&gt;", "</td>");
		
		// <strike>
		returnStr = returnStr.replaceAll("&lt;strike", "<strike");
		
		returnStr = returnStr.replaceAll("&lt;/strike&gt;", "</strike");
		
		// <span>
		returnStr = returnStr.replaceAll("&lt;span", "<span");
		
		returnStr = returnStr.replaceAll("&lt;/span&gt;", "</span");
		
		// <sup>
		returnStr = returnStr.replaceAll("&lt;sup", "<sup");
		
		returnStr = returnStr.replaceAll("&lt;/sup&gt;", "</sup");
		
		// <sub>
		returnStr = returnStr.replaceAll("&lt;sub", "<sub");
		
		returnStr = returnStr.replaceAll("&lt;/sub&gt;", "</sub");
		
		// <li>
		returnStr = returnStr.replaceAll("&lt;li", "<li");
		
		returnStr = returnStr.replaceAll("&lt;/li&gt;", "</li");
		
		// <ul>
		returnStr = returnStr.replaceAll("&lt;ul", "<ul");
		
		returnStr = returnStr.replaceAll("&lt;/ul&gt;", "</ul");
		
		// <ol>
		returnStr = returnStr.replaceAll("&lt;ol", "<ol");
		
		returnStr = returnStr.replaceAll("&lt;/ol&gt;", "ol");
		
		// <div>
		returnStr = returnStr.replaceAll("&lt;div", "<div");
		
		returnStr = returnStr.replaceAll("&lt;/div&gt;", "div");
		
		// <blockquote >
		returnStr = returnStr.replaceAll("&lt;blockquote ", "<blockquote ");
		
		returnStr = returnStr.replaceAll("&lt;/blockquote &gt;", "blockquote ");
		
		
		// > :: 마지막에 넣어야 남은 > 변경됌
		returnStr = returnStr.replaceAll("&gt;", ">");
	
	
		returnStr = returnStr.replaceAll("&quot;", "");
	
		returnStr = returnStr.replaceAll("&nbsp;", " ");
	
		returnStr = returnStr.replaceAll("&amp;", "&");
	
		return returnStr;
	
	}

}
