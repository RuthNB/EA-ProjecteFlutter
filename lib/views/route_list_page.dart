import 'package:flutter/material.dart';
import 'package:flutter_front/models/route.dart';
import 'package:flutter_front/services/routeServices.dart';
import 'package:flutter_front/services/userServices.dart';
import 'package:flutter_front/views/first_page.dart';
import 'package:flutter_front/views/route_info.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../widgets/drawer.dart';

class RouteListPage extends StatefulWidget {
  final String stopPoint;
  final String startPoint;
  final String dateStart;
  final String dateStop;
  const RouteListPage(
      {super.key,
      required this.startPoint,
      required this.stopPoint,
      required this.dateStart,
      required this.dateStop});

  @override
  State<RouteListPage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RouteListPage> {
  late Future<List<Routes>?>? availableRoutes;
  //RouteServices routeService = RouteServices();
  @override
  void initState() {
    super.initState();
    availableRoutes = fetchRoutes();
    /* availableRoutes = routeService.getSearchedRoutes(
        widget.startPoint, widget.stopPoint, widget.dateStart, widget.dateStop);
    print(availableRoutes);
    print('arribat'); */
  }

  Future<List<Routes>> fetchRoutes() async {
    var routes = await RouteServices.getRoutes();
    return routes;
  }
  /* getData(String dStart, String dStop, String pStart, String pStop) {
    availableRoutes =
        RouteServices().getSearchedRoutes(pStart, pStop, dStart, dStop);
    print(availableRoutes);
    //await RouteServices().getRoutes();
    return availableRoutes;
  } */

  @override
  Widget build(BuildContext context) {
    UserServices _userprovider = Provider.of<UserServices>(context);
    RouteServices _routeprovder = Provider.of<RouteServices>(context);

    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text('Rutas disponibles'),
          backgroundColor: const Color(0xFF4cbfa6),
        ),
        body: FutureBuilder<List<Routes>?>(
          // initialData: [],
          future:
              availableRoutes /*  RouteServices().getRoutes(
              widget.startPoint,
              widget.stopPoint, widget.dateStart, widget.dateStop 
              ) */
          ,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(availableRoutes);
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF4cbfa6),
                    child: ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(
                          "Inicio:${snapshot.data![index].startPoint.toString()}| Final: ${snapshot.data![index].endPoint.toString()}"),
                      trailing: SizedBox(
                          width: 120,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.article),
                                  onPressed: () {
                                    _routeprovder
                                        .setRouteData(snapshot.data![index]);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RouteInfo()));
                                  },
                                  tooltip: 'Details',
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.home),
                                  tooltip: 'Main',
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FirstPage()));
                                  },
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )

        /*Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: availableRoutes?.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xFF4cbfa6),
              child: ListTile(
                title: Text(availableRoutes![index].name),
                subtitle: Text(
                    "Inicio:${availableRoutes![index].startPoint}| Final: ${availableRoutes![index].endPoint}"),
                trailing: SizedBox(
                    width: 120,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.article),
                            onPressed: () {
                              _routeprovder
                                  .setRouteData(availableRoutes![index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RouteInfo()));
                            },
                            tooltip: 'Details',
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.home),
                            tooltip: 'Main',
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FirstPage()));
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),*/
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
