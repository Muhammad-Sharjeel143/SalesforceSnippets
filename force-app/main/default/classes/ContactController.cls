public with sharing class ContactController {
    @AuraEnabled (cacheable = true)
    public static List<Contact> getContacts(){
    return [
        SELECT FirstName, LastName , Email 
        FROM Contact
        ORDER BY FirstName
        LIMIT 20
        ];
    // throw new AuraHandledException('Forced error');
    }
    // fetchAccounts() {
    //     const contacts = await getContacts();
    //     return contacts;
    //   }
}