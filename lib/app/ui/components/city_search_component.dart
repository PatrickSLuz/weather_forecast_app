import 'package:flutter/material.dart';

class CitySearchComponent extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  final TextEditingController controller;

  CitySearchComponent({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : controller = TextEditingController(text: initialValue ?? '');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      textInputAction: TextInputAction.search,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      decoration: const InputDecoration(
        hintText: 'Pesquise a cidade ...',
      ),
    );
  }
}
