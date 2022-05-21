import 'package:IMC/blocs/imc.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculo IMC"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: bloc.heightCtrl,
              decoration: InputDecoration(
                labelText: "Altura",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextFormField(
              controller: bloc.weightCtrl,
              decoration: InputDecoration(labelText: "Peso"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(bloc.result),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      bloc.calculate();
                    },
                  );
                },
                child: Text(
                  "Calcular",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
