<!-- TestApp.app -->
<aura:application extends="force:slds">
    
    <aura:attribute name="title" type="String" default="Title"/>
    <aura:attribute name="message" type="String" default="Message"/>
    
    <div class="panel panel-default">
        <div class="panel-heading">{!v.title}</div>
        <div class="panel-body">
            {!v.message}
        </div>
    </div>
    
</aura:application>

<!--

https://mydomain.lightning.force.com/c/HelloWorld.app?title=Hello&message=World

-->