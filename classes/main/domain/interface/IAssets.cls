public interface IAssets extends fflib_ISObjects {
  List<Asset> getAssets();
  Map<ID, Asset> getAssetsMap();
}