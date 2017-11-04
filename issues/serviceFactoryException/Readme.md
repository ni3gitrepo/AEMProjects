Error:
======


org.osgi.framework.ServiceException: Service factory exception: org/apache/sling/api/servlets/SlingAllMethodsServlet

org.osgi.framework.ServiceException: Service factory exception: org/apache/sling/api/servlets/SlingAllMethodsServlet
	at org.apache.felix.framework.ServiceRegistrationImpl.getFactoryUnchecked(ServiceRegistrationImpl.java:325)
	at org.apache.felix.framework.ServiceRegistrationImpl.getService(ServiceRegistrationImpl.java:232)
	at org.apache.felix.framework.ServiceRegistry.getService(ServiceRegistry.java:319)

Caused by: java.lang.ClassNotFoundException: org.apache.sling.api.servlets.SlingAllMethodsServlet not found by com.ap.core [460]

30.05.2017 22:22:04.356 *ERROR* [FelixDispatchQueue] com.webapi.core FrameworkEvent ERROR (org.osgi.framework.ServiceException: Service factory exception: org/apache/sling/api/servlets/SlingAllMethodsServlet)
org.osgi.framework.ServiceException: Service factory exception: org/apache/sling/api/servlets/SlingAllMethodsServlet


Solution:
=========

Make sure < sling-Model-Packages > is correctly given. if not sure ignore like below, it automatically bind it.


		<plugin>
				<groupId>org.apache.felix</groupId>
				<artifactId>maven-bundle-plugin</artifactId>
				<extensions>true</extensions>
				<configuration>
					<instructions>
						<!-- <Embed-Dependency> artifactId1, artifactId2;inline=true </Embed-Dependency> -->
						<!--   <Sling-Model-Packages>
							com.api.api
						</Sling-Model-Packages>

						<Import-Package>
 
						</Import-Package>   -->
					</instructions>
				</configuration>
			</plugin>


IMPORTANT:
============
please ignore < slingModelpackages > tag if not sure what model name to put.

e.g i have servlet with package com.api.servlet.TestServlet so here below mentioned wrongly as com.api.api so if i uncomment it can't
bind to create the bundle.

You can check the bundle at path of AEM server also- C:\AEMServer\crx-quickstart\launchpad\felix

Also bundle id will available in http://localhost:4502/system/console/bundles
with the  below 

id  |  Name
==================

460 |api - com.api.core  

so to check the core api bundle go to 460 bundle C:\AEMServer\crx-quickstart\launchpad\felix\bundle460
inside bundle 460 it has jackrabbit jcr path
C:\AEMServer\crx-quickstart\launchpad\felix\bundle460\bundle.info.


content of C:\AEMServer\crx-quickstart\launchpad\felix\bundle460\bundle.info.
==============================================================================

460
jcrinstall:/apps/webapi/install/webapi.core-0.0.1-SNAPSHOT.jar
32
20
1496209033001


Actual Servlet:
================

	@SlingServlet(paths = { "/bin/api/onLoad/Mainservlet","/bin/api/onSubmit/Mainservlet"}, methods = {
			"POST" }, metatype = true)
	public class MainServlet extends SlingAllMethodsServlet {


		@Reference
		ApiService apiservice
		@Override
		protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response)
				throws ServletException, IOException {


		 }
	}
	

Important:
=========
bundled jar below  it has 2 xml files generated automatically, i.e servlet and if in case has injected with service it also be there.


C:\AEMServer\crx-quickstart\launchpad\felix\bundle460\version0.14\bundle.jar\OSGI-INF\


1)com.api.servlet.MainServlet.xml
2)com.api.service.ApiService.xml


MainServlet.xml
================


	<?xml version="1.0" encoding="UTF-8"?><components xmlns:scr="http://www.osgi.org/xmlns/scr/v1.0.0">
	    <scr:component name="com.api.servlet.MainServlet">
		<implementation class="com.api.servlet.MainServlet"/>
		<service servicefactory="false">
		    <provide interface="javax.servlet.Servlet"/>
		</service>
		<property name="sling.servlet.paths">
		    /bin/api/onLoad/MainServlet
		</property>
		<property name="sling.servlet.methods">
		    POST
		</property>
		<property name="service.vendor" value="Adobe"/>
		<property name="service.pid" value="com.api.servlet.MainServlet"/>
	    </scr:component>
	</components>
	
	
2)com.api.service.ApiService.xml
=================================

	<?xml version="1.0" encoding="UTF-8"?><components xmlns:scr="http://www.osgi.org/xmlns/scr/v1.1.0">
	    <scr:component immediate="true" name="com.api.service.ApiService" activate="activate">
		<implementation class="com.api.service.ApiService"/>
		<service servicefactory="false">
		    <provide interface="com.api.service.ApiService"/>
		</service>
		<property name="USERNAME" value="test"/>
		<property name="PASSWORD" value="welcome123"/>
		
		<property name="service.pid" value="com.api.service.ApiService"/>
	    </scr:component>
	</components>

To add custom path for servlet
===============================
for e.g above   /bin/api/onLoad/MainServlet is pre-configured path. i.e /bin, /services are existing prefix.

check in http://localhost:4502/system/console/configMgr named as Apache Sling Servlet Resolver.


Apache Sling Servlet/Script Resolver and Error Handler
=======================================================
there entry for available servlet paths.

Execution Paths:
===============
	 /bin
	 /libs
	 /apps
	 /system
	 /index.servlet
	 /login.servlet
	 /services.

 To app custom path click add > add for e.g if needed to /api/servlet/Mainservlet then add entry /api on execution path.
 
 Default Extension 
 ==================
   html
