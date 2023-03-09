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
   var size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false, //take out the banner
        home: Scaffold(
          backgroundColor: const Color(0xFF035397), //background login app color
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
                   
                      const Positioned (
                      top: 157,
                      child: Text("DetectPet",
                      style: TextStyle (
                      color: Colors.white,
                      fontSize: 64,
                      fontFamily: 'Chewy-Regular'
                      )),
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
                          borderRadius: BorderRadius.all (Radius.circular(71))
                             ));} )),
                             
                      const Positioned (
                      top: 291,
                      child: Text("Faça Login na sua conta",
                      style: TextStyle (
                      color: Color(0xff035397),
                      fontSize: 20,
                      fontFamily: 'Karla'
                      )),
                      ),
                           
                  
                    Positioned(
                    top: 360,
                    child: SizedBox(
                      width: 275,
                      height: 55,
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
                      borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                      borderRadius: BorderRadius.circular(110)),
                      hintText: 'E-mail',
                      hintStyle: const TextStyle(
                        fontFamily: 'Karla',
                        color: Color(0xffa89f9f),
                      
                      )),
                  keyboardType: TextInputType.text,
                  style:
                      const TextStyle(color: Colors.black, fontSize: 20)),
            )),
        
               
             //SENHA
          
            Positioned(
            top: 427,  
              child: 
               SizedBox(
                      width: 275,
                      height: 55,
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
                                   borderSide: BorderSide(color: Color.fromARGB(141, 193, 206, 235), width: 1),
                                  borderRadius: BorderRadius.circular(110)),
                                  hintText: 'Senha',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Karla',
                                    color: Color(0xffa89f9f),
                                  ),
                                  
                                ),
                                
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Karla',
                                )),
                  )),

           
           
                  Positioned(
                    top: 480,  
                      child: 
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
                        child: const Text('Esqueci minha senha'))),
              
                   
                      //ENTRAR
                    Positioned(
                    top: 533,  
                      child: 
                      ButtonTheme(
                        child: ElevatedButton(
                          
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                            login();
                        }},
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontFamily: 'Karla',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                          elevation: 2,
                              fixedSize: const Size(204, 50),
                              primary: const Color(0xFFFCD900),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(85))),
                        ),
                      )),

                  
              
                      //CADASTRO
                    Positioned(
                    top: 605,  
                      child: 
                      ButtonTheme(
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ))
                          },
                          child: const Text(
                            "Quero me cadastrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Karla',
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                             elevation: 2,
                              fixedSize: const Size(204, 50),
                              primary: const Color(0xFF035397),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(85))),
                      )),
                      ),
              ],
            ),      ])),
                ),
    )));

        

} 
       login () async {
        try {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _email.text, password: _senha.text);

        if(userCredential != null) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) => const BottomNavigationBar0()
    )
    );
    } 
    }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text("Usuário não encontrado"),
        backgroundColor: Colors.redAccent,
        ));}

        else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text("Sua senha está errada"),
        backgroundColor: Colors.redAccent,
        ));}

  }
 } }
//     else if (e.code == 'wrong-password'){
//           return null;
  
//     }
//        }}}


