public with sharing class StudentDetail {

    @AuraEnabled 
    public static List<Course_Attendee__c> getNotesByStudent(String contactId) {
        return [SELECT Id, InstructorNotes__c, Course_Delivery__r.Start_Date__c, 
                       Course_Delivery__r.Course__r.Name, Status__c
				FROM Course_Attendee__c
            	WHERE Student__c = :contactId];
    }   
}