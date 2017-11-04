ISSUE:
======

Cannot serve request to /webapi/onload/PartnerServlet/ in org.apache.sling.servlets.get.DefaultGetServlet


/test/onload/BootStrapServlet/ in org.apache.sling.servlets.get.DefaultGetServlet
 
 

      Execution Paths	
      /bin/
      /libs/
      /apps/
      /system/
      /index.servlet
      /login.servlet
      /services/
      /test/  #added newly


      The paths to search for executable scripts. If no path is configured this is treated like the default (/ = root) which allows to execute all scripts. By configuring some paths the execution of scripts can be limited. If a configured value ends
      with a slash, the whole sub tree is allowed. Without a slash an exact matching script is allowed. (servletresolver.paths)
      Default Extensions	
      html
      +-
STEPS:
=======
1. Go to http://localhost:4502/system/console/configMgr

2. Look for Apache Sling Servlet/Script Resolver and Error Handler and click on pencil icon on the right

3. I attached image please check whether you have html in default extensions, if not add html

If you don't have felix, you can check same configuration in

crx-quickstart\launchpad\config\org\apache\sling\servlets\resolver\SlingServletResolver.config
