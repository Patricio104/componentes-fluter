import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    /* menuProvider.cargarData().then((opciones) {
      //Aqui no es conveniente usarlo de esta forma, ya que como resuelve una tarea despues de unos segundo
      //el cliente no le gustará, pensará que esta trabado la App
      print('_lista');
      print(opciones);
    }); */

    //Se usará FutureBuilder para una mejor ejecución de la tarea

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }

          if (!snapshot.hasData) {
            return Center(child: Text('No hay data'));
          }

          return ListView(
            children: _listaItems(snapshot.data),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic>? data) {
    final List<Widget> opciones = [];

    data?.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: Icon(Icons.ac_unit_rounded, color: Colors.blueAccent),
        trailing: Icon(Icons.access_alarms_rounded, color: Colors.amber),
        onTap: () {},
      );

      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });

    return opciones;
  }
}
