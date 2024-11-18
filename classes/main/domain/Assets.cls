public class Assets extends fflib_SObjects implements IAssets {
  public static IAssets newInstance(List<Asset> recordList) {
    return (IAssets) Application.Domain.newInstance(recordList);
  }

  public static IAssets newInstance(Set<Id> recordIdSet) {
    return (IAssets) Application.Domain.newInstance(recordIdSet);
  }

  public Assets(List<Asset> sObjectList) {
    super(sObjectList, Schema.Asset.SObjectType);
  }

  public List<Asset> getAssets() {
    return (List<Asset>) getRecords();
  }

  public Map<ID, Asset> getAssetsMap() {
    return new Map<ID, Asset>(getAssets());
  }

  public class Constructor implements fflib_IDomainConstructor {
    public fflib_SObjects construct(List<Object> objectList) {
      return new Assets((List<SObject>) objectList);
    }
  }
}