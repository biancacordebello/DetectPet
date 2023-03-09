// import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/database/db_firestore.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



 class InformationPage2 extends StatefulWidget {
 
  final DocumentSnapshot post;

  InformationPage2({required this.post});

  @override

  _InformationPage2 createState() => _InformationPage2();

  }


  class _InformationPage2 extends State<InformationPage2> {
  

  firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;
  
  
  
  @override

  
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;

    
    return Scaffold(
  //  body: ListView.builder(
  //   itemBuilder: ( _, index) {
  //         return
         body: Column(            
          children: [
          Padding(
          padding: const EdgeInsets.all(0.0),   
              child: SingleChildScrollView(
                  child: Column(
                   
                    children: <Widget>[
                    Stack(  
                    clipBehavior: Clip.none,
                     alignment: Alignment.topLeft,
                       children: [
                      LayoutBuilder(
                        builder: (_, constraints) {
                          return
                      Positioned (
                      top: 0,
                      child: 
                    Container (
                    width: size.width,
                    height: 300, 
                    decoration: BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(widget.post["Imagem"]),
                    fit: BoxFit.cover,
                    ),
                    )  
                    ));}),

                    Positioned(
                    top: 30,
                    left: 35,
                    child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                    color: Color(0xFF035397),
                    borderRadius: BorderRadius.all (Radius.circular(10)),
                    ),
                    child: Center (
                    child:IconButton(
                    icon: Icon(Icons.arrow_back_rounded,
                    size: 30,
                    color: Color(0xFFFCD900),
                    ),
                    onPressed: () {
                    Navigator.push(
                     context,
                     MaterialPageRoute(
                    builder: (context) => const BottomNavigationBar2(),
                    ));
                    },
                    ))),
                    ),
                   
                    Positioned (
                    top: 255,
                    child: LayoutBuilder(
                    builder: (_, constraints) {
                    return
                    Container(
                    height: size.height,
                    width: size.width,
                    decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all (Radius.circular(50))
                    ));} )),


                    Positioned(
                    top: 305,
                    left: 35,
                    child: Text(widget.post["Nome"],
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    )
                    ),
                    ),
                   
                     
                    Positioned(
                    top: 340,
                    child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric
                    (horizontal: 35), 
                    child: Row(
                   children: [
                   Icon(Icons.place_rounded, color: Color(0xFFFCD900), size: 30,),
                   AutoSizeText(widget.post['Localização'],
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 17,
                    )
                    ),
                    ]))),

                   
                     const Positioned(
                    top: 370,
                    left: 35,
                    right: 35,
                    child: 
                    Divider(color: Color(0xffB7B4B4))
                    ),


                    Positioned(
                    top: 410,
                    left: 33,
                    child: Row(
                    children: [
                  
                     Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                    color: Color(0xFF035397),
                    borderRadius: BorderRadius.all (Radius.circular(10))
                    ),
                    child: Center(
                    child: Text(widget.post['Idade'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 13,
                    color: Colors.white,    
                    
                    )),
                   ),
                    ),

                    SizedBox(
                    width: 5,
                    ),

                    Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                    color: Color(0xFF035397),
                    borderRadius: BorderRadius.all (Radius.circular(10))
                    ),
                    child: Center(
                    child: Text(widget.post['Sexo'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 13,
                    color: Colors.white,    
                    )
                    ),
                    ),
                    ),

                    SizedBox(
                    width: 5,
                    ),

                    Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                    color: Color(0xFF035397),
                    borderRadius: BorderRadius.all (Radius.circular(10))
                    ),
                    child: Center(
                    child: Text(widget.post['Porte'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 13,
                    color: Colors.white,    
                    
                    ),
                    ),
                    )),
                    
                    SizedBox(
                    width: 5,
                    ),

                    Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                    color: Color(0xFF035397),
                    borderRadius: BorderRadius.all (Radius.circular(10))
                    ),
                    child: Center(
                    child: Text(widget.post['Raça'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 13,
                    color: Colors.white,    
                    )
                  )),
                    ),
                  
                    ],
                    )),

                   
                    const Positioned(
                    top: 540,
                    left: 35,
                    child: const Text('Telefone',
                    style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    )
                    ),
                    ),
                    
                    Positioned(
                    top: 575,
                    left: 35,
                    child: Text(widget.post['Telefone'],
                    style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 17,
                    )
                    ),
                    ),

                    const Positioned(
                    top: 630,
                    left: 35,
                    child: const Text('Descrição',
                    style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    )
                    ),
                    ),
                    
                    
                    Positioned(
                    top: 665,
                    child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric
                    (horizontal: 35), 
                    child: AutoSizeText(widget.post['Descrição'],
                    maxLines: 30,
                    style: TextStyle(
                    fontFamily: 'Karla',
                    fontSize: 17,
                    )))
                    ),
                    
                    
      

      ])]))
          )]
          ));
          }}
