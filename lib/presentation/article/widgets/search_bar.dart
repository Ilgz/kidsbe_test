import 'package:flutter/material.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.onChanged}) : super(key: key);
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.grey[800]),
      cursorColor: const Color(0xff485ad6),
      onChanged: (text) {
       onChanged(text);
      },
      onSubmitted: (text){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xfff2f2f7),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintText: 'Search',
        hintStyle:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 16),
            child: CustomIcon(
              iconName: "search",
              color: Colors.grey,
            )),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12, left: 16),
            child: CustomIcon(
              iconName: "microphone",
              color: Colors.grey,
            )),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
