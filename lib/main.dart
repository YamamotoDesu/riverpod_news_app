import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_news_app/counter_controller.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counterText = ref.watch(counterProvider);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ref.watch(textProvider)),
                Text(
                  counterText.toString(),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  child: Container(
                    color: Colors.blue,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
