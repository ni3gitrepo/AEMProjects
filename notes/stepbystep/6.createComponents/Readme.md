Create Component:
==================
Two ways.

1)right click on main root folder and create component

2)on top left click > create>create Node > Name : test > for Type combo give cq:component.
This way 
you can define node as  any of these

1)cq:Dialog - to Edit information in AEM.
2)cq:Template - To define template
3)cq:EditConfig -
  
    cq:editConfig node properties:
    cq:actions (String array): defines the actions that can be performed on the component.
    cq:layout (String): : defines how the component is edited.
    cq:dialogMode (String): defines how the component dialog is opened.
    cq:emptyText (String): defines text that is displayed when no visual content is present.
    cq:inherit (Boolean): defines if missing values are inherited from the component that it inherits from.

cq:editConfig child nodes:

    cq:dropTargets (node type nt:unstructured): defines a list of drop targets that can accept a
        drop from an asset of the content finder.
    cq:actionConfigs (node type nt:unstructured): defines a list of new actions that are appended to the
       cq:actions list.
    cq:formParameters (node type nt:unstructured): defines additional parameters that are added to the dialog form.
    cq:inplaceEditing (node type cq:InplaceEditingConfig): defines an inplace editing configuration for 
        the component.
    cq:listeners (node type cq:EditListenersConfig): defines what happens before or after an action 
       occurs on the component.
    
    
4)cq:ClientLibraryFolder - js base folder
5)cq:Page - to define resuable page.
5)cq:PageContent-
