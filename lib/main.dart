import 'dart:math';

import 'package:flutter/material.dart' hide Card;
import 'package:projet/cards/Card.dart';

VALUE get_random_value() {
  final random = Random();

  final VALUE rand_val =
      VALUE.values[random.nextInt(VALUE.values.length)];

  return rand_val;
}
TYPE get_random_type() {
  final random = Random();

  final TYPE rand_kind =
      TYPE.values[random.nextInt(TYPE.values.length)];

  return rand_kind;
}

void set_hand(List<Card> hand) {
  hand.clear();
  for(int i = 0; i < 5; i++){
      hand.add(Card(get_random_value(), get_random_type()));
    }
}



void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp> {

  List<Card> hand = [];

  @override
  void initState() {
    set_hand(hand);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Hello"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: .min,
          children: hand.map(construireCase).toList(),
        )
      ),
      floatingActionButton: ElevatedButton(onPressed: () => setState(() {
        set_hand(hand);
      }), child: Text("Randomize")),
    );
  }


  Widget construireCase(Card carte) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.shade50,
      ),
      child: Column(mainAxisSize: .min,
        children: [Text(carte.value.name), Text(carte.kind.name)]),
    );
  }
}