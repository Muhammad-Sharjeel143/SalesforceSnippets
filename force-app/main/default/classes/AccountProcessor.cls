public class AccountProcessor{
  @future
  public static void countContacts(List<Id> accountIds){
    	List<Account> updatedNoOfContact = new List<Account>();
      List<Account> accList = [select Id,Number_of_Contacts__c , (select Id from Contacts ) from Account where Id in :accountIds];
      For( Account acc :accList){
		
          acc.Number_of_Contacts__c = acc.Contacts.size();
          updatedNoOfContact.add(acc);
      }
     update accList;
  }
}









//public class AccountProcessor {
//	@future
   // public static void countContacts(List<id> accountIds){
     
    //    List<Account> AccountToUpdate = new List<Account>();
      //  List<Account> accounts = [SELECT  id , Name , (Select id from Contacts) from Account where id in : accountIds];
  //      for(Account acc: accounts){
          //  List<contact> contactlist  = acc.Contacts;
          //  acc.Number_Of_Contacts__c = contactList.size();
        //    AccountToUpdate.add(acc);
            
      //  }
    //update AccountToUpdate;
    
    
    //}