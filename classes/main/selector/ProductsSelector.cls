public class ProductsSelector extends fflib_SObjectSelector implements IProductsSelector {
  public static IProductsSelector newInstance() {
    return (IProductsSelector) Application.Selector.newInstance(
      Product2.SObjectType
    );
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Product2.Id,
      Product2.IsActive,
      Product2.ProductCode,
      Product2.Name,
      Product2.Family
    };
  }

  public Schema.SObjectType getSObjectType() {
    return Product2.SObjectType;
  }

  public List<Product2> selectAll() {
    return (List<Product2>) Database.query(newQueryFactory().toSOQL());
  }


  // public List<Product2> selectByProductCode(List<String> productCodeList) {
  //   fflib_QueryFactory queryFactory = newQueryFactory()
  //     .setCondition('ProductCode IN :productCodeList');

  //   return (List<Product2>) Database.query(queryFactory.toSOQL());
  // }
}