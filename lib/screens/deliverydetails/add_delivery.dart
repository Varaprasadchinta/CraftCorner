import 'package:flutter/material.dart';

class AddDeliverAddress extends StatefulWidget {
  const AddDeliverAddress({super.key});

  @override
  State<AddDeliverAddress> createState() => _AddDeliverAddressState();
}
enum AddressTypes {
  Home,
  Work,
  Other,
}
class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Delivery Address",
          style: TextStyle(fontSize: 18),),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: (){},
          color: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "Add Address",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),

      ),
    );
  }
}