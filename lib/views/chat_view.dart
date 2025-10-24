import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.title});

  final String title;

  @override
  State<ChatView> createState() => ChatViewState();
}

class ChatViewState extends State<ChatView> {



  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
           child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

          ],
        ),
      ),
       );
  }
}