class Product {
  final String name;
  final String price;
  final bool available;
  final String imageUrl;
  final String description;

  Product({required this.name, required this.price,this.available=true,required this.imageUrl,required this.description});

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      name: data['name'],
      price: data['price'],
      available: data['Availability'],
      imageUrl: data['imageUrl'],
      description: data['Description'],
    );
  }
}