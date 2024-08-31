import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opss!'),
      ),
      body: const Center(
        child: Text('Dados inválidos ao carregar a página.'),
      ),
    );
  }
}
