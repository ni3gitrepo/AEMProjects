Root pom.xml
============

	<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	    <modelVersion>4.0.0</modelVersion>
	    <groupId>com.test</groupId>
	    <artifactId>test</artifactId>
	    <packaging>pom</packaging>
	    <version>0.0.1-SNAPSHOT</version>
	    <description>test</description>

	    <!--it should match name of maven module project name not artificat -->
	    <modules>
		<module>core</module> 
		<module>ui.apps</module>
			    <module>dependencies</module>
	    </modules> 

core:
======
  
   <!-- parent artifact ,group id should match same as root pom -->
   
       <parent>
		<groupId>com.test</groupId>
		<artifactId>test</artifactId>
		<version>0.0.1-SNAPSHOT</version>
		<relativePath>../pom.xml</relativePath>
       </parent>
    
    <!--artificat core should be differnt -->
    
    <!--
        if i give < artifactId >test</ artifactId > same as root pom.xml It says duplicate 
        [ERROR] [ERROR] Project 'com.test:test:0.0.1-SNAPSHOT' is duplicated in the reactor @
        [ERROR] Project 'com.test:test:0.0.1-SNAPSHOT' is duplicated in the reactor -> [
       -->
   
   		<artifactId>test.core</artifactId>
	       <packaging>bundle</packaging>
	       <name>test - Core</name>
	       <description>Core bundle for test</description>
    
 ui.apps
 ========
 
 
	   <parent>
		<groupId>com.test</groupId>
		<artifactId>test</artifactId>
		<version>0.0.1-SNAPSHOT</version>
		<relativePath>../pom.xml</relativePath>
	    </parent>

	    <artifactId>test.ui.apps</artifactId>
	    <packaging>content-package</packaging>
	    <name>test - UI apps</name>
	    <description>UI apps package for test</description>

/test/ ui.apps /src/main/content/META-INF/vault/filter.xml
==========================================================

	<workspaceFilter version="1.0">
	    <filter root="/apps/test">
		<exclude pattern="/apps/test/install" />
		<exclude pattern="/apps/test/i18n/.*" />
	    </filter>
	    <filter root="/apps/sling" />
	    <filter root="/apps/cq/linkchecker"/>
	    <filter root="/apps/cq/xssprotection"/>
	    <filter root="/etc/designs/test">
		<exclude pattern="/etc/designs/test/jcr:content/productDetail/datalayer"/>
		<exclude pattern="/etc/designs/test/clientlib/css/*"/>
	    </filter>
	    <filter root="/apps/wcm/extensions/contentfinder"/>
	    <filter root="/etc/languages"/>  
	</workspaceFilter>

dependencies:
=============
depenencies project to create a zip file for different type . if in case if project deployed in 
web and also in applet version (desktop) need diff dependencies. 
Assembly can used to build different dependencies dynamically.

	 <parent>
	    <artifactId>test</artifactId>
	    <groupId>com.test</groupId>
	    <version>0.0.1-SNAPSHOT</version>
	    <relativePath>../pom.xml</relativePath>
	  </parent>
	  <!-- ====================================================================== -->
	  <!-- P R O J E C T D E S C R I P T I O N -->
	  <!-- ====================================================================== -->
	  <artifactId>test.dependencies</artifactId>
	  <packaging>content-package</packaging>
	  <name>test - Dependencies</name>
	  <description>Dependency Bundle for test</description>


	<build>
	     <sourceDirectory>src/assembly</sourceDirectory>
	    <resources>
	      <resource>
		<filtering>false</filtering>
		<directory>${dirPath}</directory>
		<excludes>
		  <exclude>**/.vlt</exclude>
		  <exclude>**/.vltignore</exclude>
		</excludes>
	      </resource>
	    </resources>
	   
	   
	 <!-- contenttype help to zip all dependency as zip file in packmngr in AEM based on 
	       diff type of enviornment for e.g desktop or web code for the same app
	       product. if product is available in both web and applet version but need
	       different dependencies
	       can manually also upload zip files in the  url http://localhost:4502/crx/packmgr/index.jsp
	  -->  
       <plugin>
	<groupId>com.day.jcr.vault</groupId>
	<artifactId>content-package-maven-plugin</artifactId>
	<extensions>true</extensions>
	<executions>
	  <execution>
	    <phase>package</phase>
	    <goals>
	      <goal>package</goal>
	    </goals>
	  </execution>
	</executions>
      </plugin>

	<plugin> 
	<artifactId>maven-assembly-plugin</artifactId>
	<executions>
	  <execution>
	    <phase>prepare-package</phase>
	    <goals>
	      <goal>single</goal>
	    </goals>
	  </execution>
	</executions>
	<configuration>
	  <appendAssemblyId>false</appendAssemblyId>
	  <descriptors>
	    <descriptor>src/assembly/assembly.xml</descriptor>
	  </descriptors>
	  <finalName>vault-work</finalName>
	</configuration>
      </plugin>   

   

	<id>dependencies</id>
		<formats>
			<format>dir</format>
		</formats>

		<includeBaseDirectory>false</includeBaseDirectory>
		<dependencySets>
			<dependencySet>
				<outputDirectory>/jcr_root/apps/test.dependencies/install</outputDirectory>
				<unpack>false</unpack>
				<scope>runtime</scope>
				<useProjectArtifact>false</useProjectArtifact>
				<useTransitiveDependencies>false</useTransitiveDependencies>
			</dependencySet>


			<dependencySet>
				<outputDirectory>/jcr_root/apps/test.dependencies/install</outputDirectory>
				<unpack>false</unpack>
				<scope>runtime</scope>
				<useProjectArtifact>false</useProjectArtifact>
				<useTransitiveDependencies>false</useTransitiveDependencies>
			</dependencySet>

		</dependencySets>
	</assembly>
