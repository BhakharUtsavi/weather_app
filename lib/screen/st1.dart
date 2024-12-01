import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class St1 extends StatefulWidget {
  const St1({super.key});

  @override
  State<St1> createState() => _St1State();
}

class _St1State extends State<St1> {

  String _responseText = 'Press the button to fetch data.';
  bool _isLoading = false;

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
      _responseText = 'Loading...';
    });

    const String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1'; // Example API endpoint

    try {
      final response = await get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _responseText = "Title: ${data['title']}\nBody: ${data['body']}";
        });
      } else {
        setState(() {
          _responseText = 'Error: Failed to fetch data. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _responseText = 'Error: Unable to fetch data.\n$e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Request Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _responseText,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: fetchData,
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }
}
