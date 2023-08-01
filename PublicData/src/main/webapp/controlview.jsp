<%@page import="java.util.ArrayList"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!
 public ArrayList<String> areacode;
    public String sigungucode;
    public String contentId;
    public String contentTypeId;
    public String addr1;
    public String addr2;
    public String zipcode;
    public String mapx;
    public String mapy;
    public String tel;
    public String title;
    public String homepage;
    public ArrayList<String> firstimage;
    public String firstimage2;
    public String overview;
%>
	<table border = "1">
		<tr>
			<th> 번호 </th>
			<th> 사진 </th>
		</tr>
<%
	try {
	URL url = new URL("https://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=Na8YvxJUFnMV0djoVGpk082H3KGsiopKZd3YhAPY6oqWK%2F7PJLfjjIsK%2Fsbe1W6QnPRaTmnzOaIAzITZEwfGBw%3D%3D&pageNo=1&numOfRows=5&MobileApp=AppTest&MobileOS=ETC&arrange=A&contentTypeId=32");
	InputStream stream = url.openStream();	
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc =dBuilder.parse(stream);
	doc.getDocumentElement().normalize(); 
	NodeList nList = doc.getElementsByTagName("item");
	areacode = new ArrayList<String>();
	firstimage = new ArrayList<String>();
		for(int temp = 0; temp < nList.getLength(); temp++) {
			Node nNode = nList.item(temp);
			Element eElement = (Element) nNode;
			NodeList nlList = eElement.getElementsByTagName("firstimage").item(0).getChildNodes();
//		out.println(nlList);
//		if(nlList != null){
			Node nValue = (Node) nlList.item(0);
	//	if(nValue != null) {
			firstimage.add(nValue.getNodeValue());
		//}
	//	System.out.println("fuck");
	//	areacode.add(nValue.getNodeValue());
			}
	//	 out.println(areacode.size());
	      out.println(firstimage.size()+"???");
		for (int i = 0; i < firstimage.size(); ++i) {
	%>
		<tr>
			<td> i </td>
	   		<td> <img src =<% out.println(firstimage.get(i));%>> </td>
	   	<tr>	
	<%
		}
		}catch(Exception e) {
			e.printStackTrace();
		}	
	%>   	
			
	</table>			
				
<!-- 	<script>
	const img = new Image();
	for (int i = 0; i < firstimage.size(); ++i) {
		const img[i] = new Image();
	 img[i].src = firstimage.get(i);}
	
	</script>
 -->
</body>
</html>