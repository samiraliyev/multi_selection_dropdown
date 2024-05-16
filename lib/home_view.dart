import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_dropdown/model.dart';
import 'package:multi_select_dropdown/service.dart';
import 'package:multiselect/multiselect.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RxList<DropdownItem> selectedOptionList = RxList<DropdownItem>([]);
  List<DropdownItem> options = [];

  @override
  void initState() {
    super.initState();
    fetchDropdownItems();
  }

  Future<void> fetchDropdownItems() async {
    try {
      final apiService = ApiService();
      final List<DropdownItem> items = await apiService.fetchDropdownItems();
      setState(() {
        options = items;
      });
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Select Dropdown"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropDownMultiSelect<DropdownItem>(
                options: options,
                whenEmpty: "Select options",
                onChanged: (selectedValues) {
                  setState(() {
                    selectedOptionList.value = selectedValues;
                  });
                },
                selectedValues: selectedOptionList.toList(),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Obx(
                () => Text(
                  selectedOptionList.map((item) => item.title).join(", \n"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
