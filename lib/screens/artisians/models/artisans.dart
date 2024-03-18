import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArtisanDetails {
  final String storeId;
  final String name;
  final String email;
  final String storeName;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ArtisanDetails({
    required this.storeId,
    required this.name,
    required this.email,
    required this.storeName,
  });
  toJson(){
    return{
      "storeId":storeId,
      "name":name,
      "email":email,
      "storeName":storeName,
    };
  }

  static ArtisanDetails fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return ArtisanDetails(
      storeId: snapshot['userId'], 
      name: snapshot['name'], 
      email: snapshot['email'],
      storeName: snapshot['storeName'],
      );
  }

  Future<ArtisanDetails> getUserDetails() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('artisians').doc(currentUser.uid).get();
    return ArtisanDetails.fromSnap(snap);
  }
}