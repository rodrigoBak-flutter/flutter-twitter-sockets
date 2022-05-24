import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twitter/src/model/twitt.dart';
import 'package:twitter/src/services/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Twitt> twitts = [
    Twitt(id: '1', usuario: 'Rodrigo', texto: 'Mi primer Twitt'),
    Twitt(id: '2', usuario: 'Gaston', texto: 'Mi segundo Twitt'),
    Twitt(id: '3', usuario: 'Carlos', texto: 'Mi tercer Twitt'),
  ];

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 35,
            color: Colors.lightBlue,
            icon: Icon(Icons.add),
            onPressed: agregarTwitt,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.Online)
                ? Icon(
                    Icons.check_circle,
                    color: Colors.lightBlue,
                  )
                : Icon(
                    Icons.offline_bolt,
                    color: Colors.red,
                  ),
          )
        ],
        title: Text(
          'Twitter',
          style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.w900,
              fontSize: 35),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: twitts.length,
          itemBuilder: (_, int i) {
            return _twittTile(twitts[i]);
          }),
    );
  }

  ListTile _twittTile(Twitt twitt) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          twitt.usuario.substring(0, 2),
        ),
      ),
      title: Text(
        twitt.texto,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Text(twitt.usuario),
      onTap: () {},
    );
  }

  agregarTwitt() {
    final textController = new TextEditingController();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              'Agregar nuevo Twitt',
              style: TextStyle(
                  color: Colors.lightBlue, fontWeight: FontWeight.w900),
            ),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text(
                  'Cancelar',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                child: Text(
                  'Subir',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.w900),
                ),
                onPressed: () => agregarTwittLista(textController.text),
              ),
            ],
          );
        });
  }

  void agregarTwittLista(String twitt) {
    print(twitt);
    if (twitt.length > 1) {
      //Agregar Twitt
      this.twitts.add(
            new Twitt(
                id: DateTime.now().toString(),
                usuario: 'Rodrigo',
                texto: twitt),
          );
      setState(() {});
    }
    Navigator.pop(context);
  }
}
