import 'package:flutter/material.dart';

class CalButtons extends StatelessWidget {
  const CalButtons(
      {super.key,
      required this.numList,
      required this.pressed,
      required this.clear,
      required this.equal});
  final void Function(String val) pressed;
  final void Function() clear;
  final void Function() equal;
  final List<String> numList;

  @override
  Widget build(context) {
    return SizedBox(
      height: 550,
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          ...numList.map((item) {
            return item != "clr" && item != "="
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          backgroundColor:
                              const Color.fromARGB(255, 209, 209, 209),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        pressed(item);
                      },
                      child: Text(
                        item,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  )
                : item == "="
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor:
                                  const Color.fromARGB(255, 209, 209, 209),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: equal,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundColor:
                                  const Color.fromARGB(255, 209, 209, 209),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: clear,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black),
                          ),
                        ),
                      );
          })
        ],
      ),
    );
  }
}
