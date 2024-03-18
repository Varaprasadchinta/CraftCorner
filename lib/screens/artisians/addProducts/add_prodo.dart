import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProdo extends StatefulWidget {
  const AddProdo({super.key});

  @override
  State<AddProdo> createState() => _AddProdoState();
}

class _AddProdoState extends State<AddProdo> {
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload the picked image to Firebase Storage and store the URL in Firestore
      _uploadImageToFirebase(pickedFile.path);
    }
  }
  Future<void> _uploadImageToFirebase(String filePath) async {
    File file = File(filePath);
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/$fileName')
          .putFile(file);

      // Get the download URL
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('images/$fileName')
          .getDownloadURL();

      // Store the download URL in Firestore
      _storeImageUrlInFirestore(downloadURL);
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }
  Future<void> _storeImageUrlInFirestore(String imageUrl) async {
  try {
    await FirebaseFirestore.instance
        .collection('your_collection')
        .doc('your_document')
        .set({'image_url': imageUrl});

    print('Image URL stored in Firestore');
  } catch (e) {
    print('Error storing image URL in Firestore: $e');
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _pickImage,
          child: const Text("click"),
        ) 
        ),
    );
  }
}