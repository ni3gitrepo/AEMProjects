Issue :
=========

http://localhost:4502/system/console/bundles/490 shows import issues.

cannot be able to understand 

    Symbolic Name	com.shop.webapi.core
    Version	0.0.1.SNAPSHOT
    Bundle Location	jcrinstall:/apps/webApi/install/webapi.core-0.0.1-SNAPSHOT.jar
    Last Modification	Sun May 07 18:32:24 PDT 2017
    Description	Core bundle for webapi
    Start Level	20
    Exported Packages

    Imported Packages	 

    org.springframework.oxm -- Cannot be resolved
    org.springframework.stereotype from com.shop.webapi.core (490)
    org.springframework.ui from com.shop.webapi.core (490)
    org.springframework.ui.freemarker -- Cannot be resolved
    org.springframework.ui.jasperreports -- Cannot be resolved
    org.springframework.ui.velocity -- Cannot be resolved

Solution :
========== 


Building an OSGi Bundle

The easiest way for a CQ developer to build an OSGi Bundle is to use Apache Maven with the Apache Felix Bundle plugin. This plugin is written by the Apache Felix team based on the BND tool . however the OSGi bundles that it creates are not specific to Felix and can be used in other OSGi containers.

This combination will allow developers to proceed as if they were creating a basic Jar file with Maven (from the command line, or from an IDE), but will provide them with low level control over the OSGi meta data that is added to the bundle.

The first step is to create a new Maven project, and set the packaging style to be bundle and also to add the Apache Felix Bundle plugin definition.

	<?xml version="1.0" encoding="UTF-8"?>

	<project xmlns="http://maven.apache.org/POM/4.0.0"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

	   <modelVersion>4.0.0</modelVersion>

	   <parent>
	       <groupId>com.headwire.cqblueprints</groupId>
	       <artifactId>parent</artifactId>
	       <version>5.4.0-SNAPSHOT</version>
	   </parent>

	   <artifactId>cqblueprints-examples-osgi-bundle</artifactId>
	   <packaging>bundle</packaging>
	   
	    .......
	  
	   <build>
	       <pluginManagement>
		   <plugins>
		       <plugin>
			   <groupId>org.apache.felix</groupId>
			   <artifactId>maven-bundle-plugin</artifactId>
			   <version>2.3.5</version>
			   <extensions>true</extensions>
		       </plugin>
		       
		        ..........
		
		   </plugins>
	       </pluginManagement>

	       <plugins>
		   <plugin>
		       <groupId>org.apache.felix</groupId>
		       <artifactId>maven-bundle-plugin</artifactId>
		       
		        ..........
		
		   </plugin>

	       </plugins>
	   </build>

	   .........

	</project>

Next step is to configure the Apache Felix Bundle plugin:

           <plugin>
               <groupId>org.apache.felix</groupId>
               <artifactId>maven-bundle-plugin</artifactId>
               <configuration>
                   <instructions>
                       <Bundle-Activator>com.headwire.cqblueprints.examples.osgi.Activator</Bundle-Activator>
                       <Private-Package>com.headwire.cqblueprints.examples.osgi</Private-Package>
                       <Embed-Dependency>*;scope=compile|runtime</Embed-Dependency>
                       <Embed-Directory>OSGI-INF/lib</Embed-Directory>
                       <Embed-Transitive>true</Embed-Transitive>
                       <Import-Package>!org.slf4j.impl,*</Import-Package>
                   </instructions>
               </configuration>
           </plugin>


< Embed-Dependency >
=====================

Which Maven dependencies should be embedded within the bundle that is being built. Set this to *;scope=compile|runtime as this will include all dependencies that have a scope of either compile or runtime, which will be all of the classes the bundle needs to run if the POM is configured properly.

Embedding dependencies within your bundle is recommended. The alternative is to not embed dependencies within the bundle and instead import dependencies from the OSGi container. We recommend embedding dependencies as it makes using the bundle much easier for other developers who don't have to track down all of the dependencies and deploy them first before they can deploy the new bundle.



E.g:
=====

ask to ignore oxm since i not issued in my code.


	<plugin>
		<groupId>org.apache.felix</groupId>
		<artifactId>maven-bundle-plugin</artifactId>
		<extensions>true</extensions>
		<configuration>
			<instructions>
			<Export-Package></Export-Package>
			<Import-Package>!org.springframework.oxm,!org.springframework.ui.*,
			org.springframework.*</Import-Package>
			</instructions>
		</configuration>
	</plugin>  
	
