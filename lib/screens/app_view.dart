import 'package:flutter/material.dart';
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
                // do something
                //display an alert box with yes no optoin
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
