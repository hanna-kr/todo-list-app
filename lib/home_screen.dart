import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Platformspezifisches Styling',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Platform.isAndroid)
              ElevatedButton(
                onPressed: () {
                  _dialogBuilder(context);
                },
                child: const Icon(Icons.person),
              )
            else if (Platform.isIOS)
              CupertinoButton(
                color: Colors.teal,
                child: const Icon(CupertinoIcons.person),
                onPressed: () {
                  _dialogBuilder(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    if (Platform.isAndroid) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('User'),
            content: const Text('Lorem ipsum dolor sit amet\n'
                'consectetur adipiscing elit.'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (Platform.isIOS) {
      return showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('User'),
            content: const Text('Lorem ipsum dolor sit amet\n'
                'consectetur adipiscing elit.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return Future.value();
    }
  }
}
