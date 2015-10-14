var xmlDoc;

function jobSchedule(id, 
			mid, 
			rowId, 
			controlNextRun, 
			controlEffDt, 
			controlEffDtText, 
			controlPrevRun) {
	this.id = id;
	this.mid = mid;
	this.rowId = rowId;
	this.controlNextRun = controlNextRun;
	this.controlEffDt = controlEffDt;
	this.controlEffDtText = controlEffDtText;
	this.controlPrevRun = controlPrevRun;
}


<jobSchedule uri="http://localhost:8081/SOXComply/resources/jobSchedules/0/">
	<controlEffDt>2009-08-24T11:00:01-07:00</controlEffDt>
	<controlEffDtText>Prev2007</controlEffDtText>
	<controlNextRun>2009-08-24T11:00:01-07:00</controlNextRun>
	<controlPrevRun>2009-08-24T11:00:01-07:00</controlPrevRun>
	<id>0</id>
	<mid>0</mid>
	<rowId>0</rowId>
</jobSchedule>


var xmlLib = new SoftXMLLib();
xmlLib.loadXML(xmlString);

if(xmlLib.loadXMLError!=0){
	alert("XML file is not valid!");}
else{
	childs = xmlLib.selectNodes("//Company");
	for(i=0;i<childs.length;i++){
		alert(childs[i].innerText);
		//to get current node attribute's value use
		//childs[i].attributes[0].attributename
		//attribute name must be in lowercase
		alert(childs[i].attributes[0].city);
	}
}




var restUrl="http://localhost:8081/SOXComply/resources/";
var req;

function loadXMLDoc(url) {
	req = false;
    	// branch for native XMLHttpRequest object
    	if(window.XMLHttpRequest && !(window.ActiveXObject)) {
    		try {
			req = new XMLHttpRequest();
        	} catch(e) {
			req = false;
        	}
    	// branch for IE/Windows ActiveX version
    	} else if(window.ActiveXObject) {
       		try {
        		req = new ActiveXObject("Msxml2.XMLHTTP");
      		} catch(e) {
        		try {
          			req = new ActiveXObject("Microsoft.XMLHTTP");
        		} catch(e) {
          			req = false;
        		}
		}
    	}

	if(req) {
		req.onreadystatechange = processReqChange;
		req.open("GET", url, true);
		req.send("");
	}
}

function processReqChange() {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            // ...processing statements go here...
            dojo.byId("response").innerHTML = req.responseXML;		
            
        } else {
            alert("There was a problem retrieving the XML data:\n" + req.statusText);

					
        }
    }
}



function consumeXML() {
	var xmlLib = new SoftXMLLib();

	xmlLib.loadXML(xmlString);

	if(xmlLib.loadXMLError!=0){
		alert("XML file is not valid!");}
	else{
		childs = xmlLib.selectNodes("//jobSchedules");
		for(i=0;i<childs.length;i++){
			alert(childs[i].innerText);
			// to get current node attribute's value use
			// childs[i].attributes[0].attributename
			// attribute name must be in lowercase
			// alert(childs[i].attributes[0].city);
		}
	}	
}




function jobSchedulesCall(query)
{
	var urlIn = restUrl + "jobSchedules/" + query;
	loadXMLDoc( "http://localhost:8081/SOXComply/resources/jobSchedules/0/"  );
}




function preventionsCall(query)
{
	var urlIn = restUrl + "preventions/" + query;
	// ?start=0&max=10
}

function testRefsCall(query)
{
	var urlIn = restUrl + "testRefs/" + query;
}

function objectivesCall(query)
{
	var urlIn = restUrl + "objectives/" + query;
}

function ownerViewsCall(query)
{
	var urlIn = restUrl + "ownerViews/" + query;
}

function ownersCall(query)
{
	var urlIn = restUrl + "owners/" + query;
}

function gapsQasCall(query)
{
	var urlIn = restUrl + "gapsQas/" + query;
}

function riskNonAchievedsCall(query)
{
	var urlIn = restUrl + "riskNonAchieveds/" + query;
}

function refsCall(query)
{
	var urlIn = restUrl + "refs/" + query;
}

function ownerParentsCall(query)
{
	var urlIn = restUrl + "ownerParents/" + query;
}


function controlsCall(query)
{
	var urlIn = restUrl + "controls/" + query;
}

function ownerMappingsCall(query)
{
	var urlIn = restUrl + "ownerMappings/" + query;
} 

function frequenciesCall(query)
{
	var urlIn = restUrl + "frequencies/" + query;
}

function effDatesCall(query)
{
	var urlIn = restUrl + "effDates/" + query;
}

function operatingEffsCall(query)
{
	var urlIn = restUrl + "operatingEffs/" + query;
}

function sourcesCall(query)
{
	var urlIn = restUrl + "sources/" + query;
}

function designEffsCall(query)
{
	var urlIn = restUrl + "designEffs/" + query;
}

function sysManualsCall(query)
{
	var urlIn = restUrl + "sysManuals/" + query;
}




function poptartCheckItemAcceptance(node,source) 
{
     // Get the associated dojo.data item for the target
     item = dijit.getEnclosingWidget(node).item;

     // Need to check for item because when dropping on a root node,
     // item === null
     if (!item) 
	return false;

     ptType = ptTree.store.getValue(item,"type");

     if (ptType == 'category') {

         // We make intelligent guesses about the correct folder
         re = new RegExp(ptTree.store.getValue(item,"regexp"));
         okToMove = true;
         for (var itemId in source.selection) {
              console.debug(itemId+" tested against "+ re.toString() );
              okToMove &= re.test(itemId);
         }
         return okToMove;
     }
     else
         return false;
}