import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final opciones = ['Perico', 'Cocodrilo', 'León', 'Perro', 'Gato', 'Cuervo'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(children: _crearItems()),
    );
  }

  //Método regres lista de widgets

  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista
        ..add(tempWidget)
        ..add(Divider());
    }
    return lista;
  }
}
