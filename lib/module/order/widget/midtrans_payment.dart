import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtansPayment extends StatefulWidget {
  // final item;
  var id;
  var name;
  var phone;
  var location;
  var date;
  // var time;
  var price;
  var category;

  MidtansPayment({
    super.key,
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.date,
    // required this.time,
    required this.price,
    required this.category,
  });

  @override
  State<MidtansPayment> createState() => _MidtansPaymentState();
}

class _MidtansPaymentState extends State<MidtansPayment> {
  bool isLoading = true;
  // var id = Random();
  @override
  void initState() {
    // TODO: implement initState
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (value) {
            if (value == 100) {
              setState(() {
                isLoading = false;
              });
            }
          },
          initialUrl:
              // 'https://d19b-103-162-62-225.ngrok-free.app/checkout?transaction_id=${widget.id}&name=${widget.name}&price=${widget.price}&phone=${widget.phone}&date_visit=${widget.date}&time_visit=8pagi&category=${widget.category}&location=${widget.location}'
              'https://97fe-103-162-62-225.ngrok-free.app/checkout?transaction_id=${widget.id}&name=${widget.name}&price=${widget.price}&phone=${widget.phone}&date_visit=${widget.date}&time_visit=8pagi&category=${widget.category}&location=${widget.location}'),
    );
  }
}
