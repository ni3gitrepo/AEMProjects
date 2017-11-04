
http://blogs.adobe.com/experiencedelivers/experience-management/clientlibs-explained-exampl

create a root folder
====================

STEP 1:
======
/etc/webapp/

name the webapp root folder 
jcr:primaryType: cq:clientlibFolder


node of type “cq:ClientLibraryFolder“


STEP 2:
=======
you can add categories: string[]

Add a property to every “clientlib” node called “categories” of type String[] with the
single value of “myproject.components” (to get a String[] type click the “Multi” button).


Step 3: Adding JavaScript and CSS resources
===========================================
name should be same i.e js.txt and css.txt
name 

1)js.txt
     add javascript files- jquery.js
     bootstrap.js
     dojo.js
2)css.txt
      menu.css
      
      
use client lib in component by

NOTE:
=====

wheh hit /etc/webapp/js/wbapapi.js
it adds jquery.js,bootstrap.js , dojo.js combined to one file.


these temp files gets stored in /var/clientlib/webapp
