import 'package:flutter/material.dart';
import 'package:flutter_mantenimiento/pantallas/mantenimiento_agregar_pantalla.dart';

class MantenimientoPantalla extends StatelessWidget {
  const MantenimientoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.build_circle),
          SizedBox(height: 16,),
          Text('Listado de registros')
        ],
      ),
      floatingActionButton:FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 5,
              onPressed: (){
                 Future.delayed(const Duration(seconds: 1),(){
                 Navigator.pushReplacement(
                context,
                MaterialPageRoute(
            builder: (_) => MantenimientoAgregarPantalla(),
          )
       );
       } );


              },
              child: const Icon(Icons.add, size: 30,),
              ),
    );
  }
}