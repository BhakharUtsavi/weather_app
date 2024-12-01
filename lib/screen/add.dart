// import 'package:flutter/material.dart';
// import 'package:wallpapar/model/apihelper.dart';
// import '../model/userrestmodel.dart';
//
// class Add extends StatefulWidget {
//   const Add({super.key});
//
//   @override
//   State<Add> createState() => _AddState();
// }
//
// class _AddState extends State<Add> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController name = TextEditingController();
//     TextEditingController email = TextEditingController();
//     GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     bool isDeleteLoad = false;
//
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (context,) {
//                         return AlertDialog(
//                             title: Text("Add User"),
//                             content: Form(
//                               key: formKey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   TextFormField(
//                                     controller: name,
//                                     textInputAction: TextInputAction.next,
//                                     validator: (val) {
//                                       if (val!.isEmpty) {
//                                         return "Enter Name";
//                                       }
//                                       return null;
//                                     },
//                                     decoration:
//                                     InputDecoration(hintText: "Enter Name"),
//                                   ),
//                                   TextFormField(
//                                     textInputAction: TextInputAction.done,
//                                     controller: email,
//                                     validator: (val) {
//                                       if (val!.isEmpty) {
//                                         return "Enter email";
//                                       }
//                                       return null;
//                                     },
//                                     decoration: InputDecoration(
//                                         hintText: "Enter Email"),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             actions: [
//                               TextButton(
//                                   onPressed: () {
//                                     if (formKey.currentState!.validate()) {
//                                       ApiHelper.obj
//                                           .addUser(name.text, email.text);
//                                     }
//                                   },
//                                   child: Text("Add")),
//                             ]);
//                       });
//                 },
//                 icon: Icon(Icons.add)),
//           ],
//         ),
//         body: FutureBuilder<List<dynamic>>(
//             future: ApiHelper.obj.getRestUser(),
//             builder: (context, snap) {
//               if (snap.hasData) {
//                 List users = snap.data ?? [];
//                 return ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     Map<String, dynamic> user = users[index];
//                     RestUserModel restUserModel = RestUserModel.fromJson(user);
//                     return ListTile(
//                       leading: CircleAvatar(
//                         child: Text("${restUserModel.id}"),
//                       ),
//                       trailing: StatefulBuilder(builder: (context, fun) {
//                         if (isDeleteLoad) {
//                           return CircularProgressIndicator();
//                         }
//                         return IconButton(
//                             onPressed: () async {
//                               isDeleteLoad = true;
//                               fun(() {});
//                               bool isDelete = await ApiHelper.obj.DeleteUser(restUserModel.id ?? 0);
//                               if (isDelete) {
//                                 users.removeAt(index);
//                                 setState(() {});
//                               }
//                               isDeleteLoad = false;
//                               fun(() {});
//                             },
//                             icon: Icon(Icons.delete));
//                       }),
//                       title: Text(restUserModel.name ?? "-"),
//                       subtitle: Text(restUserModel.email ?? "-"),
//                     );
//                   },
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
//     );
//   }
// }
