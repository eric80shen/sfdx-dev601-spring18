({
    onHandle : function(component, event, helper) {
        console.log("Event handled: " + event.getPhase() + ": Component: " + component.getName());
    }
})