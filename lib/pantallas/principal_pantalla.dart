import 'package:flutter/material.dart';
import 'package:flutter_mantenimiento/pantallas/categorias_pantalla.dart';
import 'package:flutter_mantenimiento/pantallas/inicio_pantalla.dart';
import 'package:flutter_mantenimiento/pantallas/mantenimiento_pantalla.dart';


class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _indicePantalla = 0;
  final List<Widget> _listaPantallas = const [
    InicioPantalla(),
    MantenimientoPantalla(),
    CategoriasPantalla(),
  ];
  final List<String> _titulosPantallas= const[
    'Inicio',
    'Mantenimiento',
    'Categorias'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_titulosPantallas[_indicePantalla]),
      ),
      body: IndexedStack(
        index: _indicePantalla,
        children: _listaPantallas,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indicePantalla,
        onDestinationSelected: (int index){
          setState(() {
            _indicePantalla=index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Inicio'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Mantenimineto'),
          NavigationDestination(icon: Icon(Icons.person_pin_circle), label: 'Categorias'),
        ]),
    );
  }
}