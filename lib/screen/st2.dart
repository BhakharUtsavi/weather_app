// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// class St2 extends StatefulWidget {
//   const St2({super.key});
//
//   @override
//   State<St2> createState() => _St2State();
// }
//
// class _St2State extends State<St2> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapar/model/userdatamodel.dart';

class St2 extends StatefulWidget {
  final int userId;

  St2({required this.userId});

  @override
  _St2State createState() => _St2State();
}

class _St2State extends State<St2> {
  late Future<UserDataModel> userDetail;

  @override
  void initState() {
    super.initState();
    userDetail = fetchUserDetail(widget.userId);
  }

  Future<UserDataModel> fetchUserDetail(int userId) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> userJson = json.decode(response.body);
      return UserDataModel.fromJson(userJson);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: FutureBuilder<UserDataModel>(
        future: userDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else {
            return Center(child: Text('No user details found'));
          }
        },
      ),
    );
  }
}
