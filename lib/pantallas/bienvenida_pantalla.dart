import 'package:flutter/material.dart';

class BienvenidaPantalla extends StatelessWidget {
  const BienvenidaPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Column(
        children: [
          Text('bienvenido a ManteApp'),

          SizedBox(height: 20,),

          Text('Es una aplicación para registrar tus mantenimientos'),
          SizedBox(),
          ElevatedButton(onPressed: (){}, child: Text('Ingresar'))

        ],
      ),
    );
  }
}