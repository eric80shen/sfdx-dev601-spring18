({
    enableActionButtons : function(component,mode) {
        mode = !mode;
        component.find('btnEmail').set('v.disabled',mode);
        component.find('btnSendCert').set('v.disabled',mode);
        component.find('btnDelete').set('v.disabled',mode);
    },
    
    onDelete: function(component,selectedIds) {
        this.callServer(
            component,
            "c.deleteStudentCertification",
            function(response) {  
                this.refreshData(component);
            },
            {
                certificationIds : selectedIds
            }
        );
    },
    
    refreshData: function(component) {
        this.callServer(
            component,
            "c.getCertifiedStudents",
            function(response) {  
                var aData = [];
                for (var i=0; i<response.length; i++) {
                    aData.push({
                        certificationHeldId: response[i].Id,
                        contactId: response[i].Certified_Professional__r.Id,
                        name: response[i].Certified_Professional__r.Name,
                        date: response[i].Date_Achieved__c,
                        email: response[i].Certified_Professional__r.Email,
                        phone: response[i].Certified_Professional__r.MobilePhone
                    });
                }
                console.log('aData',aData);
                component.set('v.contacts', aData);
            },
            {
                certificationId: component.get('v.certificationId')
            }
        );  
    },
    
    notAvailable : function(component) {
        this.showNotification(
            component,
            "Not Available",
            "",
            $A.get("$Label.c.Feature_Not_Available")
        );
    },
    
    sortData: function (cmp, fieldName, sortDirection) {
        var data = cmp.get("v.contacts");
        var reverse = sortDirection !== 'asc';
        //sorts the rows based on the column header that's clicked
        data.sort(this.sortBy(fieldName, reverse))
        cmp.set("v.contacts", data);
    },

    sortBy: function (field, reverse, primer) {
        var key = primer ?
            function(x) {return primer(x[field])} :
            function(x) {return x[field]};
        //checks if the two rows should switch places
        reverse = !reverse ? 1 : -1;
        return function (a, b) {
            return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
        }
    }
})