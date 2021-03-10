import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        )
      ),
    );
  }

  Widget _checkBox(){
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _bloquearCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (valor){
          setState(() {
            _bloquearCheck = valor;
          });
        },
    );

  }

  _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearSlider() {
    return Slider(
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen ${_valorSlider.round()} px",
    //  divisions: 40,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage("https://assets.stickpng.com/images/58428ba1a6515b1e0ad75ab0.png"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}
