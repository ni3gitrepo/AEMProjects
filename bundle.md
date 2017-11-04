# AEMProjects

important:
==========
sample maven-bundle-plugin.
  
     <plugins>
      <plugin>
        <groupId>org.apache.felix</groupId>
        <artifactId>maven-bundle-plugin</artifactId>
        <extensions>true</extensions>
        <configuration>
          <instructions>
            <Export-Package>org.foo.myproject.api</Export-Package>
            <Private-Package>org.foo.myproject.*</Private-Package>
            <Bundle-Activator>org.foo.myproject.impl1.Activator</Bundle-Activator>
          </instructions>
        </configuration>
      </plugin>
    </plugins>


Export-Package:
================
The < Export-Package > instruction is a list of packages for the bundle to export.
These packages are copied into the resulting bundle JAR file from the available classes
(i.e., project classes, dependencies, and class path); thus, it is possible to include classes into your bundle that are not associated with source files in your project. < Export-Package > can be specified with package patterns using the '*' wildcard. Also, it is possible to exclude packages using negation by starting the package pattern with '!'. 

The list of package patterns is ordered and earlier patterns are applied before later patterns.
For example, if you specify "org.foo.*,!org.foo.impl" the second pattern has no effect since all 
org.foo packages have already been selected by the first pattern. Instead, 
you should specify "!org.foo.impl,org.foo.*", which will export all org.foo packages except org.foo.impl.

 Besides explicitly listing package version attributes, BND will also determine package versions by
 examining the source JAR file or from packageinfo files in the package directory.

if mentioned < Export-package >org.springframework < /Export-package > then the exported bundle has org.springframework all bundled in 
folder structure.

Private-Package
=================
The < Private-Package > instruction is similar in every way to the <Export-Package> instruction, except for the fact that these packages will not be exported by the bundle. If a package is selected by both the export and private package headers, then the export takes precedence.


Import-Package
==============

The < Import-Package > instruction is a list of packages that are required by the bundle's contained packages. 
The default for this header is "*", resulting in importing all referred packages. This header rarely has to be explicitly specified. However, in certain cases when there is an unwanted import, such an import can be removed by using a negation package pattern. 
The package patterns work in the same way as for < Export-Package >,
which means they are ordered. For example, if you wanted to import all packages except 
org.foo.impl you would specify "!org.foo.impl,*"
