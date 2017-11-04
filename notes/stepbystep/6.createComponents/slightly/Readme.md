

FLow of Dynamic Dialog component using slightly
================================================

slightly
=========

	<div data-sly-use.webAPI="com.test.core.components.WebFormField" data-sly-unwrap>


in crxde
=========

 under:/crx/de/index.jsp#apps/webAPI/
=====================================
	   -components
		   -content
		   -page
		       Webapi(cq:component)
			       -header.jsp
			      -webapi.html
	    -templates
    		  Webapi
		    jcr:content
		    
 NOTE:
 ====
 jcr:content properties:
 ======================
 
	sling:primaryType - cq:pageComponent
	sling:resourceType - Webapi/components/page/Webapi
 
    
 under :/crx/de/index.jsp#content/WebAPI
=========================================
	--webapi
	   --jcr:content

NOTE:
====
content jcr:content properties
==============================
	
	sling:resourceType = webAPI/components/Webapi
	cq:template = webAPI/components/Webapi
		

JAVA
=====
	public class WebFormField extends WCMUse {

	  APIComponent comp = new APIComponent(); 
	  public void activate() throws Exception {

	    Node node;
			String  WEB_form_PATH = getProperties().get("formPath", String.class);
			if (WEB_form_PATH == null) {
				WEB_form_PATH = getResource().getPath();
			} else {
				Node curNode = getResourceResolver()
				.getResource(WEB_form_PATH + "/jcr:content").adaptTo(Node.class);
				WEB_form_PATH = nodeIteratorValue(curNode, "webapiField");
			}
			node = getResourceResolver().getResource(WEB_form_PATH).adaptTo(Node.class);

	    		comp.setAccountInfo(getPropValue(node, "apiName", "APIName"));
			comp.setAccountnamelabel(getPropValue(node, "methodName", "method Name"));
			comp.setAlt_emaillbl(getPropValue(node, "input", "Input"));
			comp.setButtontext1(getPropValue(node, "output", "output"));

	  }


	  private String getPropValue(Node node, String string, String string2)
				throws PathNotFoundException, ValueFormatException, RepositoryException {
			String retVal = null;
			try {
				retVal = (node.getProperty(string) != null) ?
				node.getProperty(string).getValue().toString() : string2;
			} catch (Exception e) {
				return retVal;
			}
			return retVal;
		}
  
  
		  private String nodeIteratorValue(Node node, String nodeName) throws RepositoryException {

				if (node.getName().contains(nodeName)) {
					return node.getPath();
				}
				String nodeValue = null;
				NodeIterator nodeItr = node.getNodes();
				while (nodeItr.hasNext()) {
					nodeValue = nodeIteratorValue(nodeItr.nextNode(), nodeName);
					if (nodeValue != null) {
						return nodeValue;
					}

				}
				return nodeValue;
			}
		}


APICOmponent:
=============

		private class APIComponent{
		  private String methodName;;
		  private String input;
		  private Stirng output;
		   private Stirng ApiName;

		  //getters & setters.

		}

JSP
===
	<div data-sly-use.webAPI="com.test.core.components.WebFormField" data-sly-unwrap>

	 <p style="margin-top:0px">${webAPI.apiComponent.methodName @ i18n}</p>
	 <p style="margin-top:0px">${webAPI.apiComponent.input @ i18n}</p>
	 <p style="margin-top:0px">${webAPI.apiComponent.output  @ i18n}</p>
