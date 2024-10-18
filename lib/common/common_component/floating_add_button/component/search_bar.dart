import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/theme/ui_config.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _queryTextEditingController;

  final FocusNode searchFocusNode;

  const SearchBar({super.key, required TextEditingController queryTextEditingController, required this.searchFocusNode}) : _queryTextEditingController = queryTextEditingController;

  @override
  Widget build(BuildContext context) {
    _queryTextEditingController.addListener(() {
      // viewModel.onSearchChanged(_queryTextEditingController.text);
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: _queryTextEditingController,
        focusNode: searchFocusNode,
        // autofocus: true,
        onTap: () => {},
        //textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          filled: true,
          // fillColor: UiConfig.greyColor.withOpacity(0.1),
          fillColor: UiConfig.whiteColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          labelText: '',
          labelStyle: const TextStyle(color: Colors.black54),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffix: GestureDetector(
            onTap: () {
              _queryTextEditingController.clear();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.clear,
                size: 20,
              ),
            ),
          ),
        ),
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (String value) {
          // viewModel.queryText = value;
          // viewModel.onSearch(value);
          // viewModel.userSearch(value);
          FocusScope.of(context).unfocus();
        },
        onChanged: (value) {
          // viewModel.onSearchChanged(value);
        },
      ),
    );
  }
}
