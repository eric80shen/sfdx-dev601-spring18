// Apex Classes

// BoatSearchResults
public with sharing class BoatSearchResults {
    
    @AuraEnabled
    public static List<BoatType__c> getBoatTypes() {
        return [SELECT Id, Name FROM BoatType__c];        
    }
    
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId) {
        String query = 'SELECT Id, Name, Picture__c, Contact__r.Name, Geolocation__latitude__s, Geolocation__longitude__s FROM Boat__c';
        
        if (boatTypeId != '') {
            query = query + ' WHERE BoatType__c = :boatTypeId';
        }
        
        return Database.query(query);
    }
}

// BoatReviews
public with sharing class BoatReviews {
    
    @AuraEnabled
    public static List<BoatReview__c> getAll(Id boatId) {
        return [SELECT Id, Name, Comment__c, Rating__c, 
                LastModifiedDate, CreatedDate, CreatedBy.Name, CreatedBy.SmallPhotoUrl, CreatedBy.CompanyName
                FROM BoatReview__c
                WHERE Boat__c = :boatId];
    }
}