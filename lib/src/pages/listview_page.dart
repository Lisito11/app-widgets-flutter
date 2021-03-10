import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();



  List<int> _listaNumero = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        fetchData();


      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumero.length,
        //itemBuilder es la forma en como se va a dibujar el elemento
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumero[index];
          return FadeInImage(
            image: NetworkImage("https://picsum.photos/500/300?image=$imagen"),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }



  Future<void> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _listaNumero.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }



  void _agregar10(){
    for(var i =1; i<10; i++){
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }
    setState(() {

    });
  }

  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {});
    final _duration = new Duration(seconds: 2);
    new Timer(_duration, repuestaHttp );
  }



  void repuestaHttp() {
    _isLoading = false;
    _agregar10();

    _scrollController.animateTo(
        _scrollController.position.pixels +100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250)
    );
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
         SizedBox(height: 15.0),
        ],
      );
    }else{
      return Container();
    }
  }
}
