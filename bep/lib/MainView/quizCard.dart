import 'package:bep/Util/quizType.dart';
import 'package:flutter/material.dart';

class quizCard extends StatefulWidget {
  final int index;
  final List<bool> selectedList;
  final quizType type;
  final String question;
  final ValueChanged<int> onSelected;
  final int mPoint;

  quizCard({
    required this.index,
    required this.selectedList,
    required this.type,
    required this.question,
    required this.onSelected,
    required this.mPoint,
  });

  @override
  State<quizCard> createState() => _quizCardState();
}

class _quizCardState extends State<quizCard> {
  Color selected = Color.fromRGBO(0, 0, 0, 0.25);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Container(
        height: 60,
        width: screenSize.width - 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset.zero,
              blurRadius: 5,
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.onSelected(widget.index);
            });
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Color.fromARGB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: widget.selectedList[widget.index]
                  ? BorderSide(color: Color.fromARGB(172, 0, 115, 255), width: 2)
                  : BorderSide.none,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 4,
                        offset: Offset.zero,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: !widget.selectedList[widget.index]
                        ? Image(
                            image: AssetImage(
                              'assets/images/${quizTypeToString(widget.type)}.png',
                            ),
                          )
                        : Text(
                            widget.mPoint.toString(),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
              Container(
                width: screenSize.width - 100,
                child: Text(
                  widget.question,
                  style: TextStyle(fontSize: 14),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
