import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'GLimo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  String nombres;
  String curso;
  double nota1;
  double nota2;
  double nota3;
  double nota4;
  bool val = false;
  double promedio = 0;
  String mensaje = "";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tfNombres = TextEditingController();
  final _tfCurso = TextEditingController();
  final _tfNota1 = TextEditingController();
  final _tfNota2 = TextEditingController();
  final _tfNota3 = TextEditingController();
  final _tfNota4 = TextEditingController();

  void _calcularPromedio() {
    setState(() {
      widget.val = false;
      if (_tfNota1.text.toString() == "" ||
          _tfNota2.text.toString() == "" ||
          _tfNota3.text.toString() == "" ||
          _tfNota4.text.toString() == "") {
        widget.val = true;
        widget.mensaje = "falta ingresar la nota";
        return;
      }
      widget.nota1 = double.parse(_tfNota1.text);
      widget.nota2 = double.parse(_tfNota2.text);
      widget.nota3 = double.parse(_tfNota3.text);
      widget.nota4 = double.parse(_tfNota4.text);

      widget.promedio =
          (widget.nota1 + widget.nota2 + widget.nota3 + widget.nota4) / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aplicacion de " + widget.title),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                  "Para Calcular Completa los datos y da click en el boton calcular"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _tfNombres,
                    decoration: InputDecoration(
                        hintText: "Ingresar los Nombres", labelText: "Nombres"),
                  ),
                  TextField(
                    controller: _tfCurso,
                    decoration: InputDecoration(
                        hintText: "Ingresar el nombre del Curso",
                        labelText: "Curso"),
                  ),
                  TextField(
                    controller: _tfNota1,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        hintText: "Ingresar la Nota 1",
                        labelText: "Nota1",
                        errorText: _tfNota1.text.toString() == ""
                            ? widget.mensaje
                            : null),
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _tfNota2,
                    decoration: InputDecoration(
                        hintText: "Ingresar la Nota 2",
                        labelText: "Nota2",
                        errorText: _tfNota1.text.toString() == ""
                            ? widget.mensaje
                            : null),
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _tfNota3,
                    decoration: InputDecoration(
                        hintText: "Ingresar la Nota 3",
                        labelText: "Nota3",
                        errorText: _tfNota1.text.toString() == ""
                            ? widget.mensaje
                            : null),
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: _tfNota4,
                    decoration: InputDecoration(
                        hintText: "Ingresar la Nota 4",
                        labelText: "Nota4",
                        errorText: _tfNota1.text.toString() == ""
                            ? widget.mensaje
                            : null),
                  ),
                  Text("Promedio: " + widget.promedio.toString()),
                  RaisedButton(
                      color: Colors.blueAccent,
                      child: Text(
                        "CALCULAR",
                        style: TextStyle(fontSize: 18, fontFamily: "rbold"),
                      ),
                      onPressed: _calcularPromedio)
                ],
              ),
            )
          ],
        ));
  }
}
