import 'package:flutter/material.dart';
import 'package:flutter_front/models/route.dart';
import 'package:flutter_front/services/routeServices.dart';
import 'package:flutter_front/services/userServices.dart';
import 'package:flutter_front/views/first_page.dart';
import 'package:flutter_front/views/route_info.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../widgets/drawer.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late User availableUser;
  var isLoaded = false;

  late User user;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    availableUser = (await UserServices().getProfile(user))!;
    if (availableUser != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserServices _userprovider = Provider.of<UserServices>(context);
    RouteServices _routeprovder = Provider.of<RouteServices>(context);

    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: const Color(0xFF4cbfa6),
      ),
      body: SizedBox(
        width: 900,
        height: 701,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 100,
              child: Text(_userprovider.userData.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Text(_userprovider.userData.email,
                  style: const TextStyle(fontSize: 16)),
            ),
            // SizedBox(
            //   width: 300,
            //   height: 100,
            //   child: Text(_userprovider.userData.birthday,
            //       style: const TextStyle(fontSize: 16)),
            // ),
            SizedBox(
              height: 300,
              width: 300,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 40, bottom: 10, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/vector-premium/vista-superior-3d-mapa-punto-ubicacion-destino-vista-superior-limpia-aerea-mapa-ciudad-dia-calle-rio-mapa-imaginacion-urbana-blanco-concepto-navegador-mapas-gps-ilustracion-vectorial_34645-1264.jpg?w=2000"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showDialogFunc(context, name, email, id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF4cbfa6),
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "USER DETAILS:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4cbfa6),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "NAME : $name",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4cbfa6),
                      ),
                    ),
                    Text(
                      "EMAIL : $email",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4cbfa6),
                      ),
                    ),
                    const Text(
                      " ID : id",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4cbfa6),
                      ),
                    )
                  ]),
            ),
          ),
        );
      });
}
