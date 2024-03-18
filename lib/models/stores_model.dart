import 'package:cloud_firestore/cloud_firestore.dart';

class Stores{
  final String name;
  final String address;
  final String number;
  final String imageUrl;

  Stores({required this.name,required this.address,required this.number,required this.imageUrl});

  factory Stores.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    final data = document.data()!;
    return Stores(
      name: data['name'],
      address: data['Address'],
      imageUrl: data['imageUrl'],
      number: data['number']
    );
  }
}