import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/retry.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:tcc/database/db_firestore.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

 class PublicationPage extends StatefulWidget {
 const PublicationPage({Key? key}) : super(key: key);
  

  @override

  _PublicationPage createState() => _PublicationPage();

  }

  class _PublicationPage extends State<PublicationPage> {

  
  
  //BANCO 
  FirebaseFirestore db = FirebaseFirestore.instance;


  List <String> refs = [];
  bool loading = true;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  
  
  // STORAGE
  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  
    setState(() {
    if (pickedFile != null) {
      

  
        _photo = File(pickedFile.path);
        sendData();
  }});  } 
        
  

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
          if (pickedFile != null) {

       _photo = File(pickedFile.path);
        sendData();
      }    });}
    
     
  

  //CONTROLLERS
  final formKey = GlobalKey<FormState>();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _specie = TextEditingController();
  final TextEditingController _breed = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _localization = TextEditingController();
  

 
  final List<String> items = [
  'Pequeno Porte',
  'Médio Porte',
  'Grande Porte',
];
String? selectedValue;

final List<String> items1 = [
  'Macho',
  'Fêmea',
];
String? selectedValue1;

final List<String> items2 = [
  'Adoção',
  'Perdido',
];
String? selectedValue2;




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Nova Publicação'), 
          titleTextStyle: TextStyle(color: Color(0xFFFDBE34), fontSize: 25, fontFamily: 'Karla'),
          backgroundColor: const Color(0xFF035397),
          toolbarHeight: 60,
          leading:  
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFFDBE34), size: 35),
              onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottonNavigationBar0(),
                        ));
              },
            )
            ),

          //IMAGE    
          body: SingleChildScrollView(  
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         GestureDetector(
        onTap: () {
         _showPicker(context);
          },
          child: Container(
          width: 250, height: 250,
          child: _photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          _photo!,
                          width: 250,
                          height: 250,
                          fit: BoxFit.fitHeight,
                        
                        ), 
                      
                        )
                      
                    : Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF035397).withOpacity(0.22), 
                            borderRadius: BorderRadius.circular(5)),
                        width: 250,
                        height: 250,
                        child: Icon(
                           Icons.add_photo_alternate_rounded,
                          color: Color(0xFFFDBE34), size: 50,
                        ),
          
          )))])),
        
        SizedBox(
        height: 25
        ),

         //DESCRIÇÃO
        Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
        validator: (_description) {}, 
        controller: _description,
        decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF035397).withOpacity(0.22),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none
        ),               
        labelText: 'Descrição',
        labelStyle: TextStyle(
        color: const Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),
         
       
        SizedBox(
        height: 25
        ),

        //ESPÉCIE DO ANIMAL
        Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
        validator: (_specie) {
        if (_specie == null || _specie.isEmpty) {
          return 'Campo obrigatório';
        }
         return null;
        }, 
        controller: _specie,
        decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF035397).withOpacity(0.22),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
        ),       
        labelText: 'Espécie',
        labelStyle: TextStyle(
        color: const Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),

        SizedBox(
        height: 25
        ),
       
        //RAÇA DO ANIMAL
        Padding(       
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
        validator: (_breed){}, 
        controller: _breed,
        decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF035397).withOpacity(0.22),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
        ),        
        labelText: 'Raça',
        labelStyle: TextStyle(
        color: const Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),
        
       
        SizedBox(
        height: 25,
        ),

      //PORTE
       Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: Text(
            'Selecione o Porte',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 255, 255, 255),
          ),
          items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          iconSize: 40,
          iconEnabledColor: Color(0xFFFDBE34),
          iconDisabledColor: Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
            
        ),
      )))),
          
        SizedBox(
        height: 25
        ),

        //SEXO
       Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: Text(
            'Selecione o Sexo',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 255, 255, 255),
          ),
          items: items1
                  .map((item1) =>
                  DropdownMenuItem<String>(
                    value: item1,
                    child: Text(
                      item1,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          value: selectedValue1,
          onChanged: (value) {
            setState(() {
              selectedValue1 = value as String;
            });
          },
          iconSize: 40,
          iconEnabledColor: Color(0xFFFDBE34),
          iconDisabledColor: Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
            
        ),
      )))),
          

        SizedBox(
        height: 25
        ),


        //IDADE
       Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
        validator: (_age) {}, 
        controller: _age,
        decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF035397).withOpacity(0.22),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
        ),
        labelText: 'Idade',
        labelStyle: TextStyle(
        color: const Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20
        )))
        )),

        SizedBox(
        height: 25
        ),

      //LOCALIZAÇÃO
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
      height: 50,
      width: double.infinity,
      child: TextFormField(
      validator: (_localization) {}, 
      controller: _localization,
      decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0xFF035397).withOpacity(0.22),
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
      ),
      labelText: 'Localização',
      labelStyle: TextStyle(
      color: const Color(0xFF035397),
      fontFamily: 'Karla',
      fontSize: 20
       )))
       )),
      
       SizedBox(
        height: 25
        ),

      Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: Text(
            'Selecione a Situação do Animal',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color.fromARGB(255, 255, 255, 255),
          ),
          items: items2
                  .map((item2) =>
                  DropdownMenuItem<String>(
                    value: item2,
                    child: Text(
                      item2,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          value: selectedValue2,
          onChanged: (value) {
            setState(() {
              selectedValue2 = value as String;
            });
          },
          iconSize: 40,
          iconEnabledColor: Color(0xFFFDBE34),
          iconDisabledColor: Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
            
        ),
      )))),

      SizedBox(
        height: 25
        ),


       //Botão Enviar
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      textDirection: TextDirection.ltr,
      children: [
      ElevatedButton(
      onPressed: () {
      // if (_specie == null) {
        // return SnackBar(content: content)'Especifique a Espécie'}
        
    //  else {
      sendData();
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => BottonNavigationBar0()));
      
      },  
  
      child: Text(
      "Enviar",
      style: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'Karla',
      ),
      ),
      style: ElevatedButton.styleFrom(
      fixedSize: const Size(111, 40),
      primary: Color(0xFFFDBE34),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5))
      )),],

      )),
        SizedBox(
        height: 25
        ),
      
      
     
      ])));
      
      
      
         
      }

     
    Future<void> _showPicker(context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeria'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
        })
        ])));});
        


        }
  
    

    //BANCO DE DADOS - ENVIAR DADOS 
    void sendData() async{
    String id = Uuid().v1();
    db.collection("publicacao").doc(id).set({
    "Descrição": _description.text,
    "Espécie": _specie.text,
    "Raça": _breed.text,
    "Porte": selectedValue,
    "Sexo": selectedValue1,
    "Idade": _age.text,
    "Localização": _localization.text,
    "Situação": selectedValue2,
    }).onError((a, _) => print("Error writing document: $a"));
     
 
    }
    
       
 
    // void uploadFile() async{
    // final path = 'images/${_photo!}';
    // final file = File(_photo!.path);

    // final ref = FirebaseStorage.instance.ref().child(path);
    // ref.putFile(file);
    }
  // Future uploadFile() async {
  //   if (_photo == null) return;
  //   final fileName = basename(_photo!.path);
  //   final destination = 'images/$fileName';
    
  //   try {
  //     final ref = firebase_storage.FirebaseStorage.instance
  //     .ref(destination).child('file/');
  //     await ref.putFile(_photo!);
  //   } catch (e) {
  //     print('Erro');
  //   }
  // }      