// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/widgets/informationpage.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/publicationpage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/widgets/informationppage.dart';
import 'package:tcc/database/db_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

int selectedIndex = 1;


 class SearchPage extends StatefulWidget {
 const SearchPage ({Key? key}) : super(key: key);
 

  @override

  _SearchPage  createState() => _SearchPage ();

  }


  class _SearchPage extends State<SearchPage> {
  
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  // Reference referenceRoot = FirebaseStorage.instance.ref();
  // Reference referenceDirImages = referenceRoot.child('images');

  // Reference referenceImageToUpload = referenceDirImages

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
    if (this.mounted) { // check whether the state object is in tree
    setState(() {
      loading = false;
      // make changes here
    });
  }
  }

  firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;
  
  
  Stream<QuerySnapshot> _getList () {
    return db.collection('perdidos').snapshots();
  }

  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage2(post: post,)));

  }

  @override

  
  Widget build(BuildContext context) {
    // var especie2 = especie;
    return Scaffold(
                 backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
            backgroundColor: const Color(0xffF5F5F5),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Builder(
            builder: (context) => 
            Container(
            width: 45,
            height: 45,
            child: IconButton(
            icon: const Icon(Icons.menu_rounded, color: Color(0xFFFCD900)),
            onPressed: () => Scaffold.of(context).openDrawer()),
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)), 
            color: const Color(0xFF035397),
                ),
            )),
          ),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        ),


      drawer: Drawer(
            backgroundColor: Color(0xfffffffff),
            child:
            ListView(padding: const EdgeInsets.only(left: 18), children: [
              const SizedBox(
                  height: 110,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                         color: Color(0xfffffffff),
                    //   image: DecorationImage(
                    //     image: AssetImage('assets/images/Drawer.png'),
                    //     fit: BoxFit.cover,
                    // )
                    ),
                    child: Text('DetectPet',
                    style: TextStyle(
                        color: Color(0xFF035397),
                        fontSize: 40,
                        fontFamily: 'Chewy-Regular')),
                    ),
                  ),
              ListTile(
                leading: Icon(Icons.pets_rounded,
                color: Color(0xFF035397), size: 30),
                selectedTileColor: const Color(0xFF035397),
                title: const Text('Adoção',
                    style: TextStyle(
                        color: Color(0xFF035397),
                        fontSize: 20,
                        fontFamily: 'Karla')),
                onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationBar0()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.pets_rounded,
                color: Color(0xFF035397), size: 30),
                title: const Text('Perdidos',
                    style: TextStyle(
                      color: Color(0xFF035397),
                      fontSize: 20,
                      fontFamily: 'Karla',
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationBar2(),
                      ));
                },
              ),

              // ListTile(
              //     title: const Text('Chat',
              //         style: TextStyle(
              //           color: Color(0xffffffff),
              //           fontSize: 20,
              //           fontFamily: 'Karla',
              //         )),
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const BottonNavigationBar3(),
              //           ));
              //     }),
            //  Divider(),
            //   ListTile(
            //     title: const Text('Dicas',
            //         style: TextStyle(
            //           color: Color(0xff047CE2),
            //           fontSize: 20,
            //           fontFamily: 'Karla',
            //         )),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => VetPage(),
            //           ));
            //     },
            //   ),
              // ListTile(
              //   title: const Text('Perfil',
              //       style: TextStyle(
              //         color: Color(0xffffffff),
              //         fontSize: 20,
              //         fontFamily: 'Karla',
              //       )),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const BottonNavigationBar4(),
              //         ));
              //   },
              // ),
              ListTile(
                  title: const Text("Sair",
                      style: TextStyle(
                        color: Color(0xFF035397),
                        fontSize: 20,
                        fontFamily: 'Karla',
                      )),
                  leading: const Icon(Icons.exit_to_app,
                      color: Color(0xFF035397), size: 30),
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
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                     const 
                     Text('Pets Perdidos', style: TextStyle(fontFamily: 'Chewy-Regular',
                    fontSize: 25,
                    color: Color(0xFF035397)),),

                    Divider(),
                    
                    // TextField (
                    // decoration: InputDecoration(
                    // filled: true,
                    // fillColor:  Colors.white,
                    // border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(5),
                    // borderSide: BorderSide.none,
                    // ),       
                    // hintText: 'Pesquise',
                    // )),
                    

              

            StreamBuilder<QuerySnapshot>(
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
      
      return Expanded(
          child:  ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: ( _, index) {
      
      final DocumentSnapshot doc = snapshot.data!.docs[index];
      return  Expanded(
          child:Column(            
        
          children: [
          Padding(
          padding: const EdgeInsets.all(16.0),   
           child: Card(
         elevation: 0,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          SizedBox( 
          height: 115,
          width: 400,    
          child: ListTile(
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10))),
          title: Image.network('${doc['Imagem']}', fit: BoxFit.cover),
          
          )),

          // DecoratedBox(
          // decoration: const BoxDecoration(
          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),

         Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ),
          child:Column(
            children: [
          SizedBox(
          height: 70,
          width: 400,
          child: DecoratedBox(
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
          
         
          child: ListTile(
          title: Text(
          doc['Nome'],
          textAlign: TextAlign.start,
          style: const TextStyle(
          fontFamily: 'Karla',
          fontWeight: FontWeight.bold,
          fontSize: 18)  
          ),
         
        subtitle: Text(
        doc['Localização'],
        textAlign: TextAlign.start,
        style: const TextStyle(
        fontFamily: 'Karla',
        fontSize: 15)  
        ),
        
        trailing: ButtonTheme(
       child: ElevatedButton(
          onPressed: () => navigateToDetail(doc),
        
          child: const Text(
            "Ver Mais",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Karla',
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 2,
              fixedSize: const Size(100, 30),
              primary: const Color(0xFF035397),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
      )))))]),
       
       
     
       ),
        
        
        
     
        ]

          
         
        
          
          
      )))]));
  

    
               
              }));
              }})])));}}
