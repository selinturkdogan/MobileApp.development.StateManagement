import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;
  String _message = 'Press + to start!';

  void _increment() {
    setState(() {
      _count++;
      _message = 'Going up! 🚀';
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
      _message = _count == 0
          ? 'Cannot go lower!'
          : 'Going down 📉';
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
      _message = 'Reset! Fresh start 🔄';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message),
            const SizedBox(height: 20),
            Text(
              '$_count',
              style: const TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decrement, child: const Text('-')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _reset, child: const Text('Reset')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _increment, child: const Text('+')),
              ],
            )
          ],
        ),
      ),
    );
  }
}