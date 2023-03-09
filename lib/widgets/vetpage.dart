import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/profilepage.dart';

class VetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF035397),
          toolbarHeight: 60,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 40),
              onPressed: () {},
            ),
            SizedBox(width: 15),
          ],
        ),
        drawer: Drawer(
            backgroundColor: Color(0xff047CE2),
            child: ListView(
              padding: EdgeInsets.only(left: 18),
              children: [
                const SizedBox(
                    height: 70,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xff047CE2),
                      ),
                      child: null,
                    )),
                ListTile(
                  title: const Text('Adoção',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontFamily: 'Karla')),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationBar0(),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('Perdidos',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontFamily: 'Karla',
                      )),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                  builder: (context) => BottomNavigationBar1()));
                  },
                ),
                // ListTile(
                //     title: const Text('Chat',
                //         style: TextStyle(
                //           color: Color(0xffffffff),
                //           fontSize: 20,
                //           fontFamily: 'Karla',
                //         )),
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => BottonNavigationBar3(),
                //           ));
                //     }),
                ListTile(
                    selectedTileColor: Color(0xFF035397),
                    title: const Text('Dicas',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontFamily: 'Karla',
                        )),
                    onTap: () {}),
                // ListTile(
                //   title: const Text('Perfil',
                //       style: TextStyle(
                //         color: Color(0xffffffff),
                //         fontSize: 20,
                //         fontFamily: 'Karla',
                //       )),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => BottonNavigationBar4(),
                //         ));
                //   },
                // ),
                SizedBox(
                  height: 455,
                ),
                Positioned(
                    bottom: 22,
                    child: ListTile(
                        title: Text("Sair",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 20,
                              fontFamily: 'Karla',
                            )),
                        leading: Icon(Icons.exit_to_app,
                            color: Color(0xffffffff), size: 40),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        }))
              ],
            )),
            body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [  
            SizedBox(
            width: 250,
            height: 250,
            child: Container(
            decoration: new BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/buildingpage1.png')))
            )),           
            ]))
            
            
            );
  }
}
