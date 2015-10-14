var restUrl="http://localhost:8081/stockwatch/resources/";

function callCURRENCY_PRICE() {
	var baseElementName = 'CURRENCY_PRICE';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callGRAPH_NAME() {
	var baseElementName = 'GRAPH_NAME';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callGRAPH_XY() {
	var baseElementName = 'GRAPH_XY';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callHOURLY_PL_TEN() {
	var baseElementName = 'HOURLY_PL_TEN';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callNAME_MAPPING() {
	var baseElementName = 'NAME_MAPPING';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callOCCURENCE() {
	var baseElementName = 'OCCURENCE';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callPIP_SPREAD() {
	var baseElementName = 'PIP_SPREAD';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callSTOCK_PRICE() {
	var baseElementName = 'STOCK_PRICE';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callSW_TABLE() {
	var baseElementName = 'SW_TABLE';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callSW_TABLE_NAME() {
	var baseElementName = 'SW_TABLE_NAME';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}
function callTEST_OUT() {
	var baseElementName = 'TEST_OUT';
 	var xmlLib = new SoftXMLLib();
	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//" + baseElementName);
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			//to get current node attribute's value use
			//childs[i].attributes[0].attributename
			//attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}
}


function GRAPH_XY(ID,GRAPH_ID,X_AXIS_VALUE,Y_AXIS_VALUE,CREATED,X_AXIS) {
	this.ID=ID;
	this.GRAPH_ID=GRAPH_ID;
	this.X_AXIS_VALUE=X_AXIS_VALUE;
	this.Y_AXIS_VALUE=Y_AXIS_VALUE;
	this.CREATED=CREATED;
	this.X_AXIS=X_AXIS;
}

function TEST_OUT(VAL,MESSAGE) {
	this.VAL=VAL;
	this.MESSAGE=MESSAGE;
}

function PIP_SPREAD(ID,PERIOD,CROSS_CURRENCY,DIFF) {
	this.ID=ID;
	this.PERIOD=PERIOD;
	this.CROSS_CURRENCY=CROSS_CURRENCY;
	this.DIFF=DIFF;
}

function NAME_MAPPING(ID,TABLE_NAME,REST_NAME,ID,TABLE_NAME,REST_NAME) {
	this.ID=ID;
	this.TABLE_NAME=TABLE_NAME;
	this.REST_NAME=REST_NAME;
	this.ID=ID;
	this.TABLE_NAME=TABLE_NAME;
	this.REST_NAME=REST_NAME;
}

function SW_TABLE_NAME(TABLE_NAME,COLUMN_NAME,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH) {
	this.TABLE_NAME=TABLE_NAME;
	this.COLUMN_NAME=COLUMN_NAME;
	this.DATA_TYPE=DATA_TYPE;
	this.CHARACTER_MAXIMUM_LENGTH=CHARACTER_MAXIMUM_LENGTH;
}

function OCCURENCE(ID,CROSS_CURRENCY,PERIOD_ROLL_COUNT,FREQUENCY,DOLLAR_UP,HAPPENED,UP_PROB_NEXT,DOWN_PROB_NEXT,ACTIVE,PREV_ACTIVE,PERIOD,CROSS_PRICE) {
	this.ID=ID;
	this.CROSS_CURRENCY=CROSS_CURRENCY;
	this.PERIOD_ROLL_COUNT=PERIOD_ROLL_COUNT;
	this.FREQUENCY=FREQUENCY;
	this.DOLLAR_UP=DOLLAR_UP;
	this.HAPPENED=HAPPENED;
	this.UP_PROB_NEXT=UP_PROB_NEXT;
	this.DOWN_PROB_NEXT=DOWN_PROB_NEXT;
	this.ACTIVE=ACTIVE;
	this.PREV_ACTIVE=PREV_ACTIVE;
	this.PERIOD=PERIOD;
	this.CROSS_PRICE=CROSS_PRICE;
}

function CURRENCY_PRICE(ID,READ_COUNT,USD_VALUE,CROSS_VALUE,CROSS_NAME,CREATED) {
	this.ID=ID;
	this.READ_COUNT=READ_COUNT;
	this.USD_VALUE=USD_VALUE;
	this.CROSS_VALUE=CROSS_VALUE;
	this.CROSS_NAME=CROSS_NAME;
	this.CREATED=CREATED;
}

function GRAPH_NAME(ID,NAME,X_AXIS,Y_AXIS,CREATED,ID,NAME,X_AXIS,Y_AXIS,CREATED) {
	this.ID=ID;
	this.NAME=NAME;
	this.X_AXIS=X_AXIS;
	this.Y_AXIS=Y_AXIS;
	this.CREATED=CREATED;
	this.ID=ID;
	this.NAME=NAME;
	this.X_AXIS=X_AXIS;
	this.Y_AXIS=Y_AXIS;
	this.CREATED=CREATED;
}

function SW_TABLE(TABLE_NAME) {
	this.TABLE_NAME=TABLE_NAME;
}

function HOURLY_PL_TEN(CREATED,INFO) {
	this.CREATED=CREATED;
	this.INFO=INFO;
}

function STOCK_PRICE(ID,READ_COUNT,USD_PRICE,CREATED) {
	this.ID=ID;
	this.READ_COUNT=READ_COUNT;
	this.USD_PRICE=USD_PRICE;
	this.CREATED=CREATED;
}


var xmlLib = new SoftXMLLib();

xmlLib.loadXML(xmlString);

if(xmlLib.loadXMLError!=0){
	alert("XML file is not valid!");}
else{
	childs = xmlLib.selectNodes("//jobSchedules");
	for(i=0;i<childs.length;i++){
		alert(childs[i].innerText);
		//to get current node attribute's value use
		//childs[i].attributes[0].attributename
		//attribute name must be in lowercase
		alert(childs[i].attributes[0].city);
	}
}








// JScript source code
var ajaxObjSoftXML=null;
var xmlDOMObjSoftXML=null;



function createAjaxObject(){
	if(window.XMLHttpRequest){
		try{
			ajaxObjSoftXML = new XMLHttpRequest(); 
				
		}
		catch(e){
			alert("Problem creating AJAX!");
		}
		
	}
	else{
		try{
			ajaxObjSoftXML = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch(e){
			alert("Problem creating AJAX!");
		}	
	}
	return ajaxObjSoftXML;
}

window.onerror = errorHandler;

function errorHandler(message, url, line)
	{
		alert("Error loading file!" + "\n" + message + "=" + line);
	    return true;
	}

var docSoftXML;
function load(xmlfile){
	if (document.implementation && document.implementation.createDocument)
		{
			xmlDOMObjSoftXML = document.implementation.createDocument("", "", null);
			xmlDOMObjSoftXML.async=false;
		}
		else if (window.ActiveXObject)
		{
			xmlDOMObjSoftXML = new ActiveXObject("Microsoft.XMLDOM");
			xmlDOMObjSoftXML.async=false;
			xmlDOMObjSoftXML.setProperty ("SelectionLanguage", "XPath");
		}
		else
		{
			alert('Your browser can\'t handle this script');
			return;
		}
		
		lSoftXML=xmlDOMObjSoftXML.load(xmlfile);
		if(!lSoftXML){
			this.loadError = 1;
		}
		else{
			SoftXMLLib.prototype.documentElement = xmlDOMObjSoftXML.documentElement;
		}
		
		
		
}

function getDocXML(){
	try{
		var serializer = new XMLSerializer();
		var xmlstring = serializer.serializeToString(this.documentElement);
	}
	catch(e){
		var xmlstring = this.documentElement.xml;
	};	
	return xmlstring;

}

function loadXML(xmlString){
	var moz = (typeof document.implementation != 'undefined') && (typeof document.implementation.createDocument != 'undefined') && !document.implementation.hasFeature('LS', '3.0') ;
	var xmlDomOpera = ((document.implementation) && (document.implementation.createDocument) && document.implementation.hasFeature('LS', '3.0')?true:false);
	var xmlDom = (moz || xmlDomOpera?document.implementation.createDocument("", "doc", null):new ActiveXObject("MSXML2.DOMDocument.3.0"));
	
	if(xmlDomOpera){
		xmlDom = document.implementation.createLSParser(1,null);
	}
	
	if(moz  || xmlDomOpera){
		    var parser = new DOMParser();
			xmlDom = parser.parseFromString(xmlString, "text/xml");
			if(xmlDom.documentElement.nodeName=="parsererror"){
				this.loadXMLError = 1;
			}	
			
			
		}
		
		else{
			xmlDom.async=false;
			xmlDom.setProperty ("SelectionLanguage", "XPath");
			lSoftXML = xmlDom.loadXML(xmlString);
			if(!lSoftXML){
				this.loadXMLError = 1;
			}
			
			
		}
		SoftXMLLib.prototype.DOM = xmlDom;
		SoftXMLLib.prototype.documentElement = xmlDom.documentElement;
	
	
		
		
		
}

var prefSoftXML,namespacesSoftXML;
function NSResolver(prefix) {
	if(prefix == prefSoftXML) {
		return namespacesSoftXML;
	}
	else {
		return null;
	}
}



function selectNodes(xpath){
		var selectedNodes = new Array();
		docSoftXML = this.documentElement;
		if(docSoftXML==null){
			alert("Error loading file!");
			return;
		}
		prefSoftXML = this.prefix;
		namespacesSoftXML = this.nameSpace;
		if(document.all){
		    
			var cxpath = new String(xpath).toLowerCase();
			f = docSoftXML.selectNodes(xpath);
			for(var i=0;i<f.length;i++){
				var elemattr="";
				if(f[i].nodeType=="1"){
					var curAttributes = f[i].attributes;
					if(curAttributes.length>0){
						for(y=0;y<curAttributes.length;y++){
							if(y<curAttributes.length-1){
								var dt=",";
							}
							else{
								var dt="";
							}
							elemattr+=curAttributes[y].name + ":\"" + curAttributes[y].text + "\"" + dt;
						}
					}
				}
				else{
						if(i<f.length-f.length){
							var dts=",";
						}
						else{
							var dts="";
						}
								
							elemattr+=f[i].name + ":\"" + f[i].text + "\"" + dts;
				}		
				
				var t = eval("[{" + elemattr + "}]");
				if(f[i].nodeType=="1"){
					if(f[i].parentNode.nodeName == this.documentElement.nodeName){
						
						this.self = f[i];
					}
					else{
						this.self = f[i].parentNode;
					}
				}
				else{
					this.self = f[i];
				}
				selectedNodes[selectedNodes.length] = {innerText:f[i].text,attributes:t,self:this.self,object:f[i].childNodes(0),objectN:f[i]};
			}
			return selectedNodes;
		}
		else{
			if(navigator.userAgent.indexOf("Firefox")!=-1 || navigator.userAgent.indexOf("SeaMonkey")!=-1 || navigator.userAgent.indexOf("Netscape")!=-1){
					var xpe = new XPathEvaluator();
					var nsResolver = xpe.createNSResolver(docSoftXML.ownerDocument.documentElement==null ? docSoftXML.documentElement : docSoftXML.ownerDocument.documentElement);
					var headings = xpe.evaluate(xpath, docSoftXML, NSResolver, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
			        
			}
			else{
			        
					var headings = document.evaluate(xpath, docSoftXML, null, XPathResult.ANY_TYPE,null);
			}
			try{
				
				var thisHeading = headings.iterateNext();
				while (thisHeading) {
				    var elemattr="";
					var curAttributes = thisHeading.attributes;
					if(curAttributes.length>0){
						for(var i=0;i<curAttributes.length;i++){
							if(i<curAttributes.length-1){
								var dt=",";
							}
							else{
								var dt="";
							}
							elemattr+=thisHeading.attributes[i].nodeName + ":\"" + thisHeading.attributes[i].nodeValue + "\"" + dt;
						}
					}	
					var t = eval("[{" + elemattr + "}]");
					if(thisHeading.parentNode.nodeName == this.documentElement.nodeName){
						
						this.self = thisHeading;
					}
					else{
						this.self = thisHeading.parentNode;
					}
					selectedNodes[selectedNodes.length] = {innerText:thisHeading.childNodes[0].nodeValue,attributes:t,self:this.self,object:f[i].childNodes(0),objectN:f[i]};
					thisHeading = headings.iterateNext();
				}
			}
			catch(e){
				
				for(var y=0;y<headings.snapshotLength;y++){
					var elemattr="";
					if(headings.snapshotItem(y).attributes){
						var curAttributes = headings.snapshotItem(y).attributes;
						if(curAttributes.length>0){
							for(var i=0;i<curAttributes.length;i++){
								var curattrval = new String(headings.snapshotItem(y).attributes[i].nodeName);
								curattrval = curattrval.replace("xmlns:","");
								if(i<curAttributes.length-1){
									var dt=",";
								}
								else{
									var dt="";
								}
								
									elemattr+=curattrval + ":\"" + headings.snapshotItem(y).attributes[i].nodeValue + "\"" + dt;
							}
						}
						
					}	
					var t = eval("[{" + elemattr + "}]");
					
					if(headings.snapshotItem(y).nodeType=="1"){
						if(headings.snapshotItem(y).parentNode.nodeName == this.documentElement.nodeName){
							
							this.self = headings.snapshotItem(y);
						}
						else{
							this.self = headings.snapshotItem(y).parentNode;
						}
					}
					else{
							this.self = headings.snapshotItem(y);
					}	
					selectedNodes[selectedNodes.length] = {innerText:headings.snapshotItem(y).textContent,attributes:t,self:this.self,object:headings.snapshotItem(y).childNodes[0],objectN:headings.snapshotItem(y)};
				}
			}	
			return selectedNodes;
		}	
	;
}


function Decode(str){
	var decoded = "";
	var curStr = new String(str);
	var spl = curStr.split(",");
	
	for(var i=0;i<spl.length;i++){
		decoded+=String.fromCharCode(spl[i])
	}
	return decoded;
}


function Encode(str){
	var encoded = "";
	var curStr = new String(str);
	for(var i=0;i<curStr.length;i++){
		if(i<curStr.length-1){
			var dt=",";
		}
		else{
			var dt="";
		}
		encoded+=curStr.charCodeAt(i) + dt;
	}
	return encoded;
}

var docAttributes = new Array();
var docAllAttributes = new Array();

var srtout = new Array();
var srtout1 = new Array();

function getAllAttributes(obj){
	
	for(var i=0;i<obj.childNodes.length;i++){
		if(obj.childNodes[i].attributes){
			var curElem = obj.childNodes[i].attributes;
			for(var j=0;j<curElem.length;j++){
				docAttributes[docAttributes.length] = {nodeName:curElem[j].nodeName,nodeValue:curElem[j].nodeValue};
			}
		}
		getAllAttributes(obj.childNodes[i]);
	}
	return docAttributes;
}

function getAttributes(obj){
	for(var i=0;i<obj.childNodes.length;i++){
		if(obj.childNodes[i].attributes){
			var curElem = obj.childNodes[i].attributes;
			for(var j=0;j<curElem.length;j++){
				docAllAttributes[docAllAttributes.length] = {nodeName:curElem[j].nodeName,nodeValue:curElem[j].nodeValue};
			}
		}
		getAttributes(obj.childNodes[i]);
	}
	
}



function getUniqueAttributes(){
	srtout.length=0;
	getAllAttributes(this.documentElement);
	docAttributes.sort(sortOut);
	var curNode = "";
	for(var y=0;y<docAttributes.length;y++){
		if(curNode!=docAttributes[y].nodeName){
			srtout[srtout.length] = {nodeName:docAttributes[y].nodeName};
		}
		curNode = docAttributes[y].nodeName;
	}
	return srtout;
}

function getDocAttributes(){
	docAttributes.length=0;
	return getAllAttributes(this.documentElement);
}


var docElements = new Array();
function getAllDocElements(obj){
	for(var i=0;i<obj.childNodes.length;i++){
		if(obj.childNodes[i].nodeName!="#text"){
			if(obj.childNodes[i].childNodes.length=="1"){
				docElements[docElements.length] = {nodeName:obj.childNodes[i].nodeName,nodeValue:(!window.ActiveXObject)?obj.childNodes[i].textContent:obj.childNodes[i].text};
			}
			else{
				docElements[docElements.length] = {nodeName:obj.childNodes[i].nodeName,nodeValue:obj.childNodes[i].nodeValue};	
			}
		}
		getAllDocElements(obj.childNodes[i]);
	}
	return docElements;
}

var stroutelem = new Array();
function getDocElements(){
	docElements.length=0;
	return getAllDocElements(this.documentElement);
}

var stroutuniquelem = new Array();
function getUniqueElements(){
	stroutuniquelem.length=0;
	getAllDocElements(this.documentElement);
	docElements.sort(sortOut);
	var curNode = "";
	for(var y=0;y<docElements.length;y++){
		if(curNode!=docElements[y].nodeName){
			stroutuniquelem[stroutuniquelem.length] = {nodeName:docElements[y].nodeName};
		}
		curNode = docElements[y].nodeName;
	}
	return stroutuniquelem;
}


function sortOut(a,b){
	if(a.nodeName<b.nodeName) return -1;
	if(a.nodeName>b.nodeName) return 1;
	return 0;
}


function setPrefix(obj){
	this.prefix = obj;
	
}

function setNameSpace(obj){
	this.nameSpace = obj;
	
}

function SoftXMLLib(){
	this.createAjaxObject = createAjaxObject;
	this.loadXMLError = 0;
	this.loadError = 0;
	this.load = load;
	this.selectNodes = selectNodes;
	this.loadXML = loadXML;
	this.self = null;
	this.Decode = Decode;
	this.Encode = Encode;
	this.getAllAttributes = getAllAttributes;
	this.getUniqueAttributes = getUniqueAttributes;
	this.getAttributes = getAttributes;
	this.getDocAttributes = getDocAttributes;
	this.getDocElements = getDocElements;
	this.getUniqueElements = getUniqueElements;
	this.setPrefix = setPrefix;
	this.prefix = null;
	this.nameSpace = null;
	this.setNameSpace = setNameSpace;
	this.getDocXML = getDocXML;
}
