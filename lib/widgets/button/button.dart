import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/publicationpage.dart';
import 'package:tcc/widgets/adoptionpage.dart';


class BottonNavigationBar0 extends StatefulWidget {
 const BottonNavigationBar0({Key? key}) : super(key: key);
  

  @override

  _BottonNavigationBar0 createState() => _BottonNavigationBar0();

  }

  class _BottonNavigationBar0 extends State<BottonNavigationBar0> {
  
  int selectedIndex = 0;

  List<Widget> tabs = [
    AdoptionPage(),
    SearchPage(),
    PublicationPage(),
    ChatPage(),
    ProfilePage(),
  ];

onTapped(int index) {
      setState(() {
      selectedIndex = index;
    

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: (tabs[selectedIndex]),

        bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: Color(0xFFFDBE34), size: 40),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 35),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedLabelStyle: TextStyle(fontSize: 20, fontFamily: 'Karla', color: Color(0xFFFDBE34)),
        elevation: 0,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(   
            icon: Icon(Icons.home_rounded),
            label: 'Adoção', 
            backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(   
          icon: Icon(Icons.pets_rounded),
          label: 'Perdidos', 
          backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Publicação',  
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat', 
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
           icon: Icon(Icons.person_rounded),
           label: 'Perfil',
           backgroundColor: Color(0xFF035397),
 
          ),
        ],

      ));}}
              
//PERDIDOS
class BottonNavigationBar1 extends StatefulWidget {
 const BottonNavigationBar1({Key? key}) : super(key: key);
  

  @override

  _BottonNavigationBar1 createState() => _BottonNavigationBar1();

  }

  class _BottonNavigationBar1 extends State<BottonNavigationBar1> {
  
  int selectedIndex1 = 1;

  List<Widget> tabs = [
    AdoptionPage(),
    SearchPage(),
    PublicationPage(),
    ChatPage(),
    ProfilePage(),
  ];

onTapped(int index1) {
      setState(() {
      selectedIndex1 = index1;
    

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: (tabs[selectedIndex1]),

        bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: selectedIndex1,
        selectedIconTheme: IconThemeData(color: Color(0xFFFDBE34), size: 40),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 35),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, fontFamily: 'Karla', color: Color(0xFFFDBE34)),
        unselectedLabelStyle: TextStyle(fontSize: 17, fontFamily: 'Karla'),
        elevation: 0,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(   
            icon: Icon(Icons.home_rounded),
            label: 'Adoção', 
            backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(   
          icon: Icon(Icons.pets_rounded),
          label: 'Perdidos', 
          backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Publicação',  
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat', 
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
           icon: Icon(Icons.person_rounded),
           label: 'Perfil',
           backgroundColor: Color(0xFF035397),
 
          ),
        ],

      ));}}
               
                            
//CHAT
class BottonNavigationBar3 extends StatefulWidget {
 const BottonNavigationBar3({Key? key}) : super(key: key);
  

  @override

  _BottonNavigationBar3 createState() => _BottonNavigationBar3();

  }

  class _BottonNavigationBar3 extends State<BottonNavigationBar3> {
  
  int selectedIndex3 = 3;

  List<Widget> tabs = [
    AdoptionPage(),
    SearchPage(),
    PublicationPage(),
    ChatPage(),
    ProfilePage(),
  ];

onTapped(int index3) {
      setState(() {
      selectedIndex3 = index3;
    

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: (tabs[selectedIndex3]),

        bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: selectedIndex3,
        selectedIconTheme: IconThemeData(color: Color(0xFFFDBE34), size: 40),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 35),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, fontFamily: 'Karla', color: Color(0xFFFDBE34)),
        unselectedLabelStyle: TextStyle(fontSize: 17, fontFamily: 'Karla'),
        elevation: 0,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(   
            icon: Icon(Icons.home_rounded),
            label: 'Adoção', 
            backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(   
          icon: Icon(Icons.pets_rounded),
          label: 'Perdidos', 
          backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Publicação',  
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat', 
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
           icon: Icon(Icons.person_rounded),
           label: 'Perfil',
           backgroundColor: Color(0xFF035397),
 
          ),
        ],

      ));}}
               
                            
//PERFIL
class BottonNavigationBar4 extends StatefulWidget {
 const BottonNavigationBar4({Key? key}) : super(key: key);
  

  @override

  _BottonNavigationBar4 createState() => _BottonNavigationBar4();

  }

  class _BottonNavigationBar4 extends State<BottonNavigationBar4> {
  
  int selectedIndex4 = 4;

  List<Widget> tabs = [
    AdoptionPage(),
    SearchPage(),
    PublicationPage(),
    ChatPage(),
    ProfilePage(),
  ];

onTapped(int index4) {
      setState(() {
      selectedIndex4 = index4;
    

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: (tabs[selectedIndex4]),

        bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: selectedIndex4,
        selectedIconTheme: IconThemeData(color: Color(0xFFFDBE34), size: 40),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 35),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20, fontFamily: 'Karla', color: Color(0xFFFDBE34)),
        unselectedLabelStyle: TextStyle(fontSize: 17, fontFamily: 'Karla'),
        elevation: 0,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(   
            icon: Icon(Icons.home_rounded),
            label: 'Adoção', 
            backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(   
          icon: Icon(Icons.pets_rounded),
          label: 'Perdidos', 
          backgroundColor:  Color(0xFF035397),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Publicação',  
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chat', 
            backgroundColor: Color(0xFF035397),
          ),

           BottomNavigationBarItem(
           icon: Icon(Icons.person_rounded),
           label: 'Perfil',
           backgroundColor: Color(0xFF035397),
 
          ),
        ],

      ));}}