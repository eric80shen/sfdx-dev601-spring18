({
    onCancel : function(component, event, helper) {
        component.find("overlayLib").notifyClose();
    },
    
    // Added to get the Save to work
    onSave : function(component, event, helper) {
        var modalBodyCmp = component.get("v.modalBody");
        modalBodyCmp.saveRecord();        
    }
})