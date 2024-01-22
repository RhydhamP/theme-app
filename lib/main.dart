import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final isDarkProvider = StateProvider<bool>((ref) => false);

class MyApp extends ConsumerWidget {
  // const MyApp({super.key});
  // bool isDark = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(isDarkProvider);
    return MaterialApp(
      themeMode: value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.green,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(isDarkProvider);
    return Material(
      child: Column(children: [
        SizedBox(
          height: 300,
        ),
        ElevatedButton(
            onPressed: () {
              // if (isDark) {
              //   isDark = false;
              // } else {
              //   isDark = true;
              // }

              ref.read(isDarkProvider.notifier).state = !value;
            },
            child: Text(
              "Click",
              selectionColor: Colors.purple,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.yellow),
            )),
        SizedBox(
          height: 40,
        ),
      ]),
    );
  }
}
