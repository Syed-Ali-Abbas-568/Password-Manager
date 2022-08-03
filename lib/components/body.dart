import 'package:flutter/material.dart';

import '../screens/login.dart';
import '../screens/signup.dart';
import 'background.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: IntrinsicWidth(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "\nWelcome to Password Manager\n",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text(
                  "LOGIN WITH GOOGLE",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text(
                  "LOGIN WITH EXISITNG ACCOUNT",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.purple),
                ),
                child: const Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
