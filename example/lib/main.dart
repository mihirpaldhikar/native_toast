import 'package:flutter/material.dart';
import 'package:native_toast/native_toast.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Native Toast Example',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Toast Example'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show Native Toast'),
            onPressed: () async {
              await NativeToast.makeText(
                message: "This is a Native Toast On Android!",
                duration: NativeToast.shortLength,
              );
            },
          ),
        ),
      ),
    );
  }
}
