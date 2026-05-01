import 'package:expenseapp/const_things.dart';
import 'package:flutter/material.dart';

class CustomAppbarContainer extends StatefulWidget {
  final Color containerBGColor;
  final String title;
  final String imagUrl;
  final double amount;
  const CustomAppbarContainer({
    super.key,
    required this.containerBGColor,
    required this.title,
    required this.imagUrl,
    required this.amount,
  });

  @override
  State<CustomAppbarContainer> createState() => _CustomAppbarContainerState();
}

class _CustomAppbarContainerState extends State<CustomAppbarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 70,
      decoration: BoxDecoration(
        color: widget.containerBGColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(0.7),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),

              child: Image.asset(widget.imagUrl),
            ),
            sizeSpacerWidth1,
            Column(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$ ${widget.amount.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
