public interface IOrderItems extends fflib_ISObjects {
    List<OrderItem> getOrderItems();
    Map<ID, OrderItem> getOrderItemsMap();
}