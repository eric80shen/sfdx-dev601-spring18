({
    doInit : function(component, event, helper) {
        var history = component.get('v.history');
        if (history.length > 0) {
            component.set('v.courseAttendeeId',history[0].Id );
            //component.set('v.courseAttendeeId', history[0].courseAttendeeId);            
            component.find("recordEditor").reloadRecord();    
        }         
    },
    
    onCourseAttendeeChange : function(component, event, helper) {
        component.find("recordEditor").reloadRecord(); 		
    },
    
    saveRecord : function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {       
                helper.showToast(component,'','Record Saved','Huzzah!','success');
            } else if (saveResult.state === "INCOMPLETE") {
                helper.showNotification(component,'','Ooops','User is offline, device doesn\'t support drafts.','warning');      
            } else if (saveResult.state === "ERROR") {
                helper.showNotification(component,'','Problem saving record',JSON.stringify(saveResult.error),'error');      
                
            } else {
                helper.showNotification(component,'','Unknown problem','state' +  saveResult.state + ', error: ' + JSON.stringify(saveResult.error),'error');      
            }   
        }));
    }    
})