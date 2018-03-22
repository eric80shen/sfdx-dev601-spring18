({
    doInit: function(component, event, helper) {
        
        component.set('v.columns', [    
            {label: 'Name', fieldName: 'name', type: 'text', sortable: true},
            {label: 'Date', fieldName: 'date', type: 'datetime', sortable: true},
            {label: 'Email', fieldName: 'email', type: 'email', sortable: true},
            {label: 'Contact Phone', fieldName: 'phone', type: 'phone'}        
        ]);
    },
    
    onRowSelection: function(component,event,helper) {
        helper.enableActionButtons(component,event.getParam('selectedRows').length > 0);
    },
    
    onCertificationIdChange: function(component,event,helper) {
        helper.refreshData(component);
    },
    
    onCertActions: function(component,event,helper) {
        var action =  event.getSource().getLocalId();
        var selections = component.find('datatable').getSelectedRows();
        
        var selectedIds = [];
        for (var i = 0; i < selections.length; i++){
            selectedIds.push(selections[i].certificationHeldId);
        }
        selectedIds = selectedIds.join(',');
        
        switch(action) {
            case 'btnEmail' : 
                helper.notAvailable(component);
                break;
            case 'btnSendCert' :
                helper.notAvailable(component);
                break;
            case 'btnDelete' :
                helper.onDelete(component,selectedIds);
                break;
        }
    },
    
    onMySort:function(component,event,helper){
        var fieldName = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        // assign the latest attribute with the sorted column fieldName and sorted direction
        component.set("v.sortedBy", fieldName);
        component.set("v.sortedDirection", sortDirection);
        helper.sortData(component, fieldName, sortDirection);
    }
})