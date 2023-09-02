class Cart {
  late final int? id;
  final String? productId;
  final String? productname;
  final int? Initialprice;
  final int? productprice;
  final int? quantity;
  final int? Unittag;
  final int? Image;

  Cart({
    required this.id,
    required this.productId,
    required this.productname,
    required this.Initialprice,
    required this.productprice,
    required this.quantity,
    required this.Unittag,
    required this.Image,
  });

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res["id"],
        productId = res["productId"],
        productname = res["productname"],
        Initialprice = res["Initialprice"],
        productprice = res["productprice"],
        quantity = res["quantity"],
        Unittag = res["Unittag"],
        Image = res["Image"];

  Map<String, Object?> tomap() {
    return {
      'id': id,
      'productId': productId,
      'productname': productname,
      'Initialprice': Initialprice,
      'productprice': productprice,
      'quantity': quantity,
      'Unittag': Unittag,
      'Image': Image,
    };
  }
}
