({
	onContactIdChange  : function(component, event, helper) {
        helper.callServer(
            component,
            "c.getCertificationsForStudent",
            function(response) {  
                component.set('v.certs', response);
            },
            {
                contactId : component.get('v.contactId')
            }
        );
	}
})