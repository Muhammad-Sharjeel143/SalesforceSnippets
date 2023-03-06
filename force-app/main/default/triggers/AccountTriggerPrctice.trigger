trigger AccountTriggerPrctice on Account (before insert, after insert, before update, after update) {
    if (trigger.isBefore && trigger.isinsert) {
        accountTriggerHandler.InsertRating(trigger.new); //here beforeinsert() is method
    }
    else if(trigger.isAfter && trigger.isInsert){
        accountTriggerHandler.AccountRelatedOpp(trigger.new);
    } 
    else if(trigger.isBefore && trigger.isUpdate){
        accountTriggerHandler.phoneupdateDescription(trigger.new, trigger.oldMap);
    }
    // else if(trigger.isBefore && trigger.isUpdate){
    //     accountTriggerHandler.phoneupdateDescription(trigger.new, oldMap);
    // }
    // else if(trigger.isAfter && trigger.isUpdate){
    //     accountTriggerHandler.phoneupdupdatePhoneRelatedOppateopp(trigger.new, trigger.oldMap);
    // }
}