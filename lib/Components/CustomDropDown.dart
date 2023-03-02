import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final double horizontaPadding;
  final double maxMenuHeight;
  final List<String> list;
  final Function(String?)? onChanged;
  final String selectedValue;
  final int index;

  const CustomDropDown({
    super.key,
    required this.horizontaPadding,
    required this.maxMenuHeight,
    required this.list,
    required this.onChanged, required this.selectedValue, required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: horizontaPadding, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              menuMaxHeight: maxMenuHeight,
              value: selectedValue,
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}