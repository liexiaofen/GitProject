/*******************************************************************************
*分页共通
********************************************************************************/
function pagination(page,action,formName,curPage,totalPage,isFirst,isLast){
	var isCount = true;
	var count = document.forms[formName].elements["totalRecord"].value;
	var length = document.forms[formName].elements["pageSize"].value;	
	var htmltext = "";
	htmltext +=  "&lt;&lt;";
	htmltext += "&nbsp;&nbsp;&lt;";	
	if (isCount) {
		htmltext += "<span class=\"span_page\">&nbsp;&nbsp;" + curPage + "/" + totalPage + "Page";
		htmltext += "&nbsp;&nbsp;"+ count + "Records" + "&nbsp;&nbsp;</span>";
	
	}
	htmltext += "&gt;";
	htmltext += "&nbsp;&nbsp;&gt;&gt;";	
	//alert(htmltext);
	htmltext += "&nbsp;&nbsp;<input type=\"text\" class=\"page\" id=\"pageno\" maxlength=\"9\" name=\"pageno\" size=2 value='"+curPage+"'>";
	htmltext += "&nbsp;"+"页"+"&nbsp;<input type=\"button\" class=\"btn\" value=\"go\" name=\"gopage\" onclick=\"\" \/>";
	document.write( htmltext );
} 