import 'package:bep/Util/quizeType.dart';
import 'package:flutter/material.dart';

class quizeCard extends StatefulWidget {
  final int index;
  final List<bool> selectedList;
  final quizeType type;
  final String question;
  final ValueChanged<int> onSelected;

  quizeCard({
    required this.index,
    required this.selectedList,
    required this.type,
    required this.question,
    required this.onSelected,
  });

  @override
  State<quizeCard> createState() => _quizeCardState();
}

class _quizeCardState extends State<quizeCard> {
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
              color: !widget.selectedList[widget.index]
                  ? Color.fromRGBO(0, 0, 0, 0.25)
                  : Color.fromRGBO(255, 141, 25, 0.25),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: !widget.selectedList[widget.index]
                            ? Color.fromRGBO(0, 0, 0, 0.25)
                            : Color.fromRGBO(255, 141, 25, 0.25),
                        blurRadius: 4,
                        offset: Offset.zero,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                      image: AssetImage(
                          'assets/${quizeTypeToString(widget.type)}.png'),
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
