// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/publicationpage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/database/db_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

int selectedIndex = 1;


 class SearchPage extends StatefulWidget {
 const SearchPage({Key? key}) : super(key: key);
 

  @override

  _SearchPage createState() => _SearchPage();

  }


  class _SearchPage extends State<SearchPage> {
  
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    refs = (await storage.ref('images').listAll()).items;
    for(var ref in refs) {
      arquivos.add(await ref.getDownloadURL());
    }
    setState(() {
      loading = false;
    });
  }

  firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;
  
  
  Stream<QuerySnapshot> _getList () {
    return db.collection('perdidos').snapshots();
  }

  @override

  
  Widget build(BuildContext context) {
    // var especie2 = especie;
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: const Color(0xFF035397),
          toolbarHeight: 60,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 40),
              onPressed: () {},
            ),
            const SizedBox(width: 15),
          ],
        ),

        //DRAWER
        drawer: Drawer(
            backgroundColor: const Color(0xff047CE2),
            child: ListView(padding: const EdgeInsets.only(left: 18), children: [
              const SizedBox(
                  height: 70,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff047CE2),
                    ),
                    child: null,
                  )),
              ListTile(
                selectedTileColor: const Color(0xFF035397),
                title: const Text('Adoção',
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'Karla')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Perdidos',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                      fontFamily: 'Karla',
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottonNavigationBar1(),
                      ));
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
                          builder: (context) => const BottonNavigationBar3(),
                        ));
                  }),
              ListTile(
                title: const Text('Dicas',
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
                        builder: (context) => const BottonNavigationBar4(),
                      ));
                },
              ),
              const SizedBox(
                height: 455,
              ),
              ListTile(
                  title: const Text("Sair",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'Karla',
                      )),
                  leading: const Icon(Icons.exit_to_app,
                      color: Color(0xffffffff), size: 40),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                })
                ]
                )),

          //CARDS
          body: Padding(
          padding: const EdgeInsets.all(16),
            child: StreamBuilder<QuerySnapshot>(
              stream: _getList() ,
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
         elevation: 0,
         child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          SizedBox( 
          height: 180,
          width: 240,    
          child: ListTile(
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10))),
          title: Image.asset('assets/images/noimage.png'),
          )),

          DecoratedBox(
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),

        
          child: ListTile(
          leading: const Text("Descrição:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15
          )),
          title: Text(doc['Descrição'],
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )
          ),
          textColor: Colors.white,
          tileColor: const Color(0xff035397),
          )),
       
          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),
          
          ExpansionTile(
          textColor: Colors.white,
          collapsedTextColor: Colors.white,
          backgroundColor: const Color(0xff047CE2),
          collapsedBackgroundColor: const Color(0xff047CE2),
          leading: const Text("Espécie:",
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )),
          title:  Text(doc['Espécie'],
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          ),
          ),
          trailing: const Icon(Icons.arrow_drop_down, color: Colors.white),
          children: [ 
          
          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),

          ListTile(
          leading: const Text("Localização:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15)),
          title: Text(doc['Localização'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )
          ),
          textColor: Colors.white,
          ),

          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),


          ListTile(
          leading: const Text("Raça:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15)),
          title:  Text(doc['Raça'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )),
          textColor: Colors.white,
          ),
         
          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),
          
          ListTile(
          leading: const Text("Sexo:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15)),
          title:  Text(doc['Sexo'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )),
          textColor: Colors.white,
          ),
          
          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),
          
          ListTile(
          leading: const Text("Porte:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15)),
          title:  Text(doc['Porte'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )),
          textColor: Colors.white,
          ),

          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),

          ListTile(
          leading: const Text("Idade:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15
          )),
          title: Text(doc['Idade'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )
          ),
          textColor: Colors.white,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),     
        )
      )),

          const Divider(
          height: 1,
          color:Color.fromARGB(255, 38, 147, 242),
          ),

          ListTile(
          leading: const Text("Situação:", 
          style: TextStyle(
          fontFamily: 'Karla',
          fontSize: 15
          )),
          title: Text(doc['Situação'], 
          style: const TextStyle(
          fontFamily: 'Karla',
          fontSize: 15,
          )
          ),
          textColor: Colors.white,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),     
          ))),
        

      ])]))
      )
      ]);
  });
  }})));
 

    
               
  }}