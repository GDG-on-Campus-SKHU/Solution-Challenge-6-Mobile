import 'package:bep/Api/donationController.dart';
import 'package:flutter/material.dart';

class DonationStatusList extends StatelessWidget {
  DonationStatusList({required this.categoriesState, required this.colors});
  final List<CategoryState> categoriesState;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List<Widget>.generate(
          colors.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Color.fromARGB(30, 0, 0, 0), blurRadius: 4, blurStyle: BlurStyle.normal)],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Text(categoriesState[index].category),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Text(categoriesState[index].donationPoint.toString()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
