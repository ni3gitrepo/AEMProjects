
@SlingServlet(paths = { "/bin/onLoad/SalesForceservlet"}, methods = {
		"POST" }, metatype = true)

public class SalesForceservlet extends SlingAllMethodsServlet {


	
  private PartnerConnection partnerConnection = null;

  
  @Override
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response)
			throws ServletException, IOException {
      
      parDetObj = excuteQuery(fedId);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().print(parDetObj);
					response.getWriter().flush();
      
   }
   
   
   
   /**
      To get the fedid from salesForce site by below
     //click on login user hyperlink > My Settings > Personal > Reset My Security Token >
     //To use token while accessing salesforce API.
     //use combination password + securityToken i.e like arun@194ucS1to6Vpoq4HIsVfM9KnCU7
   **/
   	public JSONObject excuteQuery(String id) throws Exception {
        JSONObject parDetObj = new JSONObject();
        public JSONObject excuteQuery(String id) throws Exception {
        JSONObject parDetObj = new JSONObject();
        // Set query batch size
       

        String contactIdsql = "select * from user where FederationIdentifier='" + id;
        
        
        QueryResult userInfoqr = partnerConnection.query(userInfosql);
        SObject[] userInfoqrrecords = userInfoqr.getRecords();
        SObject userInfoFirstrecord = userInfoqrrecords[0];
        XmlObject temp = (XmlObject) userInfoFirstrecord.getField("Account");
        String name = (String) temp.getField("Name");

        try {
          parDetObj.put("AccountName", name);
             for (String key : paramFeild_Map.getParamFeild_Map().keySet()) {
                parDetObj.put(key, userInfoFirstrecord.getField(paramFeild_Map.getParamFeild_Map().get(key)));
             }
          } catch (JSONException e) {
             LOG.error("JSON Object Exception : " + e.getMessage());
          }

        return parDetObj;
    }
    
    
  }
    
    
   
   
 
