import 'package:flutter/material.dart';
import 'package:flutter_front/views/first_page.dart';
import 'package:flutter_front/views/profile_page.dart';
import 'package:flutter_front/views/route_list_page.dart';
import 'package:flutter_front/views/register.dart';
import 'package:flutter_front/views/login.dart';
import 'package:flutter_front/views/update_page.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            child: Drawer(
                child: Container(
      color: Color.fromARGB(222, 57, 215, 250),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'P A G E S',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Available Routes',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RouteListPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'My Routes',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RouteListPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'My Bookings',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RouteListPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'MyProfile',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyProfilePage()));
            },
          ),
        ],
      ),
    ))));
  }
}
