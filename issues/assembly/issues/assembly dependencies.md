ISSUE:
======

    [ERROR] Failed to execute goal org.apache.maven.plugins:maven-assembly-plugin:2.
    2-beta-5:single (default) on project webapi.dependencies: Failed to create assembl
    y: Error creating assembly archive dependencies: You must set at least one file.
     -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal o
    rg.apache.maven.plugins:maven-assembly-plugin:2.2-beta-5:single (default) on pro
    ject webapi.dependencies: Failed to create assembly: Error creating assembly archi
    ve dependencies: You must set at least one file.




SOLUTION:
=========

Reason 1:
==========
main reason is if < dependencies > tag as nothing it shows error.
check our dependency pom.xml  it should have atleast one < dependencies > tag if nothing is there error will be
shown.


Reason 2:
=========

Root:
=====

    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
       <modelVersion>4.0.0</modelVersion>
       <groupId>com.test</groupId>
       <artifactId>test</artifactId>
       <packaging>pom</packaging>
       <version>0.0.1-SNAPSHOT</version>
       <description>test</description>

       <modules>
           <module>core</module>
           <module>ui.apps</module>
          <module>dependencies</module>
       </modules> 



    <dependencyManagement>
      <dependency>
           <groupId>org.apache.httpcomponents</groupId>
           <artifactId>httpcore</artifactId>
           <version>4.4.1</version>
           <scope>provided</scope>
         </dependency>
         
         <dependency>
          <groupId>org.springframework</groupId>
          <artifactId>spring-core</artifactId>
          <version>4.2.6.RELEASE</version>
         </dependency>

         <dependency>
          <groupId>org.springframework</groupId>
          <artifactId>spring-beans</artifactId>
          <version>4.2.6.RELEASE</version>
         </dependency>
         
         
         <dependency>
          <groupId>org.jsoup</groupId>
          <artifactId>jsoup</artifactId>
           <version>1.8.3</version>
          <scope>provided</scope>  
         </dependency>
         
         <dependency>
          <groupId>org.springframework</groupId>
          <artifactId>spring-context</artifactId>
          <version>4.2.6.RELEASE</version>
         </dependency>
      </dependencyManagement>
   
      
 dependencies.xml
 ================

      <artifactId>test.dependencies</artifactId>
     <packaging>content-package</packaging>
     <name>test - Dependencies</name>
     <description>Dependency Bundle for test</description>
     <properties>
       <dirPath>${project.build.directory}/${project.artifactId}-${project.version}/jcr_root</dirPath>
     </properties>
     <!-- ====================================================================== -->
     <!-- B U I L D D E F I N I T I O N -->
     <!-- ====================================================================== -->
     <dependencies>
       <dependency>
         <groupId>org.springframework</groupId>
         <artifactId>spring-webmvc</artifactId>
       </dependency>
     
     <dependency>
           <groupId>org.apache.httpcomponents</groupId>
           <artifactId>httpcore</artifactId>
          
         </dependency>
     </dependencies>

in the above example 

        1)if above works if i give spring-webmvc alone it works!!!.
        2)if i give httpcomponet alone it wont works!!!
        3)if i give both it works , even though httpcomponent is provided scope but still we have atleast one
           jar (spring-mvc) to bundle as zip so assembly bundling works!!! because  assembly plugin needs
           atleast one jar in  <dependencies>  </depdencies> to make it work!!!.

Provided Explained:
===================

This is much like compile, but indicates you expect the JDK or a container to provide the dependency at runtime. For example, when building a web application for the Java Enterprise Edition, you would set the dependency on the Servlet API and related Java EE APIs to scope provided because the web container provides those classes. This scope is only available on the compilation and test classpath, and is not transitive.

IMPORTANT:
==========
so we are saying that is available in server so ignore at compile time. if you try to specify that jar in assembly it
can't bundle since it should already in the server.
