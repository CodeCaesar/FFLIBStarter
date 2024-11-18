@IsTest
private class TEST_Account {
    @TestSetup
    static void makeData() {
        ATK.prepare(Account.SObjectType, 10)
            .field(Account.Name)
            .index('Name-{0000}')
            .withChildren(Contact.SObjectType, Contact.AccountId, 9)
            .field(Contact.LastName)
            .repeat('Adams', 'Johnson')
            .field(Contact.FirstName)
            .index('Name-{0000}')
            .save();
    }

    @IsTest
    static void testFFLIB() {
        IAccounts theseAccounts = Accounts.newInstance(AccountsSelector.newInstance().selectAll());
        IAccounts theseAccounts2 = Accounts.newInstance(theseAccounts.getAccountsMap().keySet());
        IAccounts theseAccounts3 = Accounts.newInstance(AccountsSelector.newInstance().selectWithContacts(theseAccounts.getAccountsMap().keySet()));
        System.assertEquals(10, theseAccounts.getAccounts().size());
        System.assertEquals(10, theseAccounts.getAccountsMap().size());
        System.assertEquals(10, theseAccounts2.getAccounts().size());
        System.assertEquals(10, theseAccounts2.getAccountsMap().size());
        System.assertEquals(9, theseAccounts3.getAccountsContactsMap().size());
    }

    // @IsTest
    // static void testNewInstanceWithRecordIdSet() {
    //     IAccounts instance = Accounts.newInstance(AccountsSelector.newInstance().selectAll());
    //     IAccounts instance2 = Accounts.newInstance(instance.getAccountsMap().keySet());
    //     System.assertNotEquals(null, instance2);
    //     System.assertEquals(10, instance2.getAccounts().size());
    // }

    // @IsTest
    // static void testGetAccounts() {
    //     IAccounts instance = Accounts.newInstance(AccountsSelector.newInstance().selectAll());
    //     List<Account> retrievedAccounts = instance.getAccounts();
    //     System.assertEquals(10, retrievedAccounts.size());
    // }

    // @IsTest
    // static void testGetAccountsMap() {
    //     IAccounts instance = Accounts.newInstance(AccountsSelector.newInstance().selectAll());
    //     Map<Id, Account> accountsMap = instance.getAccountsMap();
    //     System.assertEquals(10, accountsMap.size());
    //     System.assert(accountsMap.containsKey(accountsMap.keySet().iterator().next()));
    // }


}