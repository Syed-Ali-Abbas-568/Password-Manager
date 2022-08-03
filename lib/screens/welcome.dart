import 'package:flutter/material.dart';

import '../components/body.dart';
import 'app_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BodyComponent(),
      body: AppView(),
    );
  }
}
