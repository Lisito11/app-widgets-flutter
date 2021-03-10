import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    //FutureBuilder
    return FutureBuilder(
      future: menuProvider.cargarData(),
      //Informacion que tendra por defecto antes de que se resuelva el future
      initialData: [], //OPCIONAL
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //El builder se dispará en varias etapas: 1-Cuando estoy pidiendo data
        //2. cuando se obtuvo la data
        //3. si hubo algun error

          return ListView(
               children: _listaItems(snapshot.data, context),
              );
      },
    );

  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];


    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color:  Colors.blue,),
        onTap: (){

          Navigator.pushNamed(context, element["ruta"]);
          
          
          
          
          
          
          
          // final route = MaterialPageRoute(
          //     builder: (context) =>  AlertPage()
          // );
          //
          // Navigator.push(context, route);
        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;

    // return [
    //   ListTile(title: Text("Hola Mundo"),),Divider(),
    //   ListTile(title: Text("Hola Mundo"),),Divider(),
    //   ListTile(title: Text("Hola Mundo"),),Divider(),
    // ];
  }
}
