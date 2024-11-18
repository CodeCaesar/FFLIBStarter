@IsTest
private class TEST_Contacts {
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
        IContacts theseContacts = Contacts.newInstance(ContactsSelector.newInstance().selectAll());
        IContacts theseContacts2 = Contacts.newInstance(theseContacts.getContactsMap().keySet());
        
        System.assertEquals(9, theseContacts.getContacts().size());
        System.assertEquals(9, theseContacts.getContactsMap().size());
        System.assertEquals(9, theseContacts2.getContacts().size());
        System.assertEquals(9, theseContacts2.getContactsMap().size());
    }
}