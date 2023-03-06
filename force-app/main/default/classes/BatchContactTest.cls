@istest 
public class BatchContactTest {
    @isTest static void testbatchClass(){
        List<Contact> conList = new List<Contact>();
        
        for(integer i = 0 ; i < 100 ;i++ ){
            conList.add(new Contact(lastName = 'Test Account ' + i, MailingPostalCode ='00601' ));
        }
        if(!conList.isEmpty())
            insert conList;

    Test.setMock(HttpCalloutMock.class, new InsertContactMock());
       InsertBatchContact bs = new InsertBatchContact();
        Test.startTest();
            database.executeBatch(bs,100);
        Test.stopTest();

    List<Contact> contactList = [SELECT  id, lastName, MailingAddress FROM Contact WHERE id IN : conList];          
        for (contact con : contactList ) {
            System.assert(con.MailingAddress!= null);
        }
    System.assert(contactList.size()==100);
    }
}