({
    onStudentSelected : function(component, event, helper) {
        var contactId = event.getParam('contactId');
        var courseDeliveryId = event.getParam('contactId');
        component.set('v.contactId',contactId);
        component.set('v.courseDeliveryId', courseDeliveryId);
        component.find('recordLoader').reloadRecord();
        
        helper.callServer(
            component,
            "c.getNotesByStudent",
            function(response) {
                component.set('v.history', response);
                //var aResults = [];
                //
                //for (var i=0; i<response.length; i++) {
                //    var obj = {
                //        courseAttendeeId: response[i].Id,
                //        startDate: response[i].Course_Delivery__r.Start_Date__c,
                //        courseName: response[i].Course_Delivery__r.Course__r.Name
                //    }
                //    if (response[i].InstructorNotes__c) {
                //        obj.instructorNotes = response[i].InstructorNotes__c;
                //    } else {
                //        obj.instructorNotes = "No notes";
                //    }
                //    aResults.push(obj);                
            },
            {
                contactId : contactId
            }
        );
    },
    
    goToRecord : function(component, event, helper) {
        var evt = $A.get("event.force:navigateToSObject");
        if (evt) {
            evt.setParams({
                "recordId": component.get('v.contactId'),
                "slideDevName": "detail"
            });
            evt.fire();
        } else {
            alert('Feature not supported on this platform');
        }        
    }
})