import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Temperature Converter App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TempConvertor(),
    );
  }
}

class TempConvertor extends StatefulWidget {
  _TempConvertorState createState() => _TempConvertorState();
}

class _TempConvertorState extends State<TempConvertor> {
  final TextEditingController _temp = TextEditingController();
  String con = '';
  bool? check;
  String? result;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TEMPERATURE CONVERTOR")),
        body: Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                        controller: _temp,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter value',
                        )),
                    const SizedBox(height: 15),
                    Text(
                      "Convert To:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: RadioListTile(
                                title: const Text("F"),
                                value: "F",
                                groupValue: con,
                                onChanged: (value) {
                                  con = value.toString();
                                  setState(() {
                                    check = false;
                                  });
                                })),
                        Expanded(
                          child: RadioListTile(
                              title: const Text("C"),
                              value: "C",
                              groupValue: con,
                              onChanged: (value) {
                                setState(() {
                                  con = value.toString();
                                  check = true;
                                });
                              }),
                        )
                      ],
                    ),
                    Text(result == null ? " " : "$result",
                        style: TextStyle(fontSize: 20)),
                    ElevatedButton(onPressed: convert, child: Text("CONVERT")),
                  ])),
        ));
  }

  void convert() {
    double temp = double.parse(_temp.text);
    double converted = 0;
    if (check == false) {
      converted = (temp * 9 / 5) + 32;
    } else {
      converted = (temp - 32) * 5 / 9;
    }
    result = converted.toStringAsFixed(2);
    setState(() {});
  }
}
