import 'package:bep/Api/quizeController.dart';
import 'package:bep/MainView/quizeCard.dart';
import 'package:bep/Util/quizeType.dart';
import 'package:flutter/material.dart';

class quizeCardContainer extends StatefulWidget {
  quizeCardContainer({required this.isQuizeOpen, required this.updateSelectedId, required this.quizes});
  final bool isQuizeOpen;
  final Function(int) updateSelectedId;
  final List<Quize> quizes;

  @override
  State<quizeCardContainer> createState() => _quizeCardContainerState();
}

class _quizeCardContainerState extends State<quizeCardContainer> {
  late List<bool> _isSelectedList;
  late List<Quize> quizes;
  @override
  void initState() {
    super.initState();
    _isSelectedList = List.generate(3, (_) => false);
  }

  List<quizeCard> quizeCardList() {
    List<quizeCard> quizeCards = [];
    for (int i = 0; i < widget.quizes.length; i++) {
      quizeCards.add(
        quizeCard(
          index: i,
          selectedList: _isSelectedList,
          type: quizeType.Land,
          question: widget.quizes[i].question,
          onSelected: _onSelect,
        ),
      );
    }
    return quizeCards;
  }

  void _onSelect(int index) {
    setState(() {
      if (_isSelectedList[index]) {
        _isSelectedList = List.generate(3, (_) => false);
        widget.updateSelectedId(-1);
      } else {
        _isSelectedList = List.generate(3, (_) => false);
        _isSelectedList[index] = true;
        widget.updateSelectedId(index);
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
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: quizeCardList()),
        ),
      ),
    );
  }
}
