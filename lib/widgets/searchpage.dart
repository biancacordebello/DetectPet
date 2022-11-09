import 'package:flutter/material.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/publicationpage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/database/db_firestore.dart';
import 'package:uuid/uuid.dart';


class SearchPage extends StatefulWidget {
 const SearchPage({Key? key}) : super(key: key);
 

  @override

  _SearchPage createState() => _SearchPage();

  }


  class _SearchPage extends State<SearchPage> {

  
 @override

Stream<QuerySnapshot> _getList1 () {
    return db.collection('publicacao').snapshots();
  }


  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;



  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF035397),
          toolbarHeight: 70,
         shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(40),
         )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 40),
              onPressed: () {},
            ),
            SizedBox(width: 15),
          ],
        ),
        drawer: Drawer(
            backgroundColor: Color(0xff047CE2),
            child: ListView(padding: EdgeInsets.only(left: 18), children: [
              const SizedBox(
                  height: 70,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff047CE2),
                    ),
                    child: null,
                  )),
              ListTile(
                title: const Text('Adoção',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'Karla')),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottonNavigationBar0(),
                      ));
                },
              ),
              ListTile(
                selectedTileColor: Color(0xFF035397),
                title: const Text('Perdidos',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'Karla',
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                  title: const Text('Chat',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'Karla',
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottonNavigationBar3(),
                        ));
                  }),
              ListTile(
                title: const Text('Veterinário',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'Karla',
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VetPage(),
                      ));
                },
              ),
              ListTile(
                title: const Text('Perfil',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'Karla',
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottonNavigationBar4(),
                      ));
                },
              ),
              SizedBox(
                height: 455,
              ),
              Positioned(
                  bottom: 22,
                  child: ListTile(
                      title: Text("Sair",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                            fontFamily: 'Karla',
                          )),
                      leading: Icon(Icons.exit_to_app,
                          color: Color(0xffffffff), size: 40),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      }))
            ])),
  
              body: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getList1() ,
              builder: ( _, snapshot) {
                switch(snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:

                    return const Center(
                    child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:

                  case ConnectionState.done:
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("Não Possui Dado"),
                    );
                  }
      
              return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ( _, index) {
              
              final DocumentSnapshot doc = snapshot.data!.docs[index];
              return Column(            
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Padding(
                  padding: const EdgeInsets.all(30.0),   
                  child: Card(
                elevation: 3,
                child: Column(                
                children: <Widget>[
                  SizedBox( 
                  height: 130,
                  width: 320,    
                  child: ListTile(
                  shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27))),
                  leading: Center( 
                  child: Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                        image: DecorationImage(
                            image: AssetImage('assets/images/noimage.png'),
                            fit: BoxFit.cover)))),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
          'A sufficiently long subtitle warrants three lines.'
        ),
                 )), 
                      ]
              )))]);
                  
                });
              }}))
                 
                
            
            );

  }
  
  }
  