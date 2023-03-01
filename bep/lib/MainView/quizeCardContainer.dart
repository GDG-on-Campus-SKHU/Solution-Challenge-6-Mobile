import 'package:bep/MainView/quizeCard.dart';
import 'package:bep/Util/quizeType.dart';
import 'package:flutter/material.dart';

class quizeCardContainer extends StatefulWidget {
  quizeCardContainer({required this.isQuizeOpen});
  final bool isQuizeOpen;

  @override
  State<quizeCardContainer> createState() => _quizeCardContainerState();
}

class _quizeCardContainerState extends State<quizeCardContainer> {
  late List<bool> _isSelectedList;

  @override
  void initState() {
    super.initState();
    _isSelectedList = List.generate(3, (_) => false);
  }

  void _onSelect(int index) {
    setState(() {
      if (_isSelectedList[index]) {
        _isSelectedList = List.generate(3, (_) => false);
      } else {
        _isSelectedList = List.generate(3, (_) => false);
        _isSelectedList[index] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isQuizeOpen,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 76),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              quizeCard(
                index: 0,
                selectedList: _isSelectedList,
                type: quizeType.Land,
                question: "Find the countries that plant the most trees",
                onSelected: _onSelect,
              ),
              quizeCard(
                index: 1,
                selectedList: _isSelectedList,
                type: quizeType.Land,
                question: "Find a country where a variety of grasses grow",
                onSelected: _onSelect,
              ),
              quizeCard(
                index: 2,
                selectedList: _isSelectedList,
                type: quizeType.Land,
                question: "Find the countries that plant the most trees",
                onSelected: _onSelect,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
