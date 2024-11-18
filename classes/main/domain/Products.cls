public class Products extends fflib_SObjects implements IProducts {
  public static IProducts newInstance(List<Product2> recordList) {
    return (IProducts) Application.Domain.newInstance(recordList);
  }

  public static IProducts newInstance(Set<Id> recordIdSet) {
    return (IProducts) Application.Domain.newInstance(recordIdSet);
  }

  public Products(List<Product2> sObjectList) {
    super(sObjectList, Schema.Product2.SObjectType);
  }

  public List<Product2> getProducts() {
    return (List<Product2>) getRecords();
  }

  public Map<ID, Product2> getProductsMap() {
    return new Map<ID, Product2>(getProducts());
  }




  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Products((List<SObject>) objectList);
    }
  }
}