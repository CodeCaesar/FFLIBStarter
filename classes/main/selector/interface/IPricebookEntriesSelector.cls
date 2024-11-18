public interface IPricebookEntriesSelector extends fflib_ISObjectSelector {
    List<PricebookEntry> selectAll();
    // List<PricebookEntry> selectByProductAndPricebook(Id productId, Id pricebookId);
    // List<PricebookEntry> selectByPricebook(Id pricebookId);
}