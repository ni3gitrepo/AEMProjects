
Tools
======

1)Using the BND tool  
=====================
generate json.jar- a new archive that contains the modified manifest file.

    Manifest-Version: 1.0
    Export-Package: org.json
    Bundle-Version: 0
    Tool: Bnd-0.0.384
    Bnd-LastModified:

E.g:
====

    java -jar bnd-1.5.0.jar wrap json.jar

2)OSP4J Pax Runner 
==================

    It provides Eclipse launch configurations for major OSGi frameworks
    
3)The m2clipse plugin
======================
It automates a lot of the Maven project creation processes and also integrates with Maven Operations.
