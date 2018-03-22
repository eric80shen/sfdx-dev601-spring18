({
	onInit : function(component, event, helper) {
		helper.callServer(component,
                          "c.getInstructors",
                          function(response) {
                              component.set('v.instructors', response);
                          },
                          null,
                          true
        );
	},
    
    onFilterChange : function(component) {
        var e = component.getEvent('onStudentFilterChange');
        e.setParams(
            {
                instructorId : component.get('v.selectedInstructorId'),
                courseDeliveryId : component.get('v.selectedDeliveryId')
        	}
        );
        e.fire();
    }
})