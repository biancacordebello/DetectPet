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



//   try {
//     FirebaseUser user = await FirebaseAuth.instance
//       .createUserWithEmailAndPassword(email: username, password: passaword);
//     if (user != null) {
//       Email_usuario = '';
//       Senha_Usuario = '';
//       FirebaseAuthNavigator.goToHome(context);
//     }
//   }
// catch (e) {
//   print(e);
// }



class RegisterPage extends StatefulWidget {
 const RegisterPage({Key? key}) : super(key: key);
  

  @override

  _RegisterPage createState() => _RegisterPage();

  }

  class _RegisterPage extends State<RegisterPage> {

  

  final formKey = GlobalKey<FormState>();
  final TextEditingController Email_usuario = TextEditingController();
  final TextEditingController _ConfirmeSenha = TextEditingController();
  final TextEditingController Nome_usario = TextEditingController();
  final TextEditingController Senha_usuario = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
  

    return MaterialApp(
        debugShowCheckedModeBanner: false, //takes out the banner
        home: Scaffold(
            backgroundColor: const Color(0xFF035397),
            body: Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Positioned(
                              top: 67,
                              child: Text(
                                'DetectPet',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontFamily: 'Chewy-Regular'),
                              ),
                            ),

                            //ESPAÇAMENTO ENTRE O TITULO E SUBTITULO
                            Divider(
                              height: 17,
                              color: Color(0xFF035397),
                            ),

                            //SUBTITULO
                            Positioned(
                              top: 131,
                              child: Text(
                                'Bem vindo ao FindPet! Digite seus dados para cadastro',
                                textAlign:
                                    TextAlign.center, //BEM VINDO - DESCRIÇÃO
                                style: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ),
                            Divider(
                              height: 45,
                              color: Color(0xFF035397),
                            ),

                            //NOME
                            Positioned(
                                top: 212,
                                child: SizedBox(
                                  width: 271,
                                  height: 80,
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length > 30) {
                                          return 'Nome inválido';
                                        }
                                        return null;
                                      },
                                      autofocus: true,
                                      controller: Nome_usario,
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
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                )),

                            Divider(
                              height: 10,
                              color: Color(0xFF035397),
                            ),

                            //EMAIL

                            Positioned(
                              top: 378,
                              child: SizedBox(
                                width: 271,
                                height: 80,
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
                                  autofocus: true,
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
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),         ),
                            ),

                            Divider(
                     
                              height: 10,
                              color: Color(0xFF035397),
                            ),
                            
                            //Senha 
                            Positioned(
                                top: 500,
                                child: SizedBox(
                                    width: 271,
                                    height: 80,
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
                                      autofocus: true,
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
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          color: Colors.black,
                                          fontSize: 20),
                                      obscureText: true,
                                    ))),
                            Divider(
                              height: 10,
                              color: Color(0xFF035397),
                            ),

                            //Confirmação de senha
                            Positioned(
                                top: 594,
                                child: SizedBox(
                                    width: 271,
                                    height: 80,
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
                                      autofocus: true,
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
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontFamily: 'Karla',
                                          color: Colors.black,
                                          fontSize: 20),
                                      obscureText: true,
                                    ))),

                            Divider(
                              height: 10,
                              color: Color(0xFF035397),
                            ),

                            //Botão - cadastro
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
                                    fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(281, 60),
                                  primary: Color(0xFFFDBE34),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(85))),
                            ),

                            Divider(
                              height: 11,
                              color: Color(0xFF035397),
                            ),

                            ElevatedButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                ),
                              },
                              child: Text(
                                "Já sou cadastrado",
                                style: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(281, 60),
                                  primary: Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(85))),
                            ),

                            Divider(
                              height: 10,
                              color: Color(0xFF035397),
                            ),
                          ]),
                    )))));
  }

        register () async {   
          try{
          UserCredential userCredential = await _firebaseAuth
         .createUserWithEmailAndPassword(
          email: Email_usuario.text, password: Senha_usuario.text);
          
          if (userCredential != null){
          userCredential.user!.updateDisplayName(Nome_usario.text);
          Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
          builder: (context) => LoginPage()
          ),
          (route) => true); 
          }

          }
          on FirebaseAuthException catch (e) {
            
            if(e.code == 'email-already-in-use') {
              return null;
                
              
            }

          }}}