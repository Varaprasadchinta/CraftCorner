import 'package:craft_corner/screens/payment/success.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';


class UpiPayment extends StatefulWidget {
  const UpiPayment({super.key});

  @override
  State<UpiPayment> createState() => _UpiPaymentState();
}

class _UpiPaymentState extends State<UpiPayment> {
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }
  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "8074722516@ybl",
      receiverName: 'Navyasri',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1080.00,
    );
  }
  Widget displayUpiApps() {
    Size size =MediaQuery.of(context).size;
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty)
      // ignore: curly_braces_in_flow_control_structures
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      // ignore: curly_braces_in_flow_control_structures
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  width: size.width,
                  height: 65,
                  margin: const EdgeInsets.only(right: 0,left: 0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2,color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 10),
                                Image.memory(
                                  app.icon,
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(width: 30),
                                Text(app.name),
                              ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
  }
  // String _upiErrorHandler(error) {
  //   switch (error) {
  //     case UpiIndiaAppNotInstalledException:
  //       return 'Requested app not installed on device';
  //     case UpiIndiaUserCancelledException:
  //       return 'You cancelled the transaction';
  //     case UpiIndiaNullResponseException:
  //       return 'Requested app didn\'t return any response';
  //     case UpiIndiaInvalidParametersException:
  //       return 'Requested app cannot handle the transaction';
  //     default:
  //       return 'An Unknown error has occurred';
  //   }
  // }
  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }
  // Widget displayTransactionData(title, body) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text("$title: ", style: header),
  //         Flexible(
  //             child: Text(
  //           body,
  //           style: value,
  //         )),
  //       ],
  //     ),
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Success();
                  //   return Center(
                  //     child: Text(
                  //       ''
                  //       // _upiErrorHandler(snapshot.error.runtimeType),
                  //       // style: header,
                  //     ), // Print's text message on screen
                  //   );
                  }
                  // UpiResponse upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  // String txnId = upiResponse.transactionId ?? 'N/A';
                  // String resCode = upiResponse.responseCode ?? 'N/A';
                  // String txnRef = upiResponse.transactionRefId ?? 'N/A';
                  // String status = upiResponse.status ?? 'N/A';
                  // String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
                  // _checkTxnStatus(status);


                  return const Success();



                  // return const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       displayTransactionData('Transaction Id', txnId),
                  //       displayTransactionData('Response Code', resCode),
                  //       displayTransactionData('Reference Id', txnRef),
                  //       displayTransactionData('Status', status.toUpperCase()),
                  //       displayTransactionData('Approval No', approvalRef),
                  //     ],
                  //   ),
                  // );
                } else {
                  return const Center(
                    child: Text(''),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}