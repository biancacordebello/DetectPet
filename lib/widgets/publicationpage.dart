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
  var porte = TextEditingController();
  var sexo = TextEditingController();
  var situacao = TextEditingController();

 
  final List<String> porte1 = [
  'Pequeno Porte',
  'Médio Porte',
  'Grande Porte',
];
String selectedValue = '';

final List<String> sexo1 = [
  'Macho',
  'Fêmea',
];
String selectedValue1 = '';

final List<String> situacao1 = [
  'Adoção',
  'Perdido',
];
String selectedValue2 = '';




  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Nova Publicação'), 
          titleTextStyle: const TextStyle(color: Color(0xFFFDBE34), fontSize: 25, fontFamily: 'Karla'),
          backgroundColor: const Color(0xFF035397),
          toolbarHeight: 60,
          leading:  
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFFDBE34), size: 35),
              onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottonNavigationBar0(),
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
          padding: const EdgeInsets.all(15.0),
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
                        child: const Icon(
                           Icons.add_photo_alternate_rounded,
                          color: Color(0xFFFDBE34), size: 50,
                        ),
          
          )))])),
        
        const SizedBox(
        height: 25
        ),

         //DESCRIÇÃO
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
        labelStyle: const TextStyle(
        color: Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),
         
       
        const SizedBox(
        height: 25
        ),

        //ESPÉCIE DO ANIMAL
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
        validator: (_specie) {},
        controller: _specie,
        decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF035397).withOpacity(0.22),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
        ),       
        labelText: 'Espécie',
        labelStyle: const TextStyle(
        color: Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),

        const SizedBox(
        height: 25
        ),
       
        //RAÇA DO ANIMAL
        Padding(       
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
        labelStyle: const TextStyle(
        color: Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20,
        )))
        )),
        
       
        const SizedBox(
        height: 25,
        ),

      //PORTE
       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: const Text(
            'Selecione o Porte',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 255, 255),
          ),
          items: porte1
                  .map((porte2) =>
                  DropdownMenuItem<String>(
                    value: porte2,
                    child: Text(
                      porte2,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
            });
          },
          iconSize: 40,
          iconEnabledColor: const Color(0xFFFDBE34),
          iconDisabledColor: const Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: const Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
            
        ),
      )))),
          
        const SizedBox(
        height: 25
        ),

        //SEXO
       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: const Text(
            'Selecione o Sexo',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 255, 255),
          ),
          items: sexo1
                  .map((sexo2) =>
                  DropdownMenuItem<String>(
                    value: sexo2,
                    child: Text(
                      sexo2,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          onChanged: (value) {
            setState(() {
              selectedValue1 = value.toString();
            });
          },
          iconSize: 40,
          iconEnabledColor: const Color(0xFFFDBE34),
          iconDisabledColor: const Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: const Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
            
        ),
      )))),
          

        const SizedBox(
        height: 25
        ),


        //IDADE
       Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
        labelStyle: const TextStyle(
        color: Color(0xFF035397),
        fontFamily: 'Karla',
        fontSize: 20
        )))
        )),

        const SizedBox(
        height: 25
        ),

      //LOCALIZAÇÃO
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
      labelStyle: const TextStyle(
      color: Color(0xFF035397),
      fontFamily: 'Karla',
      fontSize: 20
       )))
       )),
      
       const SizedBox(
        height: 25
        ),

      //SITUAÇÃO
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 50,
        width: double.infinity,        
        child: DropdownButtonHideUnderline(
        child: DropdownButton2(
        isExpanded: true,
          hint: const Text(
            'Selecione a Situação do Animal',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF035397),
            ),
          
          ),
          dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 255, 255),
          ),
          items: situacao1
                  .map((situacao2) =>
                  DropdownMenuItem<String>(
                    value: situacao2,
                    child: Text(
                      situacao2,
                      style: const TextStyle(
                         fontFamily: 'Karla',
                        fontSize: 20,
                        color: Color(0xFF035397),
                      ),
                    ),
                  
                  ))
                  .toList(),
          onChanged: (value) {
            setState(() {
              selectedValue2 = value.toString();
            });
          },
          
          
          iconSize: 40,
          iconEnabledColor: const Color(0xFFFDBE34),
          iconDisabledColor: const Color(0xFFFDBE34),
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
          buttonDecoration: BoxDecoration(
          color: const Color(0xFF035397).withOpacity(0.22),
          borderRadius: BorderRadius.circular(5),
          
        ) 
      ),
     
      ))),

      const SizedBox(
        height: 25
        ),


       //Botão Enviar
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      textDirection: TextDirection.ltr,
      children: [
      ElevatedButton(
      onPressed: () {
        porte.text = selectedValue;
        sexo.text = selectedValue1;
        situacao.text = selectedValue2;
     
      if (selectedValue2 == 'Adoção') {
      sendData();
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const BottonNavigationBar0()));
      }
     else if (selectedValue2 == 'Perdidos') {
      sendDatap();
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => const BottonNavigationBar1()));
     }
      else if (selectedValue2 == null || selectedValue2.isEmpty || _specie == null || selectedValue1 == null || selectedValue1.isEmpty ||
      selectedValue == null || selectedValue.isEmpty || _age == null || _breed == null || _description == null ||
      _localization == null   
      )
      {
      showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
      title: new Text("Erro"),
      content: new Text("Verifique se algum campo se encontra vazio"), 
      shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFDBE34),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5))),
          child: const Text("OK", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  },
);
      }
      
      },  
  
      child: const Text(
      "Enviar",
      style: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: 'Karla',
      ),
      ),
      style: ElevatedButton.styleFrom(
      fixedSize: const Size(111, 40),
      primary: const Color(0xFFFDBE34),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5))
      )),],

      )),
        const SizedBox(
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
    String id = const Uuid().v1();
    db.collection("adocao").doc(id).set({
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

    void sendDatap() async{
    String id = const Uuid().v1();
    db.collection("perdidos").doc(id).set({
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
    
   
  }