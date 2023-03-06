@isTest
public class AccountCalculatorTest {
	@isTest
    private Static void countContactTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=0 ; i < 250 ; i++){
         	Account acc = new Account();
            acc.Name= 'Test' + i;
            accList.add(acc);
            
        }
        insert accList;
        
        List<Contact> oppList = new List<Contact>();
        List<id> accIds = new List<id>();
        
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName = 'Test';
            con.LastName = acc.Name; 
            con.AccountId = acc.Id;
            accIds.add(con.id);
        }
  	  insert opplist;
        
        Test.startTest();
        AccountConCalculator.Contactcount(accIds);
        
        List<Account> accs = [Select id, Number_Of_Contacts__c from Account ];
        System.assertEquals(1, accs[0].Number_Of_Contacts__c);
    }
}