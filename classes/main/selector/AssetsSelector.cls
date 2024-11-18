public class AssetsSelector extends fflib_SObjectSelector implements IAssetsSelector {
  public static IAssetsSelector newInstance() {
    return (IAssetsSelector) Application.Selector.newInstance(
      Asset.SObjectType
    );
  }

  public List<Schema.SObjectField> getSObjectFieldList() {
    return new List<Schema.SObjectField>{
      Asset.Id,
      Asset.Name,
      Asset.AccountId,
      Asset.ContactId,
      Asset.Product2Id,
      Asset.Quantity,
      Asset.Status,
      Asset.InstallDate,
      Asset.UsageEndDate,
      Asset.CreatedDate,
      Asset.LastModifiedDate
    };
  }

  public Schema.SObjectType getSObjectType() {
    return Asset.SObjectType;
  }


  public List<Asset> selectAll() {
    return (List<Asset>) Database.query(newQueryFactory().toSOQL());
  }

}