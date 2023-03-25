import 'package:bep/Api/donationController.dart';
import 'package:bep/DonationView/logic/calculateRate.dart';
import 'package:bep/DonationView/ui/donationStatusList.dart';
import '../../DonationView/ui/donationChart.dart';
import 'package:flutter/material.dart';

const colors = [
  AppColors.contentColorBlue,
  AppColors.contentColorYellow,
  AppColors.contentColorPurple,
  AppColors.contentColorGreen
];

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
