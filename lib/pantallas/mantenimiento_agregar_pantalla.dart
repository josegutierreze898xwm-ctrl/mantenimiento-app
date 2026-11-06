import 'package:flutter/material.dart';
import 'package:flutter_mantenimiento/pantallas/mantenimiento_pantalla.dart';
import 'package:flutter_mantenimiento/servicios/database_helper.dart';

class MantenimientoAgregarPantalla extends StatefulWidget {
  const MantenimientoAgregarPantalla({super.key});

  @override
  State<MantenimientoAgregarPantalla> createState() => _MantenimientoAgregarPantallaState();
}

class _MantenimientoAgregarPantallaState extends State<MantenimientoAgregarPantalla> {
   final textFecha = TextEditingController();
  final textNombre = TextEditingController();
  final textdetalles = TextEditingController();





  Future<void> guardarMantenimiento(BuildContext context) async{
    //ingresamos nuestro primer registro
    Map<String, dynamic> nuevoMantenimietno = {
      'fecha' : textFecha.text,
      'nombre' : textNombre.text,
      'detalles' : textdetalles.text,
    };

    //listar cita

    try {
      // Llamamos al método que acabamos de crear en el Helper
      int idReg = await DatabaseHelper.instance.insertarMantenimiento(nuevoMantenimietno);

      if (idReg > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Mantenimiento #$idReg guardada en local!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar Mantenimiento: $e'),
          backgroundColor: Colors.red,
        ),
      );
      
      textNombre.clear();
      textdetalles.clear();
       Future.delayed(const Duration(seconds: 1),(){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => MantenimientoPantalla(),
          )
       );
       } );

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context)=> const MantenimientoPantalla()),(route)=> false,);
          }, 
          icon: Icon(Icons.keyboard_return)),
        backgroundColor: Colors.amberAccent,     
        title: Text('Agenda', style: TextStyle(letterSpacing: 10),),
      ),


      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text('Nuevo Evento'),
        
            SizedBox(height: 20,),
          
            TextField(
              controller: textFecha,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Fecha'
              ),
              onTap: () async{
                DateTime? fecha = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024), 
                  lastDate: DateTime(2100)
                  );
                  if (fecha != null){
                    textFecha.text=
                    "${fecha.day}/${fecha.month}/${fecha.year}";  
                  }
              },
            ),
        
            SizedBox(height: 50),
        
            // ignore: avoid_unnecessary_containers
            
            TextField(
              controller: textNombre,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Titulo'
              ),
            ),
        
           SizedBox(height: 50),
          
            TextField(
              controller: textdetalles,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Detalles'
              ),
            ),
        
            SizedBox(height: 40,),
        
           
                 ElevatedButton(
                onPressed: () async {
                  await guardarMantenimiento(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ), 
                child: Icon(Icons.save)),
          ],
        ),
      ),
    );














  }
}