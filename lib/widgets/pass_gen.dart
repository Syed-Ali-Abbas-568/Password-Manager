import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pass_create.dart';

class PassGen extends StatefulWidget {
  const PassGen({Key? key}) : super(key: key);

  @override
  State<PassGen> createState() => _PassGenState();
}

class _PassGenState extends State<PassGen> {
  final _controller = TextEditingController();
  bool upperLetter = true;
  bool lowerLetter = false;
  bool number = false;
  bool special = false;
  double length = 8;
  bool invalid = false;
  int counter = 8;
  void init() {
    if (upperLetter || lowerLetter || (special || number)) {
      final password = generatePassword(
          upperLetter, lowerLetter, number, special, length.roundToDouble());
      _controller.text = password;
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Center(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Random Password Generater',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
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
                        const snackbar =
                            SnackBar(content: Text("Copied to Clipboard"));

                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(snackbar);
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ),
                ),
              ),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              createButtonWidget(),
            ]),
      ),
    );
  }

  Widget createButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        onPressed: () {
          if (upperLetter || lowerLetter || (special || number)) {
            final password = generatePassword(upperLetter, lowerLetter, number,
                special, length.roundToDouble());
            _controller.text = password;
          } else {
            const snackbar = SnackBar(
                content: Text("Alert: You must tick at least 1 tick box"));

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackbar);
          }
        },
        child: const Text(
          "Generate",
          style: TextStyle(color: Colors.white),
        ));
  }
}
