import 'package:craft_corner/screens/deliverydetails/add_delivery.dart';
import 'package:craft_corner/screens/deliverydetails/single_detail.dart';
import 'package:craft_corner/screens/ordersummary/order_summary.dart';
import 'package:flutter/material.dart';
// import 'AddDelivery.dart';
// import 'SingleDelivery.dart';

class DeliveryDetails extends StatelessWidget {
  final List<Widget> address=[
    const SingleDeliveryItem(
        title: "Navyasri",
        addressType: "Home",
        address: '14-149, Rangaswami bazar, Jaggayyapet, Krishna, 521175',
        number: "+91 8074722516"
    ),
  ];

  DeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Details"),
        leading :const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const AddDeliverAddress()));
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const OrderDetails(),
                ),
            );
          },
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
              "Order Summary",
              style: TextStyle(color: Colors.white)
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Deliver To"),
            leading: Image.asset("assets/image/profile.jpg",height: 30,),
          ),
          const Divider(height: 1,),
          const Column(
            children: [
              SingleDeliveryItem(
                  title: "Prasad",
                  addressType: "Home",
                  address: 'VRSEC, Kanuru, Vijayawada, 520007',
                  number: "+91 7997268965"
              ),
            ],
          )
        ],
      ),
    );
  }
}
