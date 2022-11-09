import 'package:flutter/material.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tcc/firebase_options.dart';
import 'package:tcc/widgets/password.dart';
import 'package:tcc/widgets/newpassword.dart';
import 'package:tcc/widgets/code.dart';


class LoginPage extends StatefulWidget {
 const LoginPage({Key? key}) : super(key: key);
  

  @override

  _LoginPage createState() => _LoginPage();

  }

  class _LoginPage extends State<LoginPage>  { 

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //take out the banner
        home: Scaffold(
          backgroundColor: const Color(0xFF035397), //background login app color
          body: Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'DetectPet',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 64,
                          fontFamily: 'Chewy-Regular'),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Positioned(
                        top: 289,
                        child: SizedBox(
                          width: 309,
                          height: 80,
                          child: TextFormField(
                              controller: _email,
                              validator: (_email) {
                                if (_email == null ||
                                    _email.isEmpty ||
                                    !_email.contains('@') ||
                                    !_email.contains('.') ||
                                    _email.length > 30) {
                                  return 'E-mail inválido';
                                }
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  hintText: 'E-mail',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Karla',
                                    color: Color(0xffa89f9f),
                                  )),
                              keyboardType: TextInputType.text,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        )),
                    Divider(
                      height: 10,
                      color: Color(0xFF035397),
                    ),

                    //SENHA
                    Positioned(
                        top: 364,
                        child: SizedBox(
                          width: 309,
                          height: 80,
                          child: TextFormField(
                            controller: _senha,
                              validator: (_senha) {
                                if (_senha == null || _senha.isEmpty) {
                                  return 'Senha inválida';
                                }
                              },
                              autofocus: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                                hintText: 'Senha',
                                hintStyle: TextStyle(
                                  fontFamily: 'Karla',
                                  color: Color(0xffa89f9f),
                                ),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Karla',
                              )),
                        )),
                    Divider(
                      height: 5,
                      color: Color(0xFF035397),
                    ),

                     TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Karla',
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Password()));
                      },
                      child: const Text('Esqueci minha senha')),

                  SizedBox(
                    height: 16,
                  ),

                    //ENTRAR
                    ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                          login();
                      }},
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Karla',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(281, 60),
                            primary: Color(0xFFFDBE34),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(85))),
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Color(0xFF035397),
                    ),

                    //CADASTRO
                    ButtonTheme(
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ))
                        },
                        child: Text(
                          "Quero me cadastrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Karla',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(281, 60),
                            primary: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(85))),
                      ),
                    ),
                  ],
                ),
              )),

        ),
);
} 
       login () async {
        try {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email.text, password: _senha.text);

        if(userCredential != null) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => BottonNavigationBar0()
    )
    );
    } }

      on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found') {
          return null;


 }  }} }
//     else if (e.code == 'wrong-password'){
//           return null;
  
//     }
//        }}}


