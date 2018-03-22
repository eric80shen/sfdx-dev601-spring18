({
    loadRecord : function(component, event, helper) {
        component.find('deleterecord').reloadRecord();      
    },
    
    deleteRecord : function(component, event, helper) {
        component.find("deleterecord").deleteRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // record is deleted successfully
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Deleted",
                    "message": "The record was deleted."
                });
                resultsToast.fire();
            } else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
        }));
    }
})