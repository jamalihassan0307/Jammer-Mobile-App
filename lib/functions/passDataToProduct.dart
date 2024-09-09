// ignore_for_file: file_names

class PassDataToProduct {
  final String title;
  final int productId;
  final List<dynamic> imagePath;
  final String dis;
  final String price;
  final String oldPrice;
  final String offer;

  PassDataToProduct(this.title, this.productId, this.imagePath, this.price,
      this.oldPrice, this.offer, this.dis);
}
