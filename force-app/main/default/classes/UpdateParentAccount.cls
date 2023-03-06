public with sharing class UpdateParentAccount implements Queueable{
    private List<Account> account;
    private ID parentid;
    public UpdateParentAccount(List<Account> records, ID id) {
         this.account = records;
         this.parentid = id ;
    }
    public void execute(QueueableContext context){
        for (Account acc : account) {
            acc.ParentId = parentid;
        }
        update account;
    }
}