({
    handleEvent : function(component, event, helper) {
        var params = event.getParams();
        component.set("v.childMessage", params.message);
        if ( params.stopPropagation ) {
            event.stopPropagation();
        }
    },

    doAction : function(component, event, helper) {
        var params = event.getParam("arguments");
        if (params) {
            var param1 = params.param1;
            component.set("v.parentMessage", param1);
        }
    }
})