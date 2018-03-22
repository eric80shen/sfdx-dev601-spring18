({
    fireComponentEvent : function(component, event, helper) {
        var cmpEvent = component.getEvent("grandChildClicked");

        cmpEvent.setParams({
            message : component.get("v.grandChildMessage"),
            stopPropagation : component.get("v.stopPropagation")
        });
        cmpEvent.fire();
    },

    fireApplicationEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:TestAppEvent");

        appEvent.setParams({
            message : component.get("v.grandChildMessage"),
            stopPropagation : component.get("v.stopPropagation")
        });
        appEvent.fire();
    }    
})