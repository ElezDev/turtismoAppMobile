import 'package:flutter/material.dart';
import 'package:turismoapp/utils/colors.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: colorTertiario,
        ),
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: colorTertiario,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(color: colorSecundario),
      ),
      onChanged: (value) {},
    );
  }
}
