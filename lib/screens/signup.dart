import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:password_manager/firebase_options.dart';

import 'app_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailcontroller = TextEditingController();
  final _pass = TextEditingController();

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
                "assets/images/signup.png",
                height: size.height * 0.4,
              ),
              const Text(
                "\n\nSignup To Password Manager",
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
                    hintText: "Write your Email here",
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
                    hintText: "Write your Password here",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple)),
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
                          'Please wait while we register your account',
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
                            .createUserWithEmailAndPassword(
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
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.purple,
                          content: Text(
                            'Error this email is already registered',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ));
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.purple,
                      side: const BorderSide(color: Colors.purple),
                    ),
                    child: const Text(
                      "SIGNUP",
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
