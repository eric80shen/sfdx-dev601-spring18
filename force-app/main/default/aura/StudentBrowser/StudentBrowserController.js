({
    doInit : function(component, event, helper) {
        helper.onInit(component, event, helper);
    },
    
    onStudentFilterChange : function(component, event, helper) {
        var instructorId = event.getParam('instructorId');
        var courseDeliveryId = event.getParam('courseDeliveryId');
        component.set('v.selectedCourseDeliveryId', courseDeliveryId);
        helper.queryStudents(component, helper, instructorId, courseDeliveryId);
    },
    
    onStudentSelected : function(component, event, helper) {
        var contactId = event.getParam('contactId');
        component.set('v.selectedContactId',contactId);
        helper.broadcastStudentSelected(component);
        
        component.find('datagrid').setSelection(contactId);
    },
    
    onDataGridRowClick: function(component,event,helper) {
        component.set('v.selectedContactId', event.getParam('pk'));
        helper.broadcastStudentSelected(component);        
    },
    
    onContactEdit : function(component,event,helper) {
        var title = "Edit Contact - ";
        var contactId = event.getParam('pk');
        var rec = event.getParam('rec');
        if (rec) {
            title += rec.Name;
        }
        // insert code here
        $A.createComponents([
            ["c:EditSObject", {Id: contactId}],
            ["c:EditSObjectFooter", {}]
        ],
        function(components, status) {
            if (status === "SUCCESS") {
                var modalBody = components[0];              // Added to get the Save to work
                var modalFooter = components[1];            // Added to get the Save to work
                modalFooter.set('v.modalBody', modalBody);  // Added to get the Save to work            
                component.find('overlayLib').showCustomModal({
                    header: title,
                    body: components[0], 
                    footer: components[1],
                    showCloseButton: true,
                    cssClass: "",
                    closeCallback: function() {
                        alert('You closed the alert!');
                    }
                });
            }
        });
    }
})