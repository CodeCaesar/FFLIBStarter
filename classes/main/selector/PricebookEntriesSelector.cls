public class PricebookEntriesSelector extends fflib_SObjectSelector implements IPricebookEntriesSelector {
    public static IPricebookEntriesSelector newInstance() {
      return (IPricebookEntriesSelector) Application.Selector.newInstance(
        PricebookEntry.SObjectType
      );
    }
  
    public List<Schema.SObjectField> getSObjectFieldList() {
      return new List<Schema.SObjectField>{
        PricebookEntry.Id,
        PricebookEntry.Pricebook2Id,
        PricebookEntry.Product2Id,
        PricebookEntry.UnitPrice,
        PricebookEntry.IsActive
      };
    }
  
    public Schema.SObjectType getSObjectType() {
      return PricebookEntry.SObjectType;
    }
  
    public List<PricebookEntry> selectAll() {
      return (List<PricebookEntry>) Database.query(newQueryFactory().toSOQL());
    }
  
    // public List<PricebookEntry> selectByProductAndPricebook(Id productId, Id pricebookId) {
    //   return (List<PricebookEntry>) Database.query(
    //     newQueryFactory()
    //       .setCondition('Product2Id =: productId')
    //       .setCondition('Pricebook2Id =: pricebookId')
    //       .toSOQL()
    //   );
    // }
    // public List<PricebookEntry> selectByPricebook(Id pricebookId) {
    //   return (List<PricebookEntry>) Database.query(
    //     newQueryFactory()
    //       .setCondition('Pricebook2Id =: pricebookId')
    //       .toSOQL()
    //   );
    // }
}