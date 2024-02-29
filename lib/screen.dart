import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elementos JSON',  textAlign: TextAlign.center),
        backgroundColor: Color.fromARGB(255, 219, 235, 222),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 243, 242), 
        child: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center, // Centra el contenido horizontalmente
                color: index % 2 == 0 ? Color.fromARGB(255, 170, 248, 194) : Color.fromARGB(255, 203, 250, 219), // Cambia el color de fondo alternativamente
                child: ListTile(
                  title: Center(child: Text(items[index].name, textAlign: TextAlign.center, style: TextStyle(color: const Color.fromARGB(255, 43, 41, 41)))), // Centra el título y le asigna un color blanco
                  subtitle: Center(child: Text('ID: ${items[index].id}', textAlign: TextAlign.center, style: TextStyle(color: const Color.fromARGB(255, 43, 40, 40)))), // Centra el subtítulo y le asigna un color blanco
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
