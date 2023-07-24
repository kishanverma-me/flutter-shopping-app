class CartItem {
  String itemName;
  String itemPrice;
  String itemDescription;
  double itemRating;
  int itemCount = 1;

  CartItem(
      {required this.itemName,
      required this.itemPrice,
      required this.itemDescription,
      required this.itemRating,
      required this.itemCount});
}
