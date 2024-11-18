@IsTest
private class TEST_Products {
  @TestSetup
  static void makeData() {
    ATK.prepare(Account.SObjectType, 10)
      .field(Account.Name)
      .index('Name-{0000}')
      .withChildren(Contact.SObjectType, Contact.AccountId, 1)
      .field(Contact.LastName)
      .repeat('Adams', 'Johnson')
      .field(Contact.FirstName)
      .index('Name-{0000}')
      .save();

    ATK.prepare(Product2.SObjectType, 10)
      .field(Product2.Name)
      .repeat('GenWatt Propane 500kW')
      .field(Product2.ProductCode)
      .repeat('GC1040', 'GC8900')
      .field(Product2.IsActive)
      .repeat(true)
      .field(Product2.Family)
      .repeat('Fixed-Wing', 'Gundam-Wing')
      .save();
  }
  @IsTest
  static void testFFLIB() {
      IProducts theseProducts = Products.newInstance(ProductsSelector.newInstance().selectAll());
      IProducts theseProducts2 = Products.newInstance(theseProducts.getProductsMap().keySet());
      System.assertEquals(10, theseProducts.getProducts().size());
      System.assertEquals(10, theseProducts.getProductsMap().size());
      System.assertEquals(10, theseProducts2.getProducts().size());
      System.assertEquals(10, theseProducts2.getProductsMap().size());
  }
}