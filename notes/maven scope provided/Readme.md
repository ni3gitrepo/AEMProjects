Reasons for using dependency in AEM:
====================================
If you need to add a new library dependency for an AEM code-base.

    First goto the dependency-finder interface in AEM - E.g: http://localhost:4502/system/console/depfinder
    Type in the package name: e.g. ‘org.apache.sling.commons.scheduler’
    Note the version that is present there (AEM may or not have the given package available)

Adding a package which is available in AEM

If the package is available, then you need to add a  ‘provided’ scope dependency on this library on your code-base. 
Also be sure to add the closest version you can match, preferring the nearest new version on maven repository.


Root pom.xml
=============
<dependencyManagement>
  <dependency>
        <groupId>org.osgi</groupId>
        <artifactId>org.osgi.core</artifactId>
        <version>4.2.0</version>
        <scope>provided</scope>
  </dependency>
  
   <dependency>
        <groupId>com.adobe.aem</groupId>
        <artifactId>aem-api</artifactId>
        <version>6.0.0.1</version>
        <scope>provided</scope>
      </dependency>
      
      <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <version>2.3.1</version>
        <scope>provided</scope>
      </dependency>
      
      <dependency>
        <groupId>org.apache.commons</groupId>
        <artifactId>commons-lang3</artifactId>
        <version>3.0</version>
        <scope>provided</scope>
      </dependency>
      
</dependencyManagement>



 
 
