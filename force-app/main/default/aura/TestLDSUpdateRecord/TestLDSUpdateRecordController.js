({
    loadRecord : function(component, event, helper) {
        component.find('editrecord').reloadRecord();        
    },
    
    updateRecord : function(component, event, helper) {
        component.find("editrecord").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // record is updated successfully
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Updated",
                    "message": "The record was updated."
                });
                resultsToast.fire();
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    }
})