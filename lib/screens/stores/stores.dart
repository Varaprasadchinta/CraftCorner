import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/stores/store_tile.dart';
import 'package:craft_corner/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stores"),
        leading: BackButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationMenu())
            );
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('artisians').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var stores = snapshot.data!.docs;

          return ListView.builder(
            itemCount: stores.length,
            itemBuilder: (context, index){
              var store = stores[index];
              var storeName = store['storeName'];
              var name = store['name'];
              var imageUrl = store['imageUrl'];
              var storeId = store['storeId'];

              return StoreTile(imageUrl: imageUrl, title: storeName, subtitle: name, storeId: storeId,);
            },
          );

        },
      ),
    );
  }
}