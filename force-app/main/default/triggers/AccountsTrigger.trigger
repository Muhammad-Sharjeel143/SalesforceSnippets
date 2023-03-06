trigger AccountsTrigger on Account (after insert ) {
    if (trigger.isAfter && trigger.isInsert) {
        List< Account_Postal_Event__e> eventlist = new List< Account_Postal_Event__e>();
        for (Account acc : trigger.new) {
            if (acc.BillingPostalCode != null) {
                Account_Postal_Event__e newevent = new Account_Postal_Event__e();
                // newevent.IDs__c = acc.id;
                newevent.Account_Postal_Code__c = acc.BillingPostalCode;
                eventlist.add(newevent);
            }
        }      
        EventBus.publish(eventlist);
    }
}
        // AccountsTriggerHandler.createRelatedOpp(trigger.new);   

    // else if(trigger.isAfter && trigger.isUpdate){

    //     accountupdHandleclass accup = new accountupdHandleclass();
    //     accup.updateopStatus(Trigger.new); 

    // }