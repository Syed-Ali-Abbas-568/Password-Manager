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
  bool upperLetter = true;
  bool lowerLetter = false;
  bool number = false;
  bool special = false;
  double length = 8;
  bool invalid = false;
  int counter = 8;
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
                      // const snackbar = SnackBar(content: Text("Password Copy"));

                      // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    icon: Icon(Icons.copy),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CreateButtonWidget(),
              const Text(
                "Options",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: const Text('UpperCase Letters'),
                value: upperLetter,
                onChanged: (upperLetter) =>
                    setState(() => this.upperLetter = upperLetter!),
              ),
              CheckboxListTile(
                title: const Text('LowerCase Letters'),
                value: lowerLetter,
                onChanged: (lowerLetter) =>
                    setState(() => this.lowerLetter = lowerLetter!),
              ),
              CheckboxListTile(
                title: const Text('Numbers'),
                value: number,
                onChanged: (number) => setState(() => this.number = number!),
              ),
              CheckboxListTile(
                title: const Text('Special Symbols'),
                value: special,
                onChanged: (special) => setState(() => this.special = special!),
              ),
              const Text(
                'Length',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Slider(
                  value: length,
                  min: 8.0,
                  max: 50.0,
                  label: length.round().toString(),
                  onChanged: (double newValue) {
                    setState(() {
                      length = newValue;
                      counter = length.round();
                    });
                  }),
              Visibility(
                visible: invalid,
                child: const Text('Alert: You must tick at least 1 tick box',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              )
            ],
          ))),
    );
  }

  Widget CreateButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {
          if ((upperLetter == false && lowerLetter == false) &&
              (special == false && number == false)) {
            invalid = true;
          } else {
            invalid = false;
            final password = generatePassword(upperLetter, lowerLetter, number,
                special, length.roundToDouble());
            _controller.text = password;
          }
        },
        child: const Text(
          "Generate",
          style: TextStyle(color: Colors.white),
        ));
  }
}
