public with sharing class AccountControllerlwc {
    @AuraEnabled(cacheable= true)
      public static List<Account> getAccounts(){
      return 
      [ SELECT Name, AnnualRevenue, Industry 
        FROM Account WHERE AnnualRevenue != null
        WITH SECURITY_ENFORCED
        ORDER BY Name
      ];
    }
}
