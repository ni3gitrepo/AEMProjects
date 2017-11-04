ERROR:
======

17.05.2017 22:34:43.389 *ERROR* [qtp1107641692-47] ERROR: EventDispatcher: Error
 during dispatch. (java.lang.NoClassDefFoundError: org/osgi/service/event/EventHandler)
java.lang.NoClassDefFoundError: org/osgi/service/event/EventHandler
        at java.lang.ClassLoader.defineClass1(Native Method)
        at java.lang.ClassLoader.defineClass(Unknown Source)
        
        
SOLUTION:
=========

    <dependency>
	<groupId>org.osgi</groupId>
	<artifactId>org.osgi.compendium</artifactId>
	<version>4.2.0</version>
	<scope>provided</scope>
     </dependency>
      
      
      



STEP 1:
=======

To go http://localhost:4502/system/console/depfinder

STEP 2:
=======

in Packages/Classes: text search with org.osgi.service.event.EventHandler

It shows the below things in depfinder search results.

	==========================================================
	package                |version | Exported by|Maven Dependency
	===================================================================
	org.osgi.service.event |1.3.0 	|org.apache.felix.eventadmin (51) 	|

Maven Dependency
================

	<dependency>
	<groupId>org.apache.felix</groupId>
		<artifactId>org.apache.felix.eventadmin</artifactId>
		<version>1.3.2</version>
		<scope>provided</scope>
	</dependency>

SOLUTION:
=========

commenting this maven core pom.xml  fixed this issue !!!
