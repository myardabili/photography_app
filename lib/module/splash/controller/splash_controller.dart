import 'package:flutter/material.dart';
// import 'package:photography_app/core.dart';
// import 'package:flutter/material.dart';
import '../../../state_util.dart';
import '../view/splash_view.dart';

class SplashController extends State<SplashView> implements MvcController {
  static late SplashController instance;
  late SplashView view;

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
