trigger insertUpdateTrg on Account (after insert, after update) {

    List<Opportunity> op1 = new List<Opportunity>();

    if (trigger.isInsert && trigger.isAfter)
    {
        for(Account acc : Trigger.new)
            {
                if(acc.NumberOfEmployees > 0)
                {
                    for (Integer i=0; i<acc.NumberOfEmployees; i++) {
                        Opportunity newOpp = new Opportunity();
                        newOpp.AccountId = acc.Id;
                        newOpp.Name = acc.Name+i;
                        newOpp.StageName = 'Prospecting';
                        newOpp.CloseDate = date.today();
                        op1.add(newOpp);
                    }
                   
                }
            }
        insert op1;
    }
        else if(trigger.isAfter && trigger.isUpdate){

            accountupdHandleclass accup = new accountupdHandleclass();
            accup.updateopStatus(Trigger.new); 

        }
}
        
//    Set<ID> oppAcc = new Set<ID>();
//     List<Opportunity> opp1 = new List<Opportunity>();
//     for(Account a : trigger.new){
         
//         oppAcc.add(a.Id);
//     }
//     Map<Id, Opportunity> mapOpty = new Map<Id, Opportunity>([SELECT ID, AccountID from Opportunity WHERE Id IN :OppAcc]);
//         system.debug(mapopty);
//         for (Account  Acc : trigger.new) {
//             Opportunity opp = mapOpty.get(acc.Id);
//            // opp.AccountId = acc.id;
//             opp.StageName = 'Closed Won';
//             opp.CloseDate = date.today();
//             opp1.add(opp);
//         }
//         insert opp1;
//     }
// }
        // Account a1 = [select Id, AccountId from Opportunity where Id IN: Trigger.new ];
        //     for(Opportunity o : Trigger.new){
        //         o.AccountId a1.id;
        //         o.Name = a1.Name+1;
        //         o.StageName= 'closed Won';
        //         o.CloseDate= date.today();
        //         opp1.add(o);
            // }
        // }
    // }
    //  update opp1;
        // }
//     }
// }

//     List<Id> accIds = new List<Id>();
//     List<Account> accounts = new List<Account>();
//                for(Account o:trigger.new){
//                 accIds.add(o.);
//                }
//    for(Account a:[select Id, Rating from account where Id IN :accIds]){
//                                for(Opportunity opp:trigger.new){
//                                                if(opp.StageName=='closed won'){
//                                                     a.Rating='hot';
//                                                     accounts.add(a);
//                                                }
//                                }
//                }
//    update accounts;
    
  //      AccwithOppupdateHandle.updateRelatedOpp(trigger.new,Trigger.oldMap);



 //     Map<id, Account> updopp = new Map<id, Account>([select id ,(Select id From Opportunity)From Account WHERE Id IN : Trigger.new]);

    //     for(account a : Trigger.new){
            
    //     }