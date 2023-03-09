// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tcc/widgets/adoptionpage.dart';
// import 'package:tcc/widgets/loginpage.dart';
// import 'package:tcc/widgets/searchpage.dart';
// import 'package:tcc/widgets/vetpage.dart';
// import 'package:tcc/widgets/profilepage.dart';
// import 'package:tcc/widgets/button/button.dart';

// class ChatPage extends StatefulWidget {
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   @override
//   Widget build(BuildContext context) {
     
     
//       return StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('chat').snapshots(),
//             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError){
//                 return Center(child: Text("Algo deu errado"));
//               }
//               if (snapshot.hasData){}
//               return CustomScrollView(
//             slivers: [
//               CupertinoSliverNavigationBar(
              
//               largeTitle: Text ("Chat"),
//               ), 
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                 snapshot.data!.docs.map((DocumentSnapshot document) {
//                 Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//                 return ListTile(title: Text(data['title']),);
//                 }).toList()))
//             ],
//               );
//             }

//       );
    
//     // return Scaffold(
      
//     //     appBar: AppBar(
//     //       backgroundColor: const Color(0xFF035397),
//     //       toolbarHeight: 60,
//     //       actions: <Widget>[
//     //         IconButton(
//     //           icon: const Icon(Icons.search, color: Colors.white, size: 40),
//     //           onPressed: () {},
//     //         ),
//     //         SizedBox(width: 15),
//     //       ],
//     //     ),
//     //     drawer: Drawer(
//     //         backgroundColor: Color(0xff047CE2),
//     //         child: ListView(
//     //           padding: EdgeInsets.only(left: 18),
//     //           children: [
//     //             const SizedBox(
//     //                 height: 70,
//     //                 child: DrawerHeader(
//     //                   decoration: BoxDecoration(
//     //                     color: Color(0xff047CE2),
//     //                   ),
//     //                   child: null,
//     //                 )),
//     //             ListTile(
//     //               title: const Text('Adoção',
//     //                   style: TextStyle(
//     //                       color: Color(0xffffffff),
//     //                       fontSize: 20,
//     //                       fontFamily: 'Karla')),
//     //               onTap: () {
//     //                 Navigator.push(
//     //                     context,
//     //                     MaterialPageRoute(
//     //                       builder: (context) => BottonNavigationBar0(),
//     //                     ));
//     //               },
//     //             ),
//     //             ListTile(
//     //               title: const Text('Perdidos',
//     //                   style: TextStyle(
//     //                     color: Color(0xffffffff),
//     //                     fontSize: 20,
//     //                     fontFamily: 'Karla',
//     //                   )),
//     //               onTap: () {
//     //                 Navigator.push(
//     //                     context,
//     //                     MaterialPageRoute(
//     //                       builder: (context) => BottonNavigationBar1(),
//     //                     ));
//     //               },
//     //             ),
//     //             ListTile(
//     //                 selectedTileColor: Color(0xFF035397),
//     //                 title: const Text('Chat',
//     //                     style: TextStyle(
//     //                       color: Color(0xffffffff),
//     //                       fontSize: 20,
//     //                       fontFamily: 'Karla',
//     //                     )),
//     //                 onTap: () {
//     //                   Navigator.pop(context);
//     //                 }),
//     //             ListTile(
//     //               title: const Text('Veterinário',
//     //                   style: TextStyle(
//     //                     color: Color(0xffffffff),
//     //                     fontSize: 20,
//     //                     fontFamily: 'Karla',
//     //                   )),
//     //               onTap: () {
//     //                 Navigator.push(
//     //                     context,
//     //                     MaterialPageRoute(
//     //                       builder: (context) => VetPage(),
//     //                     ));
//     //               },
//     //             ),
//     //             ListTile(
//     //               title: const Text('Perfil',
//     //                   style: TextStyle(
//     //                     color: Color(0xffffffff),
//     //                     fontSize: 20,
//     //                     fontFamily: 'Karla',
//     //                   )),
//     //               onTap: () {
//     //                 Navigator.push(
//     //                     context,
//     //                     MaterialPageRoute(
//     //                       builder: (context) => BottonNavigationBar4(),
//     //                     ));
//     //               },
//     //             ),
//     //             SizedBox(
//     //               height: 455,
//     //             ),
//     //             Positioned(
//     //                 bottom: 22,
//     //                 child: ListTile(
//     //                     title: Text("Sair",
//     //                         style: TextStyle(
//     //                           color: Color(0xffffffff),
//     //                           fontSize: 20,
//     //                           fontFamily: 'Karla',
//     //                         )),
//     //                     leading: Icon(Icons.exit_to_app,
//     //                         color: Color(0xffffffff), size: 40),
//     //                     onTap: () {
//     //                       Navigator.push(
//     //                           context,
//     //                           MaterialPageRoute(
//     //                             builder: (context) => LoginPage(),
//     //                           ));
//     //                     }))
//     //           ],
//     //         )),
          
         

//   }}