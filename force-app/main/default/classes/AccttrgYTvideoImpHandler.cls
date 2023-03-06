public with sharing class AccttrgYTvideoImpHandler {
    public static void updateRating(List<Account> newList) {
        for (Account acc : newList) {
            if(acc.industry =='Media ' || acc.industry == 'Energy')
            acc.Rating =' Hot';
        }
    }
}