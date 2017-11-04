                                                        Slightly
                                                        ========
                                                        
                                                        
Steps to add client using slightly.
  
/etc/designs/webapi/clientlib
==============================

make property of /etc/designs/webapi/clientlib folder as CQ:clientLibraryFolder as below:

i.e clientlib folder should be CQ:clientLibraryFolder 

NOTE:
====
do by Create > Node > Enter Name as clientlib > Type as "CQ:clientLibraryFolder" in combo.


Name |  Type | value

=========================

categories | String[] | webjsscript

jcr:primaryType| 	Name|cq:ClientLibraryFolder



Folder Hierarchy under Webapi
==============================

/etc/designs/webapi/clientlib

                 -  css
                 -  css.txt
                 -  images
                 -  js
                      -ajax.js
                 -  js.txt
                 
 i.e like /etc/designs/webapi/clientlib/css 
 /etc/designs/webapi/clientlib/css.txt
 
 /etc/designs/webapi/clientlib/js.txt
 ===================================
    #base=js
    ajax.js
 

To Access JS -slightly
============================


    <sly data-sly-use.clientLib="${'/libs/granite/sightly/templates/clientlib.html'}" data-sly-unwrap />

    <sly data-sly-call="${clientLib.js @ categories='webjsscript'}" data-sly-unwrap />


                                                  CQ LIB
                                                  =======
  
  
To Access JS - CQ5 Tags
=========================
  
    <%@include file="/libs/foundation/global.jsp"%>

it is included in global.jsp if global.jsp is included no need of it.

    <%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>

    <cq:includeClientLib css="cq.collab.calendar, cq.security" />
   
  
  
  Advantages and disadvantages:
  ==============================
  
  cq:includelib only can be done in jsp since it needs global.jsp to be include to load tag lib.
