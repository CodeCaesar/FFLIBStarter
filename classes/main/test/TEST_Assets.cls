@IsTest
private class TEST_Assets {
    @TestSetup
    static void makeData() {
      ATK.SaveResult accountContactResult = ATK.prepare(Account.SObjectType, 5)
        .field(Account.Name)
        .index('XYZ-{0000}')
            .withChildren(Contact.SObjectType, Contact.AccountId, 5)
            .field(Contact.LastName)
            .index('XYZ-{0000}')
            .field(Contact.Email)
            .index('test.user+{0000}@iqubecd92hbf23.com')
            .save();
  
      List<Id> accountIds = new List<Id>();
      List<Id> contactIds = new List<Id>();
      Map<ID, Account> accountMap = new Map<ID, Account>(
        (List<Account>) accountContactResult.get(Account.SObjectType, 0)
      );
      Map<ID, Contact> contactMap = new Map<ID, Contact>(
        (List<Contact>) accountContactResult.get(Contact.SObjectType, 0)
      );
      accountIds.addAll(accountMap.keySet());
      contactIds.addAll(contactMap.keySet());
  
      ATK.SaveResult assetInsuranceResult = ATK.prepare(Asset.SObjectType, 10)
        .field(Asset.Name)
        .index('Asset-{0000}')
        .field(Asset.AccountId)
        .repeat(accountIds)
        .field(Asset.ContactId)
        .repeat(contactIds)
        .save();
    }
    
    @IsTest
    static void testFFLIB() {
        IAssets theseAssets = Assets.newInstance(AssetsSelector.newInstance().selectAll());
        IAssets theseAssets2 = Assets.newInstance(theseAssets.getAssetsMap().keySet());
        System.assertEquals(10, theseAssets.getAssets().size());
        System.assertEquals(10, theseAssets.getAssetsMap().size());
        System.assertEquals(10, theseAssets2.getAssets().size());
        System.assertEquals(10, theseAssets2.getAssetsMap().size());
    }
}