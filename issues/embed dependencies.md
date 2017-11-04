ISSUE:
======

Caused by: org.apache.maven.plugin.MojoFailureException: Embedded artifact speci
fied Embedded: groupId=com.webapi,artifactId=webapi.core,filter=false,excludeTransit
ive=false,target=/apps/webapi/install/, but no matching dependency artifact found.
 Add the missing dependency or fix the embed definition.
        at com.day.jcr.vault.maven.pack.VaultMojo.copyEmbeddeds(VaultMojo.java:4
        
        
SOLUTION:
=========
Added below dependencies fixed. < embed > tag below expect webapi.core to be embeeded t o make it sure.


    <parent>
            <groupId>com.webapi</groupId>
            <artifactId>webapi</artifactId>
            <version>0.0.1-SNAPSHOT</version>
            <relativePath>../pom.xml</relativePath>
        </parent>

         <artifactId>webapi.ui.apps</artifactId>
        <packaging>content-package</packaging>
        <name>WEBAPI - UI apps</name>
        <description>UI apps package for WEBAPI</description>

      <build>
        <plugins>
            <plugin>
                    <groupId>com.day.jcr.vault</groupId>
                    <artifactId>content-package-maven-plugin</artifactId>
                    <extensions>true</extensions>
                    <configuration>
                        <filterSource>${basedir}/META-INF/vault/filter.xml</filterSource>
                        <verbose>true</verbose>
                        <failOnError>true</failOnError>
                        <group>package</group>
                        <embeddeds>
                            <embedded>
                                <groupId>com.webapi</groupId>
                                <artifactId>webapi.core</artifactId>
                                <target>/apps/webapi/install</target>
                            </embedded>
                        </embeddeds>
                    </configuration>
                </plugin>
            </plugins>
        </build>
     
     <dependencies>
            <dependency>
                <groupId>com.webapi</groupId>
                <artifactId>webapi.core</artifactId>
                <version>0.0.1-SNAPSHOT</version>
            </dependency>   
    </dependencies>
