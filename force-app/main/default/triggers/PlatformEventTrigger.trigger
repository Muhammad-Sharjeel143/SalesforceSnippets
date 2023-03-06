trigger PlatformEventTrigger on Account_Postal_Event__e (after insert) {
    PlatformEventTriggerhandler.AccountPostalCode(trigger.new);
    // InsertBatchContact conBatchObj = new InsertBatchContact();
    // Id batchId = Database.executeBatch(conBatchObj,100);
}