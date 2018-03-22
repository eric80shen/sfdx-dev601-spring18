({
    handleEvent : function(component, event, helper) {
        var params = event.getParams();
        component.set("v.parentMessage", params.message);
        if ( params.stopPropagation ) {
            event.stopPropagation();
        }
    },
    
    onButtonPress : function(component, event, helper) {
        var childCmp = component.find("testChild");
        childCmp.sampleMethod(component.get("v.parentMessage"));
    }
})