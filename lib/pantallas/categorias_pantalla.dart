import 'package:flutter/material.dart';

class CategoriasPantalla extends StatelessWidget {
  const CategoriasPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
    ]
    ),
    floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
        onPressed: (){},
        child: const Icon(Icons.add, size: 30,),),
    );
  }
}