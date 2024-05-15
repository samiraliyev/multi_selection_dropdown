import 'package:flutter/material.dart';

import 'package:flutter_custom_selector/flutter_custom_selector.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({
    super.key,
  });

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> dataString = ["HP", "Dell", "Apple", "Asus", "Acer", "Samsung"];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Select page"),
      ),
      body: SizedBox(
          height: deviceHeight, width: deviceWidth, child: showAlertDialog()),
    );
  }

  AlertDialog showAlertDialog() {
    return AlertDialog.adaptive(
      content: CustomMultiSelectField(
        items: dataString,
        enableAllOptionSelect: true,
        onSelectionDone: _onProductsSelectionComplete,
        itemAsString: (item) => item.toString(),
        title: 'Select',
      ),
    );
  }

  void _onProductsSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
