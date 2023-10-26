import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int totalMoney = 10000;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Manager"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Total Money : $totalMoney",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 2.0,
              ),
              const SizedBox(
                height: 450,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          totalMoney = totalMoney + 500;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        color: Colors.blue,
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        showBottom(context);
                      },
                      child: Container(
                        width: 250,
                        height: 100,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text(
                          "I'm Buying",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget showBottom(context) {
  return Center(
      child: ElevatedButton(
          child: const Text('showModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }));
}
