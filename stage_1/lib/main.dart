import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'encryptor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  String _outputText = '';

  void _encryptText() {
    final encryptor = Encryptor(key: _keyController.text);
    setState(() {
      _outputText = encryptor.encrypt(_textController.text);
    });
  }

  void _decryptText() {
    final encryptor = Encryptor(key: _keyController.text);
    setState(() {
      _outputText = encryptor.decrypt(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;

    bool checkTextController() {
      if (_textController.text.isEmpty || _keyController.value.text.isEmpty) {
        _messangerKey.currentState!.showSnackBar(
          const SnackBar(
            content: Text('Input text & key cannot be empty'),
            showCloseIcon: true,
          ),
        );
        return false;
      }
      return true;
    }

    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Stage 1',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Encryttion & Decrytption Program',
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _keyController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Enter key',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (checkTextController()) _encryptText();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black),
                        ),
                        child: const Text('Encrypt'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (checkTextController()) _decryptText();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black),
                        ),
                        child: const Text('Decrypt'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Output:', style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        _outputText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: _outputText));
                          _messangerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content: Text('Copied to clipboard'),
                              showCloseIcon: true,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black),
                        ),
                        child: const Text('Copy'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _outputText = '';
                            _textController.clear();
                            _keyController.clear();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          foregroundColor:
                              WidgetStateProperty.all(Colors.black),
                        ),
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Ogudu Jonathan',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tag Name:',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Jlvck 0',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title:',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
