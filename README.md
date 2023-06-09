# riverpod_news_app
https://www.youtube.com/watch?v=zuJav1VQ8jY&list=WL&index=8

https://github.com/maroafenogho/riverpod_news_app

## [Part 1](https://github.com/YamamotoDesu/riverpod_news_app/commit/677acb8133f7f9736c41e352a7bbd03446bd5af3)
<img width="300" alt="スクリーンショット 2023-05-07 9 59 07" src="https://user-images.githubusercontent.com/47273077/236652447-2047de06-14bd-4a18-bf9a-70785ef774f7.png">

lib/counter_controller.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider(
  (ref) => 0,
);

final textProvider = Provider(
  (ref) => 'You have pushed the button this many times:',
);
```

lib/main.dart
```dart
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


```

## [Part 2](https://github.com/YamamotoDesu/riverpod_news_app/commit/3510a4801346fa2663865bee0118d48a6b69be5d)

<img width="300" alt="スクリーンショット 2023-05-07 12 11 33" src="https://user-images.githubusercontent.com/47273077/236655618-cb9038af-52d9-4343-92b5-298d563a2d1e.png">

