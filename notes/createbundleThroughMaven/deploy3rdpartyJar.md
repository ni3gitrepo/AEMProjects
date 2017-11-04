
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
