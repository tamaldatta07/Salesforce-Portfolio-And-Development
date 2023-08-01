@isTest
public class NoteTakingControllerTest {
    @isTest
    static void testCreateNoteRecord() {
        Test.startTest();
        Boolean result = NoteTakingController.createNoteRecord('Test Title', 'Test Description');
        Test.stopTest();

        System.assert(result, 'Note record was not created successfully');
        List<My_Note__c> notes = [SELECT Id, Name, Note_Description__c FROM My_Note__c];
        System.assertEquals(1, notes.size(), 'Incorrect number of note records');
        System.assertEquals('Test Title', notes[0].Name, 'Incorrect note title');
        System.assertEquals('Test Description', notes[0].Note_Description__c, 'Incorrect note description');
        
        // Test blank title
        result = NoteTakingController.createNoteRecord('', 'Test Description');
        System.assert(!result, 'Note record should not be created with blank title');
    }

    @isTest
    static void testGetNotes() {
        // Insert a test note record
        My_Note__c note = new My_Note__c(Name='Test Title', Note_Description__c='Test Description');
        insert note;

        Test.startTest();
        List<My_Note__c> result = NoteTakingController.getNotes();
        Test.stopTest();

        System.assertEquals(1, result.size(), 'Incorrect number of note records');
        System.assertEquals('Test Title', result[0].Name, 'Incorrect note title');
        System.assertEquals('Test Description', result[0].Note_Description__c, 'Incorrect note description');
    }

    @isTest
    static void testUpdateNoteRecord() {
        // Insert a test note record
        My_Note__c note = new My_Note__c(Name='Test Title', Note_Description__c='Test Description');
        insert note;

        Test.startTest();
        Boolean result = NoteTakingController.updateNoteRecord(note.Id, 'Updated Title', 'Updated Description');
        Test.stopTest();

        System.assert(result, 'Note record was not updated successfully');
        My_Note__c updatedNote = [SELECT Id, Name, Note_Description__c FROM My_Note__c WHERE Id = :note.Id];
        System.assertEquals('Updated Title', updatedNote.Name, 'Incorrect note title');
        System.assertEquals('Updated Description', updatedNote.Note_Description__c, 'Incorrect note description');
        
        // Test blank noteId
        result = NoteTakingController.updateNoteRecord('', 'Updated Title', 'Updated Description');
        System.assert(!result, 'Note record should not be updated with blank noteId');
    }

    @isTest
    static void testDeleteNoteRecord() {
        // Insert a test note record
        My_Note__c note = new My_Note__c(Name='Test Title', Note_Description__c='Test Description');
        insert note;

        Test.startTest();
        Boolean result = NoteTakingController.deleteNoteRecord(note.Id);
        Test.stopTest();

        System.assert(result, 'Note record was not deleted successfully');
        List<My_Note__c> notes = [SELECT Id FROM My_Note__c WHERE Id = :note.Id];
        System.assertEquals(0, notes.size(), 'Note record was not deleted');
        
        // Test blank noteId
        result = NoteTakingController.deleteNoteRecord('');
        System.assert(!result, 'Note record should not be deleted with blank noteId');
    }
}
