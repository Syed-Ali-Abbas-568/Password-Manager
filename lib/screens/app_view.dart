import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/screens/welcome.dart';
import 'package:password_manager/widgets/pass_gen.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.create),
                text: "Password\nGenerater",
              ),
              Tab(
                icon: Icon(Icons.list),
                text: "Password List",
              ),
            ],
          ),
          title: const Text(
            "Password Manager",
            style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // Implement Search
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                            title: const Text("Alert"),
                            content:
                                const Text("Are you sure you want to log out?"),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WelcomeScreen()));
                                  },
                                  child: const Text("YES")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: const Text("NO")),
                            ]));
              },
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: const TabBarView(
          children: [
            PassGen(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
