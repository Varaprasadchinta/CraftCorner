import 'package:craft_corner/screens/payment/upi_payment_screen.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<OrderDetails> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        leading :const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ]
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Prasad, VRSEC, Kanuru, Vijayawada, 520007",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ]),
                  Divider(
                    height:15,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bag Total",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "\u{20B9}1000",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Fee",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "\u{20B9}80.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height:30,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount Payable",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "\u{20B9}1080",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent,),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Payment Options",
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ]),
                  // SizedBox(height: 25,),
                  // UpiPayment(),
                  ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const UpiPayment(),
                ),
            );
          },
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
              "Proceed to payment",
              style: TextStyle(color: Colors.white)
          ),
        ),
      ),
    );
  }
}


