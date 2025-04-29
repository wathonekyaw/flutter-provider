import 'package:flutter/material.dart';
import 'counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Counter(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Provider Basic ')),
      body: Center(child: Text(' Count : ${counter.count}', style: TextStyle(fontSize: 30))),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,

        child: Icon(Icons.add),
      ),
    );
  }
}
