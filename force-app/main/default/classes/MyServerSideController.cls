public with sharing class MyServerSideController {
    
    public enum Permissions{Read, Edit}    
    
    @AuraEnabled
    public static List<Contact> getContacts (String accountName) {
        List<String> fieldsToAccess = new List<String>{'FirstName', 'LastName'};
        if (!checkAllPermissions('Contact', fieldsToAccess, Permissions.Read)) {
            throw new AuraHandledException('Access check failed');
        }
        
        Account acc = [SELECT Id, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE Name=:accountName];
        return acc.Contacts;
    }
    
    public static Boolean checkAllPermissions(String soName, List<String> fields, Permissions permissionRequired) {            
        
        // 1. Start by obtaining the SObjectType token for the sObject             
        Schema.SObjectType soType = Schema.getGlobalDescribe().get(soName);
        
        // 2. Obtain the field name/token map for all fields in this sObject            
        Map<String,Schema.SObjectField> allFields = soType.getDescribe().fields.getMap();
        
        // Are we interested only in Read access
        if (permissionRequired==Permissions.Read) {                
            
            // 3. Check permissions at object level                
            if (!soType.getDescribe().isAccessible()) {                    
                return false;                
            }
            // 4. Check permissions for each field 
            for (String fieldToCheck : fields) {
                if (!allFields.get(fieldToCheck).getDescribe().isAccessible()){
                    return false;                    
                }
            }
        // Or do we want Write access
        } else if (permissionRequired==Permissions.Edit) {                
            // 5. Check permissions at object level                
            if (!soType.getDescribe().isUpdateable()) {                    
                return false;                
            }                
            // 6. Check permissions for each field                
            for (String fieldToCheck : fields) {                    
                if (!allFields.get(fieldToCheck).getDescribe().isUpdateable()) {                     
                    return false;
                }                
            }            
        }                    
        return true;        
    }
}