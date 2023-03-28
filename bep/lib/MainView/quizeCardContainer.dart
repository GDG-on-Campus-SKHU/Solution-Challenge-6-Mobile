import 'package:bep/Api/quizeController.dart';
import 'package:bep/MainView/quizCard.dart';
import 'package:bep/Util/quizType.dart';
import 'package:flutter/material.dart';

class quizCardContainer extends StatefulWidget {
  quizCardContainer(
      {required this.isQuizOpen,
      required this.selectedId,
      required this.updateSelectedId,
      required this.quizes,
      required this.getPoint});

  final bool isQuizOpen;
  final Function(int) updateSelectedId;
  final int selectedId;
  final List<Quiz> quizes;
  final Future<void> Function() getPoint;
  @override
  State<quizCardContainer> createState() => _quizCardContainerState();
}

class _quizCardContainerState extends State<quizCardContainer> {
  late List<bool> _isSelectedList;
  late List<Quiz> quizes;
  @override
  void initState() {
    super.initState();
    _isSelectedList = List.generate(3, (_) => false);
  }

  List<quizCard> quizCardList() {
    List<quizCard> quizeCards = [];
    if (widget.selectedId == -1) {
      _isSelectedList = List.generate(3, (_) => false);
    }
    for (int i = 0; i < widget.quizes.length; i++) {
      quizeCards.add(
        quizCard(
          index: i,
          selectedList: _isSelectedList,
          type: stringToQuizType(widget.quizes[i].category),
          // type: quizType.Land,
          question: widget.quizes[i].question,
          onSelected: _onSelect,
          mPoint: widget.quizes[i].miPoint,
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
      visible: widget.isQuizOpen,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 76),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: quizCardList()),
        ),
      ),
    );
  }
}
