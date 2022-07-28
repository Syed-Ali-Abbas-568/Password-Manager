import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'passCreate.dart';

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
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _controller,
                readOnly: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      final data = ClipboardData(text: _controller.text);
                      Clipboard.setData(data);
                      const snackbar = SnackBar(content: Text("Password Copy"));

                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackbar);
                    },
                    icon: Icon(Icons.copy),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CreateButtonWidget(),
            ],
          ))),
    );
  }

  Widget CreateButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {
          final password = generatePassword();
          _controller.text = password;
        },
        child: Text(
          "Generate",
          style: TextStyle(color: Colors.white),
        ));
  }
}
