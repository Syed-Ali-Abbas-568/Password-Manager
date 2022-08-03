import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/screens/app_view.dart';

import '../firebase_options.dart';

var colour = Colors.purple;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailcontroller = TextEditingController();
  final _pass = TextEditingController();
  bool error = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: (Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/lock.png",
                height: size.width * 0.4,
              ),
              const Text(
                "\n\nLogin To Password Manager",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.purple,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIcon: Text(
                      "  Email: ",
                      style: TextStyle(color: Colors.purple, fontSize: 17),
                    ),
                    hintText: "Write Email here",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  controller: _pass,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIcon: Text(
                      "  Password: ",
                      style: TextStyle(color: Colors.purple, fontSize: 17),
                    ),
                    hintText: "Write Password here",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
                  ),
                ),
              ),
              Visibility(
                visible: error,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: const Text(
                    "Error: Incorrect Credentials. Please check your email or passoword",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.purple,
                        content: Text(
                          'Please wait while we log you in.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ));
                      await Firebase.initializeApp(
                        options: DefaultFirebaseOptions.currentPlatform,
                      );

                      try {
                        final email = _emailcontroller.text;
                        final pass = _pass.text;
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: pass);

                        if (!mounted) {
                          return;
                        } else if (userCredential != null) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AppView()));
                        }
                      } catch (e) {
                        error = true;
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      side: const BorderSide(color: Colors.purple),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.purple,
                        content: Text(
                          'A SnackBar has been shown.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.purple),
                    ),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text(
                      "Go back!",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
