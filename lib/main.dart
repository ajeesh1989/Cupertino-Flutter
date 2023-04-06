import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const CupertinoApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime dateTime = DateTime(3000, 2, 1, 10, 20);
  final TextEditingController _textcontroller = TextEditingController();
  double _currentValue = 1;
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
          brightness: Brightness.dark,
          // primaryColor: Colors.black,
          scaffoldBackgroundColor: Color.fromARGB(255, 44, 64, 79)),
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Color.fromARGB(255, 28, 41, 51),
          middle: Text('Introduction to Cupertino items'),
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: CupertinoSearchTextField(
                  controller: _textcontroller,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    _currentValue.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CupertinoSlider(
                    value: _currentValue,
                    min: 0,
                    max: 20,
                    divisions: 10,
                    onChanged: (selectedValue) {
                      setState(() {
                        _currentValue = selectedValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: CupertinoActivityIndicator(
                radius: 30,
                color: Colors.white,
              ),
            ),
            CupertinoButton(
              child: const Text(
                'CupertinoAlertDialogue',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Alert'),
                    content: const Text('Do you like cupertino?'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      )
                    ],
                  ),
                );
              },
            ),
            CupertinoButton(
              child: Text(
                '${dateTime.day}-${dateTime.month}-${dateTime.year}',
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      initialDateTime: dateTime,
                      backgroundColor: Colors.grey.shade900,
                      onDateTimeChanged: (DateTime newtime) {
                        setState(() => dateTime = newtime);
                      },
                      use24hFormat: true,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CupertinoSwitch(
                value: _switch,
                onChanged: (bool value) {
                  setState(() {
                    _switch = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
