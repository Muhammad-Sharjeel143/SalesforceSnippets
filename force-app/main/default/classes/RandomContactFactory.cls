public class RandomContactFactory {
    public static list<contact> generateRandomContacts(Integer numcont, String lastname){
        List<contact> contacts = new List<contact>();
        for(Integer i= 0; i<numcont; i++){
            contact cont = new contact (Firstname = 'test'+i, LastName = lastname);
            contacts.add(cont);
            
     
        }
        return contacts;
    }
}