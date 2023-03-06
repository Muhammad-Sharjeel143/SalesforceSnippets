public with sharing class contactInsertion {
    public static void NewContactInsertion() {
        List<Contact> conList = new List<Contact>();
        for(Integer i=0; i< 200; i++){
            contact newcon = new contact();
            newcon.FirstName = 'New';
            newcon.LastName = 'Test ' + i;
            newcon.MailingPostalCode ='00601';
            conList.add(newcon);
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
}