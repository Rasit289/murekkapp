import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SearchTextBox extends StatelessWidget {
  const SearchTextBox({
    Key? key,
    required this.hintText,
    required this.valueList,
    required this.textControl,
  }) : super(key: key);
  final String hintText;
  final List<String> valueList;

  final TextEditingController textControl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 0),
      child: SearchField(
        controller: textControl,
        suggestions: valueList
            .map((e) => SearchFieldListItem<String>(e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    e,
                  ),
                )))
            .toList(),
        searchInputDecoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 16,
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          //hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            //fontFamily: globalFont
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: BoxConstraints(
            minHeight: 40,
            minWidth: 32,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5)),
        ),
        suggestionsDecoration: SuggestionDecoration(
            color: Colors.white, padding: const EdgeInsets.all(4)),
        searchStyle: TextStyle(
          height: 1,
          fontSize: 15,
          color: Colors.black,
        ),
        validator: (x) {
          if (!valueList.contains(x) || x!.isEmpty) {
            return '';
          }
          return null;
        },
        maxSuggestionsInViewPort: 6,
        itemHeight: 45,
        onSuggestionTap: null,
      ),
    );
  }
}
