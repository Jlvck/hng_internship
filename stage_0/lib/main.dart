import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String address) async {
      final Uri _url = Uri.parse(address);

      try {
        print(
          'trying to launch $_url',
        );
        if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $_url');
        }
      } catch (e) {
        print('could ot launch ');
        final snackBar = SnackBar(
          content: Text(
            'Could not lauch URL, please try again later',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.white,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Stage 0',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Builder(builder: (context) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenHeight = MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                AppBar().preferredSize.height;
            print(AppBar().preferredSize.height);
            return SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                'Ogudu Jonathan',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                'Jlvck 0',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                'Flutter Developer',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),

                        // Bu
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Links',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            _launchUrl(
                                'https://github.com/Jlvck/hng_internship');
                          },
                          label: Text(
                            'GitHub',
                            selectionColor: Colors.white,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            _launchUrl(
                                'http://hng.tech/hire/flutter-developers');
                          },
                          label: Text(
                            'HNG',
                            selectionColor: Colors.white,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
