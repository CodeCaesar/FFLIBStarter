@IsTest
private class TEST_Orders {
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

        ATK.SaveResult productResult = ATK.prepare(Product2.SObjectType, 5)
            .field(Product2.Name)
            .index('Product-{0000}')
            .save();


        List<Id> productIds = new List<Id>();
        Map<ID, Product2> productMap = new Map<ID, Product2>((List<Product2>) productResult.get(Product2.SObjectType, 0));
        productIds.addAll(productMap.keySet());

        Pricebook2 thePriceBook = new Pricebook2(Name='Standard Price Book', IsActive=true);
        insert thePriceBook; 
        Id standardPricebookId = Test.getStandardPricebookId();

        ATK.SaveResult pricebookEntryResult = ATK.prepare(PricebookEntry.SObjectType, productIds.size())
            .field(PricebookEntry.Pricebook2Id)
            .repeat(standardPricebookId)
            .field(PricebookEntry.Product2Id)
            .repeat(productIds)
            .field(PricebookEntry.UnitPrice)
            .repeat(100)
            .save();

        IPricebookEntries thesePriceBookEntries = PricebookEntries.newInstance(PricebookEntriesSelector.newInstance().selectAll());
        List<Id> pricebookEntryIds = new List<Id>();
        pricebookEntryIds.addAll(thesePriceBookEntries.getPricebookEntriesMap().keySet());
        ATK.SaveResult assetInsuranceResult = ATK.prepare(Order.SObjectType, 10)
            .field(Order.Name)
            .index('Order-{0000}')
            .field(Order.AccountId)
            .repeat(accountIds)
            .field(Order.EffectiveDate)
            .repeat(Date.today())
            .field(Order.Status)
            .repeat('Draft')
            .field(Order.Pricebook2Id)
            .repeat(standardPricebookId)
            .withChildren(OrderItem.SObjectType, OrderItem.OrderId, 5)
                .field(OrderItem.Product2Id)
                .repeat(productIds)
                .field(OrderItem.Quantity)
                .repeat(1, 2, 3, 4, 5)
                .field(OrderItem.PricebookEntryId)
                .repeat(pricebookEntryIds)
                .field(OrderItem.UnitPrice)
                .repeat(100)
            .save();


    }

    @IsTest
    static void testFFLIB() {
        IOrders theseOrders = Orders.newInstance(OrdersSelector.newInstance().selectAll());
        IOrders theseOrders2 = Orders.newInstance(theseOrders.getOrdersMap().keySet());
        IOrderItems theseOrderItems = OrderItems.newInstance(OrderItemsSelector.newInstance().selectAll());
        IOrderItems theseOrderItems2 = OrderItems.newInstance(theseOrderItems.getOrderItemsMap().keySet());
        System.assertEquals(10, theseOrders.getOrders().size());
        System.assertEquals(10, theseOrders.getOrdersMap().size());
        System.assertEquals(10, theseOrders2.getOrders().size());
        System.assertEquals(10, theseOrders2.getOrdersMap().size());
        System.assertEquals(5, theseOrderItems.getOrderItems().size());
        System.assertEquals(5, theseOrderItems2.getOrderItems().size());
        

    }

    /*TEST_Orders.testFFLIB                      Fail              System.DmlException: Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, Required fields are missing: [PricebookEntryId]: [PricebookEntryId]  
                                                             Class.ATKCore.SaveGenerator.generate: line 156, column 1                                                                                                                
                                                             Class.ATKCore.EntityCommand.save: line 1478, column 1                                                                                                                   
                                                             Class.ATKCore.EntityCommand.save: line 1474, column 1                                                                                                                   
                                                             External entry point                                                                                                                                                    
                                                             Class.TEST_Orders.makeData: line 50, column 1     */
}