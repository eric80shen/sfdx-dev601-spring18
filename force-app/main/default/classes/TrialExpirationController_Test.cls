@isTest
private class TrialExpirationController_Test {
    
    private testmethod static void testExpDate () {
        
        Integer daysLeft = TrialExpirationController.getExpirationDaysLeft();
        system.assertNotEquals(null, daysLeft, 'ERROR: Returned null days left');
    }
}