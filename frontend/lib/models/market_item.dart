class MarketItem {
  final int productNo;
  final String title;
  final int price;
  final String datetime;
  final String image;

  MarketItem({
    required this.productNo,
    required this.title,
    required this.price,
    required this.datetime,
    required this.image,
  });

  factory MarketItem.fromJson(Map<String, dynamic> responseData) {
    return MarketItem(
        productNo: responseData['productNo'],
        title: responseData['title'],
        price: responseData['price'],
        datetime: responseData['datetime'],
        image: responseData['image']);
  }
}

class MarketItemDetail {
  final List<dynamic> images;
  final String title;
  final String description;
  final int deliveryFee;
  final int price;
  final int category;
  final String date;
  final bool mine;

  MarketItemDetail({
    required this.images,
    required this.title,
    required this.description,
    required this.deliveryFee,
    required this.price,
    required this.category,
    required this.date,
    required this.mine,
  });

  factory MarketItemDetail.fromJson(Map<String, dynamic> responseData) {
    return MarketItemDetail(
        images: responseData['images'],
        title: responseData['title'],
        price: responseData['price'],
        date: responseData['date'],
        deliveryFee: responseData['deliveryFee'],
        category: responseData['category'],
        mine: responseData['mine'],
        description: responseData['description']);
  }
}
