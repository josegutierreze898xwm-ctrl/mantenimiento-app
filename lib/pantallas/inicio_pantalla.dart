import 'package:flutter/material.dart';

class InicioPantalla extends StatefulWidget {
  const InicioPantalla({super.key});

  @override
  State<InicioPantalla> createState() => _InicioPantalla();
}

class _InicioPantalla extends State<InicioPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Inicio'),
    );
  }
}