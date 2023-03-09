import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/firebase_options.dart';



class RegisterPage extends StatefulWidget {
 const RegisterPage({Key? key}) : super(key: key);
  

  @override

  _RegisterPage createState() => _RegisterPage();

  }

  class _RegisterPage extends State<RegisterPage> {

  

  final formKey = GlobalKey<FormState>();
  final TextEditingController Email_usuario = TextEditingController();
  final TextEditingController _ConfirmeSenha = TextEditingController();
  final TextEditingController Nome_usuario = TextEditingController();
  final TextEditingController Senha_usuario = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
  
   var size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false, //takes out the banner
        home: Scaffold(
            backgroundColor: const Color(0xFF035397),
            body: Form(
                key: formKey,
                    child: Center(
                     child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                             Stack(  
                    clipBehavior: Clip.none,
                     alignment: Alignment.center,
                       children: [
                      LayoutBuilder(
                        builder: (_, constraints) {
                          return
                      Positioned (
                      top: 0,
                      child:
                        Container(
                          height: size.height,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage('assets/images/paw.png'),
                            fit: BoxFit.cover),
                    )));}),

                      const Positioned(
                        top: 157,
                        child: Text(
                          'DetectPet',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontFamily: 'Chewy-Regular'))
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
                         color: Colors.white,
                          borderRadius: BorderRadius.all (Radius.circular(71))
                             ));} )),
                             

                            //SUBTITULO
                            const Positioned(
                              top: 291,
                              child: Text(
                                
                                'Digite seus dados para Cadastro',
                                textAlign:
                                    TextAlign.center, //BEM VINDO - DESCRIÇÃO
                                style: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Color(0xff035397),
                                    fontSize: 20),
                              ),
                            ),
                           
                            //NOME
                            Positioned(
                                top: 360,
                                child: SizedBox(
                                 width: 275,
                                 height: 55,
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length > 30) {
                                          return 'Nome inválido';
                                        }
                                        return null;
                                      },
                                      autofocus: false,
                                      controller: Nome_usuario,
                                      decoration: InputDecoration(
                                          hintText: 'Nome',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Karla',
                                            color: Color(0xffa89f9f),
                                            fontSize: 20,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                           border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                                      borderRadius: BorderRadius.circular(110))),
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                )),

                           
                            //EMAIL

                            Positioned(
                              top: 427,
                              child: SizedBox(
                              width: 275,
                              height: 55,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.') ||
                                        value.length > 30) {
                                      return 'E-mail inválido';
                                    }
                                    return null;
                                  },
                                  autofocus: false,
                                  controller: Email_usuario,
                                  decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Karla',
                                        color: Color(0xffa89f9f),
                                        fontSize: 20,
                                      ),

                                      filled: true,
                                      fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                                  borderRadius: BorderRadius.circular(110))),
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                  color: Colors.black, fontSize: 20),
                                ),         ),
                            ),

                            //Senha 
                            Positioned(
                                top: 494,
                                child: SizedBox(
                                     width: 275,
                                    height: 55,
                                    child: TextFormField(
                                      controller: Senha_usuario,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Senha inválida';
                                        }
                                        if (value != _ConfirmeSenha.text) {
                                          return 'Senhas diferentes';
                                        }
                                        return null;
                                      },
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          hintText: 'Senha',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Karla',
                                            color: Color(0xffa89f9f),
                                            fontSize: 20,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                                  borderRadius: BorderRadius.circular(110))),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          color: Colors.black,
                                          fontSize: 20),
                                      obscureText: true,
                                    ))),
                          

                            //Confirmação de senha
                            Positioned(
                                top: 561,
                                child: SizedBox(
                                     width: 275,
                                    height: 55,
                                    child: TextFormField(
                                      controller: _ConfirmeSenha,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Senha inválida';
                                        }
                                        if (value != Senha_usuario.text) {
                                          return 'Senhas diferentes';
                                        }
                                      },
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          hintText: 'Repita sua senha',
                                          hintStyle: TextStyle(
                                            fontFamily: 'Karla',
                                            color: Color(0xffa89f9f),
                                            fontSize: 20,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                   borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                                  borderRadius: BorderRadius.circular(110))),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          color: Colors.black,
                                          fontSize: 20),
                                      obscureText: true,
                                    ))),
                        
                      
                            //Botão - cadastro
                    Positioned(
                    top: 628,  
                      child: 
                      ButtonTheme(
                        child: 
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  register();
                                }
                              },
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Colors.black,
                                    fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                 elevation: 2,
                              fixedSize: const Size(204, 50),
                                  primary: Color(0xFFFCD900),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(85))),
                      ))),

              
                      //CADASTRO
                    Positioned(
                    top: 695,  
                      child: 
                      ButtonTheme(
                           child: ElevatedButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ) ),
                              },
                              child: Text(
                                "Já sou cadastrado",
                                style: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 17),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                              fixedSize: const Size(204, 50),
                                  primary: Color(0xFF035397),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(85))),
                            ))),
                          ]),
                    ]))))));
  }

        register () async {   
          try{
          UserCredential userCredential = await _firebaseAuth
         .createUserWithEmailAndPassword(
          email: Email_usuario.text, password: Senha_usuario.text);
          
          if (userCredential != null){
          userCredential.user!.updateDisplayName(Nome_usuario.text);
          Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
          builder: (context) => LoginPage()
          ),
          (route) => true); 
          }

          }
          on FirebaseAuthException catch (e) {
            
            if(e.code == 'week-password') {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Crie uma senha mais forte'),
                backgroundColor: Colors.redAccent,
                )
              );}

              else if (e.code == 'email-already-in-use') {
                ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Este e-mail já foi cadastrado'),
                backgroundColor: Colors.redAccent,
                ));
              }
                
              
            }

          }}