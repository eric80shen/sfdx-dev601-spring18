({
    onHandle : function(component, event, helper) {
        console.log("Event handled: " + event.getPhase() + ": Component: " + component.getName());
    },

    onClick : function(component, event, helper) {
        component.getEvent("BC_EVName").fire();
    }
})