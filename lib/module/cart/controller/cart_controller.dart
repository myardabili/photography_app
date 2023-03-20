import 'package:flutter/material.dart';
import 'package:photography_app/core.dart';

class CartController extends State<CartView> implements MvcController {
  static late CartController instance;
  late CartView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
