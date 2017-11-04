
STEP 1:
========
install vault by download from adobe aem cloud

https://www.adobeaemcloud.com/content/companies/public/adobe/filevault/filevault.html

or else it has in /opt directly just unzip it.

unzip C:\AEM New Server\crx-quickstart\opt\filevault\filevalut.zip which is default there.

C:\AEM\crx-quickstart\opt\filevault\filevault\vault-cli-3.1.6\bin.


STEP 2:
=======

Add C:\AEM New Server\crx-quickstart\opt\filevault\vault-cli-3.1.6\bin to path system environment variable. to run
from command prompt.

STEP 3:
=======
Checking out the repository 

command:
========
    
    c:\Arun> svn co http://svn.server.com/repos/myproject
    
STEP 4:
=======

Synchronizing with the repository
==================================

You need to synchronize filevault with the repository. To do this:
In the command line, navigate to content/jcr_root.
Check out the repository by typing the following (substituting your port number for 4502 and your admin passwords):

Two ways to check out project

1)command line:
===============
    c:\ARUN>cd c:\Arun\webapi\web.ui.apps\src\main\content\jcr_root
    
    >vlt --credentials admin:admin co --force http://localhost:4502/crx
    
    Mandatory vlt commands works based on filter.xml inside  jcr_root !!!
    if it could find the filter.xml file underneath jrc_root
    it wont work.
    
     To check  in Right <<server Name of AEM created while generating project> export to server

IMPORTANT:
=========
   if some error in jsp right click wont show AEM created server name. so make sure no error shown and then right
   click select aem server > make sure aem server up and running >checkin to crx> view the web page.

2)vaultClipse:
===============
check whether any vaultclipse shown else  check below:

go to Help > installation Details > Installed software > VaultClipse > Update.


To check out files from CRX repository create following directory structure:

    ├───jcr_root
    └───META-INF
           └───vault

Under vault folder create filter.xml file with below content and save the file

    <?xml version="1.0" encoding="UTF-8"?>
     <workspaceFilter version="1.0">
    <filter root="/apps/apps">
        <exclude pattern="/apps/TestWeb/content" />
    </filter>
    <filter root="/apps/TestWeb/" />
    <filter root="/etc/design/apps" />
    </workspaceFilter>

Now open command prompt and go to "jcr_root" folder and enter command - "vlt --credentials : co http://localhost:4502/crx --force", this will check out all files under "/apps/TestWeb/" which we defined in filter.xml file. We can also exclude files by using exclude tag based on the need.

it ignore /apps/TestWeb/content folder.

PROJECT SETUP:
================
create a AEM project using "AEM Sample Multi-Module project"

project structure will be generated as 

    webAPI
        -core
        -it.launcher
        -it.tests
        -ui.apps
        -ui.content
     pom.xml
     
  pom.xml comment unnecessary module since ui.content will be created using site , so need in eclipse. ui.apps is the jsp,html(web) project
  and core is the core components created like servlet, WCMUse components for htl( sightly) templates.
  
      <modules>
        <module>core</module>
        <module>ui.apps</module>
        <!-- <module>ui.content</module>
        <module>it.tests</module>
        <module>it.launcher</module> -->
      </modules>



Example:
=========
To check out TestWeb from http://localhost:4502/crx/de/index.jsp#/apps/TestWeb
    
    <?xml version="1.0" encoding="UTF-8"?>
    <workspaceFilter version="1.0">
        <filter root="/apps/TestWeb">
            <exclude pattern="/apps/TestWeb/components/content" />
        </filter>
        <filter root="/apps/TestWeb/" />
        <filter root="/etc/design/apps" />
    </workspaceFilter>

Above filter.xml will download the Testweb from the CRX repository

    WebApi
    WebApi.core
    WebApi.ui.content
    WebApi.ui.apps
        -src
        -main
           -content
              -jcr_root
              -META-INF
                 -valut
                     -filter.xml

NOTE:
=====
name in eclipse and AEM can be different. only content inside jcr_root will be build in AEM.


command:
=========
above filter.xml filter download only /TESTweb from http://localhost:4502/crx/de/index.jsp#/apps/TestWeb/components/page/page/page.html


    C:\ARUN\workspace\WebApi\ui.apps\src\main\content\jcr_root>vlt --credentials admin:admin 
    co http://localhost:4502/crx --force
    
    command:
    -------
    >vlt --credentials admin:admin co http://localhost:4502/crx --force
    
    Java HotSpot(TM) 64-Bit Server VM warning: ignoring option PermSize=128m; suppor
    t was removed in 8.0
    Checkout http://localhost:4502/crx/server/-/jcr:root/ with local files using roo
    t at C:\ARUN\workspace\SalesForce\scimApi\ui.apps\src\main\content\jcr_root
    Connecting via JCR remoting to http://localhost:4502/crx/server
    [WARN ] Credentials for http://localhost:4502/crx/server/-/jcr:root/ updated in
    C:\Users\ARUN\.vault\auth.xml.
    Checking out / to .
    A etc
    A etc\.content.xml (text/xml)
    A apps
    A apps\.content.xml (text/xml)
    A apps\TestWeb
    A apps\TestWeb\tests
    A apps\TestWeb\tests\.content.xml (text/xml)
    A apps\TestWeb\tests\SampleTests.js (application/javascript)
    A apps\TestWeb\tests\js.txt (text/plain)
    A apps\TestWeb\components
    A apps\TestWeb\components\content
    A apps\TestWeb\components\content\image
    A apps\TestWeb\components\content\image\.content.xml (text/xml)
    A apps\TestWeb\components\content\image\_cq_editConfig.xml (text/xml)
    A apps\TestWeb\components\content\text
    A apps\TestWeb\components\content\text\.content.xml (text/xml)
    A apps\TestWeb\components\content\colctrl
    A apps\TestWeb\components\content\colctrl\.content.xml (text/xml)
    A apps\TestWeb\components\content\colctrl\clientlib
    A apps\TestWeb\components\content\colctrl\clientlib\.content.xml (text/xml)
    A apps\TestWeb\components\content\colctrl\clientlib\css.txt (text/plain)
    A apps\TestWeb\components\content\colctrl\clientlib\style.css (text/css)
    A apps\TestWeb\components\content\title
    A apps\TestWeb\components\content\title\.content.xml (text/xml)
    A apps\TestWeb\components\content\textimage
    A apps\TestWeb\components\content\textimage\.content.xml (text/xml)
    A apps\TestWeb\components\content\textimage\clientlib
    A apps\TestWeb\components\content\textimage\clientlib\.content.xml (text/xml)
    A apps\TestWeb\components\content\textimage\clientlib\css.txt (text/plain)
    A apps\TestWeb\components\content\textimage\clientlib\style.css (text/css)
    A apps\TestWeb\components\content\helloworld
    A apps\TestWeb\components\content\helloworld\.content.xml (text/xml)
    A apps\TestWeb\components\content\helloworld\_cq_dialog
    A apps\TestWeb\components\content\helloworld\_cq_dialog\.content.xml (text/xml)
    A apps\TestWeb\components\content\helloworld\dialog.xml (text/xml)
    A apps\TestWeb\components\content\helloworld\helloworld.html (text/html)
    A apps\TestWeb\components\page
    A apps\TestWeb\components\page\topnav
    A apps\TestWeb\components\page\topnav\.content.xml (text/xml)
    A apps\TestWeb\components\page\topnav\topnav.html (text/html)
    A apps\TestWeb\components\page\topnav\topnav.js (application/javascript)
    A apps\TestWeb\components\page\topnav\clientlib
    A apps\TestWeb\components\page\topnav\clientlib\.content.xml (text/xml)
    A apps\TestWeb\components\page\topnav\clientlib\css.txt (text/plain)
    A apps\TestWeb\components\page\topnav\clientlib\style.css (text/css)
    A apps\TestWeb\components\page\logo
    A apps\TestWeb\components\page\logo\.content.xml (text/xml)
    A apps\TestWeb\components\page\page
    A apps\TestWeb\components\page\page\.content.xml (text/xml)
    A apps\TestWeb\components\page\page\clientlib
    A apps\TestWeb\components\page\page\clientlib\.content.xml (text/xml)
    A apps\TestWeb\components\page\page\clientlib\css.txt (text/plain)
    A apps\TestWeb\components\page\page\clientlib\style.css (text/css)
    A apps\TestWeb\components\page\page\page.html (text/html)
    A apps\TestWeb\components\page\page\partials
    A apps\TestWeb\components\page\page\partials\main.js (application/javascript)
    A apps\TestWeb\components\page\page\partials\headlibs.html (text/html)
    A apps\TestWeb\components\page\page\partials\main.html (text/html)
    A apps\TestWeb\components\page\page\partials\head.js (application/javascript)
    A apps\TestWeb\components\page\page\partials\footlibs.html (text/html)
    A apps\TestWeb\components\page\page\partials\head.html (text/html)
    A apps\TestWeb\templates
    A apps\TestWeb\templates\TestTempate
    A apps\TestWeb\templates\TestTempate\.content.xml (text/xml)
    Checkout done.

    C:\ARUN\workspace\SalesForce\scimApi\ui.apps\src\main\content\jcr_root>

STEP 5:
=======

change the files in apps module
and go to root mvn project C:\ARUN\workspace\WebApi which has embedded with core,apps,content,it.launcher,it.test.
since webApi.ui.apps and webApi.core is the module which we need changes.as we comment other modules in pom.xml.
core - WCMUse htl sightly components.
apps- all web jsp , html pages
etc- all css,js files
lib- main lib components,sightly htl taglibs,cq connect jars ,servlet 404.jsp files.
all jar files will be inside install folder

C:\ARUN\workspace\WebApi> mvn clean install -PautoInstallPackage
