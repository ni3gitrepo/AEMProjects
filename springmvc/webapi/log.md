
G:\workspace\AEM\webapi>mvn clean install -PautoInstallPackage
      
      [INFO] Scanning for projects...
      [WARNING]
      [WARNING] Some problems were encountered while building the effective model for
      com.shop:webapi.core:bundle:0.0.1-SNAPSHOT
      [WARNING] 'dependencies.dependency.systemPath' for ojdbc:ojdbc_14g:jar should no
      t point at files within the project directory, ${project.basedir}/lib/ojdbc14_g.
      jar will be unresolvable by dependent projects @ com.shop:webapi.core:[unknown-v
      ersion], G:\workspace\AEM\webapi\core\pom.xml, line 187, column 21
      [WARNING] 'build.plugins.plugin.version' for org.apache.maven.plugins:maven-comp
      iler-plugin is missing. @ com.shop:webapi:0.0.1-SNAPSHOT, G:\workspace\AEM\webap
      i\pom.xml, line 58, column 12
      [WARNING]
      [WARNING] Some problems were encountered while building the effective model for
      com.shop:webapi.ui.apps:content-package:0.0.1-SNAPSHOT
      [WARNING] 'build.plugins.plugin.version' for org.apache.maven.plugins:maven-comp
      iler-plugin is missing. @ com.shop:webapi:0.0.1-SNAPSHOT, G:\workspace\AEM\webap
      i\pom.xml, line 58, column 12
      [WARNING]
      [WARNING] Some problems were encountered while building the effective model for
      com.shop:webapi.dependencies:content-package:0.0.1-SNAPSHOT
      [WARNING] 'dependencies.dependency.systemPath' for ojdbc:ojdbc_14g:jar should no
      t point at files within the project directory, ${project.basedir}/lib/ojdbc14_g.
      jar will be unresolvable by dependent projects @ com.shop:webapi.dependencies:[u
      nknown-version], G:\workspace\AEM\webapi\dependencies\pom.xml, line 39, column 2
      1
      [WARNING] 'build.plugins.plugin.version' for org.apache.maven.plugins:maven-comp
      iler-plugin is missing. @ com.shop:webapi:0.0.1-SNAPSHOT, G:\workspace\AEM\webap
      i\pom.xml, line 58, column 12
      [WARNING] 'build.plugins.plugin.version' for org.apache.maven.plugins:maven-reso
      urces-plugin is missing. @ com.shop:webapi.dependencies:[unknown-version], G:\wo
      rkspace\AEM\webapi\dependencies\pom.xml, line 120, column 19
      [WARNING]
      [WARNING] Some problems were encountered while building the effective model for
      com.shop:webapi:pom:0.0.1-SNAPSHOT
      [WARNING] 'build.plugins.plugin.version' for org.apache.maven.plugins:maven-comp
      iler-plugin is missing. @ line 58, column 12
      [WARNING]
      [WARNING] It is highly recommended to fix these problems because they threaten t
      he stability of your build.
      [WARNING]
      [WARNING] For this reason, future Maven versions might no longer support buildin
      g such malformed projects.
      [WARNING]
      [INFO] ------------------------------------------------------------------------
      [INFO] Reactor Build Order:
      [INFO]
      [INFO] webapi
      [INFO] webapi - Core
      [INFO] webapi - UI apps
      [INFO] test - Dependencies
      [INFO]
      [INFO] ------------------------------------------------------------------------
      [INFO] Building webapi 0.0.1-SNAPSHOT
      [INFO] ------------------------------------------------------------------------[INFO]
      [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ webapi ---
      [INFO]
      [INFO] --- maven-scr-plugin:1.17.0:scr (generate-scr-scrdescriptor) @ webapi ---

      [INFO]
      [INFO] --- maven-install-plugin:2.4:install (default-install) @ webapi ---
      [INFO] Installing G:\workspace\AEM\webapi\pom.xml to C:\Users\HOME\.m2\repositor
      y\com\shop\webapi\0.0.1-SNAPSHOT\webapi-0.0.1-SNAPSHOT.pom
      [INFO]
      [INFO] --- maven-antrun-plugin:1.1:run (default) @ webapi ---
      [INFO] Executing tasks
           [echo] Base Dir:::::::::::G:\workspace\AEM\webapi
           [echo] base:::::::::::::::G:\workspace\AEM\webapi
           [echo] [project.artifactId] webapi
      [INFO] Executed tasks
      [INFO]
      [INFO] --- maven-sling-plugin:2.1.0:install (default) @ webapi ---
      [INFO] G:\workspace\AEM\webapi\target\webapi-0.0.1-SNAPSHOT.jar is not an OSGi B
      undle, not uploading
      [INFO]
      [INFO] ------------------------------------------------------------------------
      [INFO] Building webapi - Core 0.0.1-SNAPSHOT
      [INFO] ------------------------------------------------------------------------
      [INFO]
      [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ webapi.core ---
      [INFO] Deleting G:\workspace\AEM\webapi\core\target
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:resources (default-resources) @ webapi.c
      ore ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] Copying 1 resource
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:compile (default-compile) @ webapi.core -
      --
      [INFO] Changes detected - recompiling the module!
      [INFO] Compiling 13 source files to G:\workspace\AEM\webapi\core\target\classes
      [INFO]
      [INFO] --- maven-scr-plugin:1.17.0:scr (generate-scr-scrdescriptor) @ webapi.cor
      e ---
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:testResources (default-testResources) @
      webapi.core ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\core\src\test
      \resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:testCompile (default-testCompile) @ webap
      i.core ---
      [INFO] No sources to compile
      [INFO]
      [INFO] --- maven-surefire-plugin:2.20:test (default-test) @ webapi.core ---
      [INFO] No tests to run.
      [INFO]
      [INFO] --- maven-bundle-plugin:2.5.0:bundle (default-bundle) @ webapi.core ---
      [INFO]
      [INFO] --- maven-install-plugin:2.5.2:install (default-install) @ webapi.core --
      -
      [INFO] Installing G:\workspace\AEM\webapi\core\target\webapi.core-0.0.1-SNAPSHOT
      .jar to C:\Users\HOME\.m2\repository\com\shop\webapi.core\0.0.1-SNAPSHOT\webapi.
      core-0.0.1-SNAPSHOT.jar
      [INFO] Installing G:\workspace\AEM\webapi\core\pom.xml to C:\Users\HOME\.m2\repo
      sitory\com\shop\webapi.core\0.0.1-SNAPSHOT\webapi.core-0.0.1-SNAPSHOT.pom
      [INFO]
      [INFO] --- maven-bundle-plugin:2.5.0:install (default-install) @ webapi.core ---

      [INFO] Installing com/shop/webapi.core/0.0.1-SNAPSHOT/webapi.core-0.0.1-SNAPSHOT
      .jar
      [INFO] Writing OBR metadata
      [INFO]
      [INFO] --- maven-antrun-plugin:1.1:run (default) @ webapi.core ---
      [INFO] Executing tasks
           [echo] Base Dir:::::::::::G:\workspace\AEM\webapi\core
           [echo] base:::::::::::::::G:\workspace\AEM\webapi\core
           [echo] [project.artifactId] webapi.core
      [INFO] Executed tasks
      [INFO]
      [INFO] --- maven-sling-plugin:2.1.0:install (default) @ webapi.core ---
      [INFO] Installing Bundle com.shop.webapi.core(G:\workspace\AEM\webapi\core\targe
      t\webapi.core-0.0.1-SNAPSHOT.jar) to http://localhost:4502/crx/repository/crx.de
      fault/apps/webApi/install/ via PUT
      [INFO] Bundle installed
      [INFO]
      [INFO] --- maven-sling-plugin:2.1.0:install (install-bundle) @ webapi.core ---
      [INFO] Installing Bundle com.shop.webapi.core(G:\workspace\AEM\webapi\core\targe
      t\webapi.core-0.0.1-SNAPSHOT.jar) to http://localhost:4502/crx/repository/crx.de
      fault/apps/webApi/install/ via PUT
      [INFO] Bundle installed
      [INFO]
      [INFO] ------------------------------------------------------------------------
      [INFO] Building webapi - UI apps 0.0.1-SNAPSHOT
      [INFO] ------------------------------------------------------------------------
      [INFO]
      [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ webapi.ui.apps ---
      [INFO] Deleting G:\workspace\AEM\webapi\ui.apps\target
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:resources (default-resources) @ webapi.u
      i.apps ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\ui.apps\src\m
      ain\resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:compile (default-compile) @ webapi.ui.app
      s ---
      [INFO] Nothing to compile - all classes are up to date
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:check-signature (default-check-si
      gnature) @ webapi.ui.apps ---
      [INFO] No signature defined. Skipping signature check.
      [INFO]
      [INFO] --- maven-scr-plugin:1.17.0:scr (generate-scr-scrdescriptor) @ webapi.ui.
      apps ---
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:testResources (default-testResources) @
      webapi.ui.apps ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\ui.apps\src\t
      est\resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:testCompile (default-testCompile) @ webap
      i.ui.apps ---
      [INFO] Nothing to compile - all classes are up to date
      [INFO]
      [INFO] --- maven-surefire-plugin:2.20:test (default-test) @ webapi.ui.apps ---
      [INFO] No tests to run.
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:package (default-package) @ webap
      i.ui.apps ---
      [INFO] Embedding --- Embedded: groupId=com.shop,artifactId=webapi.core,filter=fa
      lse,excludeTransitive=false,target=/apps/webApi/install/ ---
      [INFO] Embedding com.shop:webapi.core:jar:0.0.1-SNAPSHOT (from G:\workspace\AEM\
      webapi\core\target\webapi.core-0.0.1-SNAPSHOT.jar) -> jcr_root/apps/webApi/insta
      ll/webapi.core-0.0.1-SNAPSHOT.jar
      [INFO] Building content-package: G:\workspace\AEM\webapi\ui.apps\target\webapi.u
      i.apps-0.0.1-SNAPSHOT.zip
      [INFO]
      [INFO] --- maven-install-plugin:2.5.2:install (default-install) @ webapi.ui.apps
       ---
      [INFO] Installing G:\workspace\AEM\webapi\ui.apps\target\webapi.ui.apps-0.0.1-SN
      APSHOT.zip to C:\Users\HOME\.m2\repository\com\shop\webapi.ui.apps\0.0.1-SNAPSHO
      T\webapi.ui.apps-0.0.1-SNAPSHOT.zip
      [INFO] Installing G:\workspace\AEM\webapi\ui.apps\pom.xml to C:\Users\HOME\.m2\r
      epository\com\shop\webapi.ui.apps\0.0.1-SNAPSHOT\webapi.ui.apps-0.0.1-SNAPSHOT.p
      om
      [INFO]
      [INFO] --- maven-antrun-plugin:1.1:run (default) @ webapi.ui.apps ---
      [INFO] Executing tasks
           [echo] Base Dir:::::::::::G:\workspace\AEM\webapi\ui.apps
           [echo] base:::::::::::::::G:\workspace\AEM\webapi\ui.apps
           [echo] [project.artifactId] webapi.ui.apps
      [INFO] Executed tasks
      [INFO]
      [INFO] --- maven-sling-plugin:2.1.0:install (default) @ webapi.ui.apps ---
      [INFO] G:\workspace\AEM\webapi\ui.apps\target\webapi.ui.apps-0.0.1-SNAPSHOT.jar
      is not an OSGi Bundle, not uploading
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:install (install-package) @ webap
      i.ui.apps ---
      [INFO] Installing webapi.ui.apps (G:\workspace\AEM\webapi\ui.apps\target\webapi.
      ui.apps-0.0.1-SNAPSHOT.zip) to http://localhost:4502/crx/packmgr/service.jsp
      [INFO] webapi.ui.apps, 0.0.1-SNAPSHOT (5189930 bytes)
      [INFO]     Created : Tue, 16 May 2017 00:01:49 -0700 by HOME
      [INFO]     Modified: -
      [INFO]     Unpacked: Mon, 15 May 2017 23:48:59 -0700 by admin
      [INFO]
      [INFO] Installing content...
      Collecting import information...
      Installing node types...
      Installing privileges...
      Importing content...
      - /apps/webApi/install/webapi.core-0.0.1-SNAPSHOT.jar
      saving approx 0 nodes...
      Package imported.
      Package installed in 523ms.
      [INFO]
      [INFO] ------------------------------------------------------------------------
      [INFO] Building test - Dependencies 0.0.1-SNAPSHOT
      [INFO] ------------------------------------------------------------------------
      [INFO]
      [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ webapi.dependencies --
      -
      [INFO] Deleting G:\workspace\AEM\webapi\dependencies\target
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:resources (default-resources) @ webapi.d
      ependencies ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\dependencies\
      target\webapi.dependencies-0.0.1-SNAPSHOT\jcr_root
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:compile (default-compile) @ webapi.depend
      encies ---
      [INFO] Nothing to compile - all classes are up to date
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:check-signature (default-check-si
      gnature) @ webapi.dependencies ---
      [INFO] No signature defined. Skipping signature check.
      [INFO]
      [INFO] --- maven-scr-plugin:1.17.0:scr (generate-scr-scrdescriptor) @ webapi.dep
      endencies ---
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:testResources (default-testResources) @
      webapi.dependencies ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\dependencies\
      src\test\resources
      [INFO]
      [INFO] --- maven-compiler-plugin:3.6.1:testCompile (default-testCompile) @ webap
      i.dependencies ---
      [INFO] No sources to compile
      [INFO]
      [INFO] --- maven-surefire-plugin:2.20:test (default-test) @ webapi.dependencies
      ---
      [INFO] No tests to run.
      [INFO]
      [INFO] --- maven-assembly-plugin:2.2-beta-5:single (default) @ webapi.dependenci
      es ---
      [INFO] Reading assembly descriptor: src/assembly/assembly.xml
      [INFO] Copying files to G:\workspace\AEM\webapi\dependencies\target\vault-work
      [WARNING] Assembly file: G:\workspace\AEM\webapi\dependencies\target\vault-work
      is not a regular file (it may be a directory). It cannot be attached to the proj
      ect build for installation or deployment.
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:package (default-package) @ webap
      i.dependencies ---
      [INFO] Building content-package: G:\workspace\AEM\webapi\dependencies\target\web
      api.dependencies-0.0.1-SNAPSHOT.zip
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:package (default) @ webapi.depend
      encies ---
      [INFO] Building content-package: G:\workspace\AEM\webapi\dependencies\target\web
      api.dependencies-0.0.1-SNAPSHOT.zip
      [INFO]
      [INFO] --- maven-resources-plugin:3.0.2:resources (default) @ webapi.dependencie
      s ---
      [WARNING] Using platform encoding (Cp1252 actually) to copy filtered resources,
      i.e. build is platform dependent!
      [INFO] skip non existing resourceDirectory G:\workspace\AEM\webapi\dependencies\
      target\webapi.dependencies-0.0.1-SNAPSHOT\jcr_root
      [INFO]
      [INFO] --- maven-install-plugin:2.5.2:install (default-install) @ webapi.depende
      ncies ---
      [INFO] Installing G:\workspace\AEM\webapi\dependencies\target\webapi.dependencie
      s-0.0.1-SNAPSHOT.zip to C:\Users\HOME\.m2\repository\com\shop\webapi.dependencie
      s\0.0.1-SNAPSHOT\webapi.dependencies-0.0.1-SNAPSHOT.zip
      [INFO] Installing G:\workspace\AEM\webapi\dependencies\pom.xml to C:\Users\HOME\
      .m2\repository\com\shop\webapi.dependencies\0.0.1-SNAPSHOT\webapi.dependencies-0
      .0.1-SNAPSHOT.pom
      [INFO]
      [INFO] --- maven-antrun-plugin:1.1:run (default) @ webapi.dependencies ---
      [INFO] Executing tasks
           [echo] Base Dir:::::::::::G:\workspace\AEM\webapi\dependencies
           [echo] base:::::::::::::::G:\workspace\AEM\webapi\dependencies
           [echo] [project.artifactId] webapi.dependencies
      [INFO] Executed tasks
      [INFO]
      [INFO] --- maven-sling-plugin:2.1.0:install (default) @ webapi.dependencies ---
      [INFO] G:\workspace\AEM\webapi\dependencies\target\webapi.dependencies-0.0.1-SNA
      PSHOT.jar is not an OSGi Bundle, not uploading
      [INFO]
      [INFO] --- content-package-maven-plugin:0.0.23:install (install-package) @ webap
      i.dependencies ---
      [INFO] Installing webapi.dependencies (G:\workspace\AEM\webapi\dependencies\targ
      et\webapi.dependencies-0.0.1-SNAPSHOT.zip) to http://localhost:4502/crx/packmgr/
      service.jsp
      [INFO] webapi.dependencies, 0.0.1-SNAPSHOT (2599277 bytes)
      [INFO] ------------------------------------------------------------------------
      [INFO] Reactor Summary:
      [INFO]
      [INFO] webapi ............................................. SUCCESS [  1.207 s]
      [INFO] webapi - Core ...................................... SUCCESS [ 17.384 s]
      [INFO] webapi - UI apps ................................... SUCCESS [  5.113 s]
      [INFO] test - Dependencies ................................ SUCCESS [  3.333 s]
      [INFO] ------------------------------------------------------------------------
      [INFO] BUILD SUCCESS
      [INFO] ------------------------------------------------------------------------
      [INFO] Total time: 29.762 s
      [INFO] Finished at: 2017-05-16T00:01:56-07:00
      [INFO] Final Memory: 41M/536M
      [INFO] ------------------------------------------------------------------------

      G:\workspace\AEM\webapi>
