@isTest
public class AccountProcessorTest {
    
    public static testmethod void testAccountProcessor(){
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Contact con = New Contact();
        con.FirstName ='Binary';
        con.LastName ='Programming';
        con.AccountId = a.Id;
 
        insert con;
       
        List<Id> ListAccId = new List<Id>();
        ListAccId.add(a.id);
 
        Test.startTest();
        
       AccountProcessor.countContacts(ListAccId);
        
        Test.stopTest();
       
        Account acc = [select Number_of_Contacts__c from Account where id = :a.id];
        System.assertEquals ( Integer.valueOf(acc.Number_of_Contacts__c) ,1);
  }
 
}