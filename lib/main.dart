import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RichTextError(),
    );
  }
}

class RichTextError extends StatefulWidget {
  const RichTextError({Key? key}) : super(key: key);

  @override
  State<RichTextError> createState() => _RichTextErrorState();
}

class _RichTextErrorState extends State<RichTextError> {
  bool _checkboxState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RichText as title in CheckboxListTile error'),
      ),
      body: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: _checkboxState,
        onChanged: (value) => setState(() {
          _checkboxState = value!;
        }),
        title: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'This is to demo'),
              TextSpan(
                text: ' to demo something wrong',
                style: Theme.of(context).textTheme.headline6,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('something');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
