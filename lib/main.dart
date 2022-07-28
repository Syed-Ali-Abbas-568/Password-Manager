import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = TextEditingController();
//  final scaffodlKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text('Password Manager'),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Generate Random Password',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      final data = ClipboardData(text: _controller.text);
                      Clipboard.setData(data);
                      // final snackbar =
                      //     SnackBar(content: Text("Password Copied"));
                      // ScaffoldMessenger.of(context)
                      //   ..removeCurrentSnackBar()
                      //   ..showSnackBar(snackbar);
                    },
                    icon: Icon(Icons.copy),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ))),
    );
  }
}
