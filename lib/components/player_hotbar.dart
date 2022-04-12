import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerHotbar extends StatelessWidget {
  const PlayerHotbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: double.infinity,
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheets'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
        decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(
              color: Colors.orange,
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(10))),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Глава 1. Часть 10",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: [
                  button(
                      const Icon(
                        Icons.skip_previous,
                        size: 40,
                      ),
                      () {}),
                  button(
                      const Icon(
                        Icons.play_arrow,
                        size: 40,
                      ),
                      () {}),
                  button(
                      const Icon(
                        Icons.skip_next,
                        size: 40,
                      ),
                      () {})
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.bottomCenter,
                child: const LinearProgressIndicator(
                  minHeight: 2,
                  value: 10,
                  semanticsLabel: 'Linear progress indicator',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button(Icon icon, VoidCallback? onPressed) {
    return TextButton(
      child: icon,
      style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: Colors.black),
      onPressed: onPressed,
    );
  }
}
