// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

//Annonymous code for UpdateParentAccount
// List<Account> account = [Select  id  from Account where billingstate='Ny' ];
// id parentid = [select id from Account where name = 'Burlington Textiles Corp of America'][0].Id;
// UpdateParentAccount updateparentId = new UpdateParentAccount(account, parentid);

// Id jobId = System.enqueueJob(updateparentId);



// AccountConCalculator.Contactcount(accListId);
// string tempvar = 'Enter_your_name_here';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);



List<Contact> newcontact  = [select id FROM Contact Where createdDate = today];
delete newcontact;

contactInsertion.NewContactInsertion();

InsertBatchContact conBatchObj = new InsertBatchContact();
Id batchId = Database.executeBatch(conBatchObj, 100);



















// AccountConCalculator annonymous code:
// List<Account> accList = [Select id from Account LIMIT 5];
// List<id> accListId = new List<id>();

// for (Account acc: accList){
//     accListId.add(acc.id);
    
// }

