import 'package:flutter/material.dart';
import 'package:tcc/widgets/loginpage.dart';

class WelcomePage extends StatefulWidget {
 const WelcomePage({Key? key}) : super(key: key);
  

  @override

  _WelcomePage createState() => _WelcomePage();

  }

  class _WelcomePage extends State<WelcomePage> {

     @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
       body: SingleChildScrollView( 
       child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 53, 20, 53),
            child: Column(
                  children: <Widget>[
                     const SizedBox(
                       height: 10,
                      ),

                        Container(
                      height: 400.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/dogandowner.png'),
                          fit: BoxFit.contain,
                        ),
                      
      ),
    ),
    const SizedBox(
    height: 5,
    ),

    const Text('DetectPet', style: TextStyle(color: Color(0xFF035397), fontFamily: 'Chewy-Regular', fontSize: 45),),

    const SizedBox(
    height: 25,
    ),

   const Text('Olá, Seja Bem Vindo(a)', style: TextStyle(color: Colors.black, fontFamily: 'Karla', fontSize: 18),),

   const SizedBox(
   height: 20,
    ),
    
   const Text('Aqui você pode adotar um animalzinho, ou encontrar o seu PET perdido com mais facilidade!', 
   style: TextStyle(color: Colors.black, fontFamily: 'Karla', fontSize: 18), maxLines: 3, textAlign: TextAlign.center,),

  const SizedBox(
   height: 20,
    ),
    
   

    ButtonTheme(
    child: ElevatedButton(
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ))
      },
      child: const Text(
        "Entrar",
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

  ]))));}}