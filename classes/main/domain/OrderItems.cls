public class OrderItems extends fflib_SObjects implements IOrderItems {
    public static IOrderItems newInstance(List<OrderItem> recordList) {
      return (IOrderItems) Application.Domain.newInstance(recordList);
    }
  
    public static IOrderItems newInstance(Set<Id> recordIdSet) {
      return (IOrderItems) Application.Domain.newInstance(recordIdSet);
    }
  
    public OrderItems(List<OrderItem> sObjectList) {
      super(sObjectList, Schema.OrderItem.SObjectType);
    }
  
    public List<OrderItem> getOrderItems() {
      return (List<OrderItem>) getRecords();
    }
  
    public Map<ID, OrderItem> getOrderItemsMap() {
      return new Map<ID, OrderItem>(getOrderItems());
    }

    // public Map<ID, OrderItem> getProduct2OrderItemMap() {
    //   Map<ID, OrderItem> product2OrderItemMap = new Map<ID, OrderItem>();
    //   for (OrderItem thisOrderItem : getOrderItems()) {
    //       product2OrderItemMap.put(thisOrderItem.Product2Id, thisOrderItem);
    //   }
    //   return product2OrderItemMap;
    // }

    // public Set<ID> getProduct2Ids() {
    //   Set<ID> product2Ids = new Set<ID>();
    //   for (OrderItem item : getOrderItems()) {
    //       product2Ids.add(item.Product2Id);
    //   }
    //   return product2Ids;
    // }
  
    public class Constructor implements fflib_IDomainConstructor {
      public fflib_SObjects construct(List<Object> objectList) {
        return new OrderItems((List<SObject>) objectList);
      }
    }
}