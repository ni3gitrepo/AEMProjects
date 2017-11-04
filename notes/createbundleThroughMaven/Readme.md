To create a bundle use the plugin
===================================


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
              <!-- <Embed-Dependency> artifactId1, artifactId2;inline=true </Embed-Dependency> -->
              <!--   <Sling-Model-Packages>
                com.webapi.servlet
              </Sling-Model-Packages>

              <Import-Package>

              </Import-Package>  --> 
            </instructions>
          </configuration>
        </plugin>
      </plugins>
    </build>
