/*

Create an unmanaged package for your AwInstructors Lightning Page and related resources

1.	Create the package.
2.	Add the Component to the Package.
3.	Add Apex Tests.
4.	Add Static Resources.
5.	Upload the Package.
6.	Install the Package into an Org (optional).

One of the existing triggers has a bug in it that will cause the package validation to fail. You must fix all Apex bugs in order to build a valid package.

*/

public with sharing class CourseTriggerHandler {
	
    static final String RETIRED = 'Retired';
    static final String ENROLLED = 'Enrolled';
    static final String SCHEDULED = 'Scheduled';
    static final String CANCELLED = 'Cancelled';
    static final String ERROR_MESSAGE = 'Course has enrolled students';
           
    public static void checkStatus(List<Course__c> triggerNew, Map<Id, Course__c> oldMap, Map<Id, Course__c> newMap)  {
        
        /**
        *  If a Course Status is changed to retired, then we need to
        *  check to see if there are any Course Delivery records marked
        *  as Scheduled and if there is at least one attendee marked
        *  as Enrolled, then the change to retired should not happen 
        *  and an error passed back
        */ 

		// TODO #1: Declare a variable whose type is a Set of type Id named courseIds
        //          and initialize it to a newly constructed Set. 
        Set<Id> courseIds = New Set<Id>();
					
        // Loop through all Course Delivery records to look for attendees
        for ( Course__c course :  triggerNew) {
            if ( oldMap.get(course.Id).Status__c != RETIRED && course.Status__c == RETIRED ) {
			
				// TODO #2: Add the Id field of the course to the set named courseIds.
				courseIds.add(course.Id); 
				
				// TODO #3: Remove the code from line 30 to line 45 (the query and for loop) because 
				//          it has been pasted below outside of the loop
                													
            } 
        }
		
		// TODO #4: Write an if statement that checks
		//          to see if the size of the set named courseIds is greater than 0.
        //          This if will enclose all the remaining code in this class.
        //          You will close the if statement with TODO #9.
		if ( courseIds.size() > 0 ) {
		
			// TODO #5: Replace the assignment of the variable cds with a SOQL for loop
			//          that has an iterator of type List whose elements are Course Delivery objects
			//          named cds. The final } for this loop will be TODO #8 
			// TODO #6: Modify the following SOQL query. Replace the existing WHERE clause in 
			//					the outer query with a new WHERE clause that checks for two conditions:
			//         	1. Check for a course delivery status of SCHEDULED
			//					2. Check that Course__c is IN the Set of courseIds.
			for (List<Course_Delivery__c> cds : [SELECT Id, Course__c, Status__c, 
													(SELECT Status__c FROM Course_Attendees__r 
												   WHERE Status__c = :ENROLLED) 
												   FROM Course_Delivery__c
												   WHERE Course__c IN :courseIds AND Status__c = :SCHEDULED]) { 

			    for ( Course_Delivery__c cd : cds) { 
				// TODO #7: In the if statement remove the first condition check that 
				//          looks to see if the course delivery status is scheduled.
                //          Add a new condition at the beginning of that if that checks 
                //          to see if the Course_Attendees__r is not equal to null.
					if ( cd.Course_Attendees__r != null  && cd.Course_Attendees__r.size() > 0 ) {
						newMap.get(cd.Course__c).addError(ERROR_MESSAGE);
					} else {
						// Change the status of the Course Delivery record to 'Cancelled' 
						cd.Status__c = CANCELLED;
						update cd;   
					}    
			   }
		    // TODO #8: Add the closing } for the SOQL for loop
		    }
		// TODO #9: Add the closing } for the if statement
		}
    }
}

@isTest
private class CourseDeliveryTrigger_Test {

    static final String ACTIVE = 'Active';
    static final String SCHEDULED = 'Scheduled';
    
    // Setup test data
    @testSetup static void setupData(){
     
        User thisUser = [ select Id from User where Id = :UserInfo.getUserId() ];
        System.runAs (thisUser){
            List<Account> testAccounts = LoadDataTestFactory.loadAccounts();
            List<Contact> testContacts = LoadDataTestFactory.loadContacts();
            List<Certification__c> testCerts = LoadDataTestFactory.loadCertifications();
            List<Course__c> testCourses = LoadDataTestFactory.loadCourses();
            Holiday newYearsEve = LoadDataTestFactory.createHoliday();
            List<Course_Delivery__c> testCourseDeliveries = LoadDataTestFactory.loadCourseDeliveries();
        }
        
    }
    
    @isTest
    static void insertCourseDeliverySuccess() {
        
        // Get the first Active Course
        List<Course__c> activeCourses = [SELECT Id, Name FROM Course__c WHERE Status__c = :ACTIVE LIMIT 1];
        Course__c course = activeCourses[0];
                
        Test.startTest();
        
        // Create a new Course Delivery record with a Start Date of 9/1/2015
        Course_Delivery__c courseDelivery = new Course_Delivery__c();
        courseDelivery.Course__c = course.Id;
        courseDelivery.Start_Date__c = Date.newInstance(2015, 9, 1);
        
        // Add it to a list of Course Delivery records that will be passed
        // to the Database.insert method
        List<Course_Delivery__c> deliveries = new List<Course_Delivery__c>();
        deliveries.add(courseDelivery);
        Database.SaveResult[] saveResults = Database.insert(deliveries, false);
        
        Test.stopTest();
        
        // Verify that NO errors are passed back
        Integer errorCount = 0;
        for(Database.SaveResult sr : saveResults) {
            if(!sr.isSuccess()) { 
                if (sr.getErrors()[0].getMessage() == 
                    'Course Delivery cannot be scheduled because it starts on a holiday.')
                    ++errorCount;
            }
        }
        System.assertEquals(0, errorCount);
    }
    
    @isTest
    static void updateCourseDeliverySuccess() {
        
        // Get the first Scheduled Course Delivery record.
        // All the Course Delivery Records were inserted in the TestSetup method
        List<Course_Delivery__c> courseDeliveries = [SELECT Id, Name FROM Course_Delivery__c WHERE Status__c = :SCHEDULED LIMIT 1];
        Course_Delivery__c courseDelivery = courseDeliveries[0];
        
        Test.startTest();
        
        // Update the record with a Start Date of 9/1/2015
        courseDelivery.Start_Date__c = Date.newInstance(2015, 9, 1);
        
        // Add it to a list of Course Delivery records that will be passed
        // to the Database.update method
        List<Course_Delivery__c> deliveries = new List<Course_Delivery__c>();
        deliveries.add(courseDelivery);
        Database.SaveResult[] saveResults = Database.update(deliveries, false);
        
        Test.stopTest();
        
        // Verify that NO errors are passed back
        Integer errorCount = 0;
        for(Database.SaveResult sr : saveResults) {
            if(!sr.isSuccess()) { 
                if (sr.getErrors()[0].getMessage() == 
                    'Course Delivery cannot be scheduled because it starts on a holiday.')
                    ++errorCount;
            }
        }
        System.assertEquals(0, errorCount);
        
    }
}