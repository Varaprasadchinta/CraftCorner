import 'package:craft_corner/screens/products/product_list_screen.dart';
import 'package:flutter/material.dart';

class StoreTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String storeId;
  const StoreTile({super.key, required this.imageUrl, required this.title, required this.subtitle,required this.storeId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
            ),
            child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductListScreen())
                        );
                      },
                      child: Container(
                        // borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            subtitle,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                    )
                ),
              ]
              ),
          ),
    );
  }
}