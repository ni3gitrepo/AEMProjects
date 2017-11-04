
http://www.cqblueprints.com/tipsandtricks/build-and-deploy-osgi/deploy-third-party-libs.html


    <plugin>
      <groupId>org.apache.felix</groupId>
      <artifactId>maven-bundle-plugin</artifactId>
      <configuration>
        <instructions>
          <Bundle-Activator>com.headwire.cqblueprints.examples.wrap3rdpartylib.Activator</Bundle-Activator>
          <Embed-Dependency>*;scope=compile|runtime</Embed-Dependency>
          <Embed-Directory>OSGI-INF/lib</Embed-Directory>
          <Private-Package>com.headwire.cqblueprints.examples.wrap3rdpartylib</Private-Package>
          <_exportcontents>
                                org.apache.commons.codec.*;version=${commons-codec.version},
                                org.apache.commons.validator.*;version=${commons-validator.version}
          </_exportcontents>
        </instructions>
      </configuration>
    </plugin>


NOTE:
=====

1)The .* suffix means that all sub-packages are included. I

2)Notice the value of the Export-Package property.
It contains all of packages from the wrapped Jars that are going to be made available to the OSGi container.


3)Also notice the value of the Import-Package property - it not only declares any dependencies that 
any code within the bundle may have (if any), it also declares the dependencies of the bundled 3rd party Jars.
To avoid relying on the OSGi container to provide the dependencies for the bundled Jars, include all of the 
transitive dependencies of the wrapped Jars in the bundle - this way the bundle is fully self contained and can be
deployed into any container without issue. This can easily be done using the bundle plugin by adding one extra configuration tag:

<Embed-Transitive>true</Embed-Transitive>
