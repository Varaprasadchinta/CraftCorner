import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen>{
  File? pickedImage;
  final picker = ImagePicker();
  String? imageUrl;
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _productNameController = TextEditingController(); 
  final TextEditingController _productDescriptionController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      setState(() {
      pickedImage=file;
    });
      _uploadImageToFirebase(pickedFile.path);
    }
  }
  Future<void> _uploadImageToFirebase(String filePath) async {
    File file = File(filePath); 
    
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('products/$fileName')
          .putFile(file);
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('products/$fileName')
          .getDownloadURL();
          print(downloadURL);
      setState(() {
        imageUrl=downloadURL;
      });
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }
  Future<void> _storeDataInFirestore(String cImageUrl) async {
  try {
    DocumentReference docRef = await FirebaseFirestore.instance.collection('products').doc(FirebaseAuth.instance.currentUser!.uid).collection('yourProducts').add({
                      'name': _productNameController.text,
                      'description': _productDescriptionController.text,
                      'price': _productPriceController.text,
                      'imageUrl': cImageUrl,
                      'storeId': FirebaseAuth.instance.currentUser!.uid,
                    });
    String productId = docRef.id;
    await FirebaseFirestore.instance.collection('products').doc(FirebaseAuth.instance.currentUser!.uid).collection('yourProducts').doc(productId).update({'productId':productId});
    print('Image URL stored in Firestore');
  } catch (e) {
    print('Error storing image URL in Firestore: $e');
  }
  }


  @override
  Widget build(BuildContext context) {
    // Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product Details"),
          leading :null,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            // key: formKey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _productNameController,
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _productDescriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Product Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _productPriceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Product Price',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product price';
                      }
                      try {
                        double.parse(value);
                      } catch (e) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          height: 100,
                          child: pickedImage != null
                                  ? Image.file(
                                      pickedImage!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://static.thenounproject.com/png/2413564-200.png',
                                      fit: BoxFit.cover,
                                    ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.image),
                          label: const Text('Add Image'),
                        ),
                    ],
                  ),
                  // InkWell(
                  //   onTap: (){},
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.black,
                  //       ),
                  //     width: size.width,
                  //     height: 50,
                  //     // color: Colors.black,
                  //     child: const Padding(
            
                  //       padding: EdgeInsets.all(16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.file_upload_outlined,color: Colors.white,),
                  //           SizedBox(width: 20,),
                  //           Text("Upload product Image",style: TextStyle(color: Colors.white,),) ,
                  //       ],
                  //       ),
                  //     )
                  //   ),
                  // ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        _storeDataInFirestore(imageUrl!);
                      },
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context)=> const Added()),
                        // );
        
                      child: const Text('Submit'),
                    ),
                  ),
                  // InkWell(
                  //   onTap: addProduct,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.black,
                  //       ),
                  //     width: size.width,
                  //     height: 50,
                  //     // color: Colors.black,
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(16.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.add,color: Colors.white,),
                  //           SizedBox(width: 20,),
                  //           Text("Submit",style: TextStyle(color: Colors.white,)),
                  //       ],
                  //      ),
                  //     )
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}