import 'package:bep/Api/donationController.dart';
import 'package:bep/DonationView/logic/calculateRate.dart';
import 'package:bep/DonationView/ui/donationStatusList.dart';
import '../../DonationView/ui/donationChart.dart';
import 'package:flutter/material.dart';

Map<String, Color> colors = {
  "Life on Land": Color.fromRGBO(86, 192, 43, 1),
  "Other": Color.fromARGB(255, 33, 33, 33),
  "Life Below Water": Color.fromRGBO(10, 151, 217, 1),
  "Climate Action": Color.fromRGBO(63, 126, 68, 1),
};

class DonationStatus extends StatefulWidget {
  @override
  State<DonationStatus> createState() => _DonationStatusState();
}

class _DonationStatusState extends State<DonationStatus> {
  DonationController donationContoller = DonationController();
  List<CategoryState> categoriesState = [];
  List<int> categoryValue = [];
  List<double> categoryRate = [];

  Future<void> _getCategoriesState() async {
    final response = await donationContoller.getDonationStatus();
    setState(() {
      categoriesState = response!;
      categoryValue = categoriesState.map((e) => e.donationPoint).toList();
      categoryRate = calculateRate(categoryValue);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategoriesState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          donationChart(
            categoryState: categoriesState,
            colors: colors,
            categoryRate: categoryRate,
          ),
          categoriesState.length > 0
              ? DonationStatusList(
                  categoriesState: categoriesState,
                  colors: colors,
                )
              : Text(''),
        ],
      ),
    );
  }
}
