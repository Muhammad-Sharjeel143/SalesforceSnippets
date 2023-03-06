public class ContactAndLeadSearch {
		
    public static List<List<sObject>> searchContactsAndLeads(String lastName){
        List<List<sObject>> ContactLeadList = [Find :lastName  IN ALL FIELDS RETURNING 
                                              Contact (Name), Lead (Name)];
        return ContactLeadList;
    }
}