import 'package:flutter/material.dart';
import 'adaptive_logic.dart'; // Make sure this file contains sendToBackend()

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetaClass Adaptive Logic',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int userScore = 68;
  final String topicName = "Photosynthesis";
  bool isSending = false;

  void handleButtonClick() async {
    if (isSending) return;

    setState(() => isSending = true);
    await sendToBackend(userScore, topicName);
    setState(() => isSending = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sent to backend! Check terminal.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MetaClass Adaptive Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: handleButtonClick,
          child: Text(isSending ? 'Sending...' : 'Test Adaptive Logic'),
        ),
      ),
    );
  }
}
