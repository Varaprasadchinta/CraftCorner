import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  final String userId;
  final String name;
  final String email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserDetails({
    required this.userId,
    required this.name,
    required this.email,
  });
  toJson(){
    return{
      "name":name,
      "email":email,
      "userId":userId,
    };
  }

  static UserDetails fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserDetails(
      userId: snapshot['userId'], 
      name: snapshot['name'], 
      email: snapshot['email'],
      );
  }

  Future<UserDetails> getUserDetails() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
    return UserDetails.fromSnap(snap);
  }
}