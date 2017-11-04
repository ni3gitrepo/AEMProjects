
STEP 1:
=======
download bnd-1.5.jar from mvn repository

https://mvnrepository.com/artifact/biz.aQute/bnd/1.50.0

	<dependency>
	    <groupId>biz.aQute</groupId>
	    <artifactId>bnd</artifactId>
	    <version>1.50.0</version>
	</dependency>

STEP 2:
=======
prepare .bnd file

okta.bnd
=========

	-classpath: okta-sdk-0.0.4.jar # path of jar
	-output: okta-0.0.4-new.jar  # new jar after manifest file entry updated
	Export-Package: *;-split-package:=merge-last;-noimport:=true
	Import-Package: *
	Bundle-Version: 0.0.4
	Bundle-Name: OKTA
	Bundle-SymbolicName: com.okta

NOTE:
=====
	Export-Package: *;-split-package:=merge-last;-noimport:=true
	Export-Package: *;version=2.9.0 
	
E.g Manifest if mention version=2.9.0
=====================================
	com.fasterxml.jackson.databind.deser,com.fasterxml.jackson.databind.deser.std";version=2.9.0"
	
if you give like Export-Package:*, in .bnd file , it generates version in jar manifest. so  if you have some cross reference
issues , then  you can use version.
	
	
sample cross reference issue:
=============================

webapi need jackson-core-2.9.0.jar

1)jackson-core-2.9.0 - need jackson databind

2)jackson-databind-2.9.0.pr3	-depend on jackson-databind-joda.

3)jackson-datatype-joda-2.9.0.pr3 - it refers again jackson-core-2.9.0 again



	it shows error 

	com.fasterxml.jackson.datatype.joda,version=0.0 
	com.fasterxml.jackson.datatype.joda.cfg,version=2.9.0
	com.fasterxml.jackson.datatype.joda.deser,version=2.9.0
	com.fasterxml.jackson.datatype.joda.deser.key,version=2.9.0
	com.fasterxml.jackson.datatype.joda.ser,version=2.9.0

	com.fasterxml.jackson.core,version=0.0.0 from jackson-core (466)-- Cannot be resolved expected version 2.9.0
	com.fasterxml.jackson.core,version=0.0.0 from jackson-core (466)
	com.fasterxml.jackson.core.util,version=2.9.0 from jackson-core (466)
	com.fasterxml.jackson.core.util,version

you can add like below

	Export-Package: *;version=2.9.0

STEP 3:
=======

worked with bnd-0.0.384.jar not worked with 1.50

Two ways:
==========

Procedure 1:
=============

just it print jar exported with manifest

C:\AEM Bind>java -jar bnd-0.0.384.jar okta.bnd
  outptut: jackson-core-2.9.0.jar 100 286463

PROCEDURE 2:
=============

provides more verbose info  like below what manifest it is adding.

if given again name it generate verbose like what classes in jar 

C:\AEM Bind>java -jar bnd-0.0.384.jar okta.bnd jackson-datatype-joda-2.9.0.pr3.jar

	jackson-core-2.9.0.jar 100 286463(not modified)
	[MANIFEST jackson-datatype-joda-2.9.0.pr3.jar]
	Bnd-LastModified                        1493138407467

	Build-Jdk                               1.7.0_79

	Built-By                                tatu

	Bundle-Description                      Add-on module for Jackson (http://jackso
	n.codehaus.org) to supportJoda (http://joda-time.sourceforge.net/) data types.
	Bundle-DocURL                           http://wiki.fasterxml.com/JacksonModuleJ
	oda
	Bundle-License                          http://www.apache.org/licenses/LICENSE-2
	.0.txt
	Bundle-ManifestVersion                  2

	Bundle-Name                             Jackson-datatype-Joda

	Bundle-SymbolicName                     com.fasterxml.jackson.datatype.jackson-d
	atatype-joda
	Bundle-Vendor                           FasterXML

	Bundle-Version                          2.9.0.pr3

	Created-By                              Apache Maven Bundle Plugin

	Export-Package                          com.fasterxml.jackson.datatype.joda;uses
	:="com.fasterxml.jackson.core,com.fasterxml.jackson.databind,com.fasterxml.jacks
	on.databind.module";version="2.9.0",com.fasterxml.jackson.datatype.joda.cfg;uses
	:="com.fasterxml.jackson.annotation,com.fasterxml.jackson.databind,org.joda.time
	,org.joda.time.format";version="2.9.0",com.fasterxml.jackson.datatype.joda.deser
	;uses:="com.fasterxml.jackson.core,com.fasterxml.jackson.databind,com.fasterxml.
 
Important:
===========

okta-0.0.4-new.jar in command prompt jar should match with okta.bnd -output: okta-0.0.4-new.jar

It Automcatically reads all java classes and checks needed import pacakges and get added to output
jar manifest file.

Generated output for above file:
================================

As you can see com.fasterxml.jackson.annotation gets added to manifest 
file based on imports in  class inside jar . It reads all java classes and checks needed import pacakges 
and added to manifest bundle.

      Manifest-Version: 1.0
      Export-Package: com.okta.sdk.exceptions;uses:="com.okta.sdk.framework"
       ,com.okta.sdk.models.events;uses:="com.okta.sdk.framework,org.joda.ti
       me",com.okta.sdk.models.sessions;uses:="com.okta.sdk.framework",com.o
       kta.sdk.framework;uses:="com.fasterxml.jackson.core.type,org.apache.h
       ttp,org.slf4j,com.okta.sdk.exceptions,org.apache.http.impl.client,org
       .apache.http.client,org.apache.http.client.methods,org.apache.http.me
       ssage,com.fasterxml.jackson.annotation,com.okta.sdk.models.links,org.
       joda.time,com.fasterxml.jackson.core,com.fasterxml.jackson.databind,o
       rg.apache.http.entity,org.apache.http.util,com.fasterxml.jackson.data
       bind.module,com.fasterxml.jackson.datatype.joda,org.joda.time.format"
       ,com.okta.sdk.models.users;uses:="com.okta.sdk.framework,com.fasterxm
       l.jackson.annotation,org.joda.time,com.fasterxml.jackson.databind.ann
       otation,com.okta.sdk.models.links",com.okta.sdk.models.log;uses:="com
       .fasterxml.jackson.annotation,com.okta.sdk.framework,com.google.commo
       n.collect",com.okta.sdk.models.apps;uses:="com.okta.sdk.framework,com
       .okta.sdk.models.users,org.joda.time,com.fasterxml.jackson.annotation
       ,com.fasterxml.jackson.databind.annotation,com.okta.sdk.models.links"
       ,com.okta.sdk.models.auth;uses:="org.joda.time,com.fasterxml.jackson.
       annotation,com.fasterxml.jackson.databind.annotation,com.okta.sdk.mod
       els.links,com.okta.sdk.framework",com.okta.sdk.clients;uses:="com.fas
       terxml.jackson.core.type,com.okta.sdk.models.apps,com.okta.sdk.framew
       ork,org.apache.http,com.okta.sdk.models.auth,org.joda.time,com.okta.s
       dk.models.events,com.okta.sdk.models.factors,com.okta.sdk.models.log,
       com.okta.sdk.models.sessions,com.okta.sdk.models.users,com.okta.sdk.m
       odels.usergroups",com.okta.sdk.models.links;uses:="javax.xml.bind.ann
       otation,com.fasterxml.jackson.databind.annotation,com.fasterxml.jacks
       on.databind,com.fasterxml.jackson.annotation,com.fasterxml.jackson.co
       re,com.fasterxml.jackson.databind.deser.std",com.okta.sdk.models.fact
       ors;uses:="org.joda.time,com.fasterxml.jackson.annotation,com.fasterx
       ml.jackson.databind.annotation,com.okta.sdk.models.links,com.okta.sdk
       .framework",com.okta.sdk.models.usergroups;uses:="com.okta.sdk.framew
       ork"
      Bundle-SymbolicName: com.okta
      Bundle-Version: 2.0.4
      Bundle-Name: OKTA
      Bundle-ManifestVersion: 2
      Bnd-LastModified: 1496538229175
      
      
      
      Import-Package: com.fasterxml.jackson.annotation,com.fasterxml.jackson
       .core,com.fasterxml.jackson.core.type,com.fasterxml.jackson.databind,
       com.fasterxml.jackson.databind.annotation,com.fasterxml.jackson.datab
       ind.deser.std,com.fasterxml.jackson.databind.module,com.fasterxml.jac
       kson.datatype.joda,com.google.common.collect,javax.xml.bind.annotatio
       n,org.apache.http,org.apache.http.client,org.apache.http.client.metho
       ds,org.apache.http.entity,org.apache.http.impl.client,org.apache.http
       .message,org.apache.http.util,org.joda.time,org.joda.time.format,org.
       slf4j
      Created-By: 1.8.0_121 (Oracle Corporation)
      Tool: Bnd-0.0.384

STEP 4:
=======
 dont use maven-bundle-plugin because if try to add for one jar it added other needed dependency in jar and shows error.
 because manually need to collect import packages if you know it is fine else need to do above import packages manually.
 then need to add ignore in < Import-packages >  tag. like !javax.faces, com.fasterxml.jackson.annotation like that. instead generate jar using bnd command
 and add in  < dependencies > systempath it works!!!.
    
     <build>
		<plugins>
			<plugin>
				<groupId>org.apache.felix</groupId>
				<artifactId>maven-scr-plugin</artifactId>
			</plugin>

			<plugin>
				<groupId>org.apache.felix</groupId>
				<artifactId>maven-bundle-plugin</artifactId>
				<extensions>true</extensions>
				<configuration>
					<instructions>
					   <!-- 
					     <Import-Packages>
					       com.okta.*,!javax.faces, com.fasterxml.jackson.annotation
					     </Import-Packages>
					   -->
					</instructions>
				</configuration>
			</plugin>
		</plugins>
	 </build>



        <dependency>
			<groupId>com.okta</groupId>
			<artifactId>okta-sdk</artifactId>
			<version>0.0.4</version>
			 <scope>system</scope> 
			 <systemPath>${project.basedir}/dependencies/okta-0.0.4.jar</systemPath>
		</dependency>
        
STEP 5:
=======

check in the system bundle http://localhost:4502/system/console/bundles

check okta added in imports

id |Name
==========

460|com.webapi.core
===
    Symbolic Name	com.webapi.core
    Version	0.0.1.SNAPSHOT
    Bundle Location	jcrinstall:/apps/webapi/install/webapi.core-0.0.1-SNAPSHOT.jar
    Last Modification	Sat Jun 03 18:25:17 PDT 2017
    Description	Core bundle for webapi
    Start Level	20


    Exported Packages	
    com.webapi,version=0.0.1
    com.webapi.domain,version=0.0.1
    com.webapi.exception,version=0.0.1
    com.webapi.service,version=0.0.1
    com.webapi.servlet,version=0.0.1

    Imported Packages	
    com.okta.sdk.clients from com.okta (462)
    com.okta.sdk.framework from com.okta (462)
    com.okta.sdk.models.auth from com.okta (462)
    com.okta.sdk.models.usergroups from com.okta (462)
    com.okta.sdk.models.users from com.okta (462)
 
NOTE:
=====

see it creates a entry and it refers from bundle id (462) if you check 462 bundle id it says com.fasterxml
is missing.

	As you can see below import is from  APiservice.java file
	com.okta.sdk.clients from com.okta (462)
	com.okta.sdk.framework from com.okta (462)
	com.okta.sdk.models.auth from com.okta (462)
	com.okta.sdk.models.usergroups from com.okta (462)
	com.okta.sdk.models.users from com.okta (462)


ApiService.java
===============

	import com.okta.sdk.clients.AuthApiClient;#com.okta.sdk.clients from com.okta (462)
	import com.okta.sdk.clients.UserApiClient;
	import com.okta.sdk.clients.UserGroupApiClient;
	import com.okta.sdk.framework.ApiClientConfiguration; #com.okta.sdk.framework from com.okta (462)
	import com.okta.sdk.models.auth.AuthResult;# com.okta.sdk.models.auth from com.okta (462)
	import com.okta.sdk.models.usergroups.UserGroup; #com.okta.sdk.models.usergroups from com.okta (462)
	import com.okta.sdk.models.users.LoginCredentials;
	import com.okta.sdk.models.users.Password;
	import com.okta.sdk.models.users.User;#com.okta.sdk.models.users from com.okta (462)
	import com.okta.sdk.models.users.UserProfile;

	public class APIService {
		public User getUserDetails(String userName , String password) throws IOException {
			AuthApiClient authClient = new AuthApiClient(oktaSettings);
			UserApiClient userApiClient = new UserApiClient(oktaSettings);
			user = userApiClient.getUser(userName);

			return user;
		}

	}

 
462|com.webapi.core
====================

     OKTAcom.okta
    Symbolic Name	com.okta
    Version	2.0.4
    Bundle Location	inputstream:okta-0.0.4.jar
    Last Modification	Sat Jun 03 18:17:20 PDT 2017
    Start Level	20
    
    Exported Packages	com.okta.sdk.clients
    com.okta.sdk.exceptions
    com.okta.sdk.framework
    com.okta.sdk.models.apps
    com.okta.sdk.models.auth
    com.okta.sdk.models.events
    com.okta.sdk.models.factors
    com.okta.sdk.models.links
    com.okta.sdk.models.log
    com.okta.sdk.models.sessions
    com.okta.sdk.models.usergroups
    com.okta.sdk.models.users
    
    Imported Packages	com.fasterxml.jackson.annotation from com.adobe.cq.social.cq-social-ugcbase (366)
    com.fasterxml.jackson.core from com.adobe.cq.social.cq-social-ugcbase (366)
    com.fasterxml.jackson.core.type -- Cannot be resolved
    com.fasterxml.jackson.databind from com.adobe.cq.social.cq-social-ugcbase (366)
    com.fasterxml.jackson.databind.annotation -- Cannot be resolved
    com.fasterxml.jackson.databind.deser.std -- Cannot be resolved
    com.fasterxml.jackson.databind.module -- Cannot be resolved
    com.fasterxml.jackson.datatype.joda -- Cannot be resolved
