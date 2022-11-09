// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
// import 'package:tcc/database/db_firestore.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:uuid/uuid.dart';
import 'package:tcc/widgets/password.dart';
import 'package:tcc/widgets/newpassword.dart';

class Code extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  Code({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //take out the banner
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color(0xFF035397),
              toolbarHeight: 60,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Password()));
                },
              ),
            ),
            backgroundColor:
                const Color(0xFF035397), //background login app color
            body: Form(
                key: formKey,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      const Text('DetectPet',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontFamily: 'Chewy-Regular')),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                          height: 280,
                          width: 335,
                          decoration: BoxDecoration(
                            color: const Color(0xff047CE2),
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    'Digite seu e-mail para recuperar sua senha',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Karla'),
                                    textAlign: TextAlign.center),
                                const SizedBox(
                                  height: 28,
                                ),
                                SizedBox(
                                    height: 50,
                                    width: 323,
                                    child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        hintText:
                                            'Digite o código que você recebeu',
                                        hintStyle: const TextStyle(
                                          fontFamily: 'Karla',
                                          color: Color(0xffa89f9f),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Karla',
                                      ),
                                    )),
                                const SizedBox(height: 28),
                                ElevatedButton(
                                  onPressed: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewPassword()))
                                  },
                                  child: Text(
                                    'Confirmar e-mail',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Karla',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(323, 50),
                                      primary: const Color(0xFFFCD900),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(85))),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Karla',
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Não recebi o código')),
                              ]))
                    ])))));
  }
}
