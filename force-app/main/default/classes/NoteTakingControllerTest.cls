@isTest
private class NoteTakingControllerTest {

    @isTest
    static void testCreateNoteRecord() {
        // Test data setup
        String title = 'Test Note';
        String description = 'This is a test note description.';

        // Test the scenario when title is not blank
        Test.startTest();
        Boolean result = NoteTakingController.createNoteRecord(title, description);
        Test.stopTest();

        // Assert the results
        System.assertEquals(true, result, 'Expected the method to return true for a non-blank title.');

        // Verify that the record was inserted successfully
        List<My_Note__c> notes = [SELECT Id, Name, Note_Description__c FROM My_Note__c WHERE Name = :title];
        System.assertEquals(1, notes.size(), 'Expected one My_Note__c record to be inserted.');
        My_Note__c insertedNote = notes[0];
        System.assertEquals(title, insertedNote.Name, 'Title of the inserted note does not match.');
        System.assertEquals(description, insertedNote.Note_Description__c, 'Description of the inserted note does not match.');

        // Test the scenario when title is blank
        Test.startTest();
        result = NoteTakingController.createNoteRecord('', description);
        Test.stopTest();

        // Assert the results
        System.assertEquals(false, result, 'Expected the method to return false for a blank title.');

        // Verify that no new record was inserted when the title is blank
        notes = [SELECT Id, Name, Note_Description__c FROM My_Note__c WHERE Name = :title];
        System.assertEquals(1, notes.size(), 'Expected no new My_Note__c record to be inserted for blank title.');
    }
}