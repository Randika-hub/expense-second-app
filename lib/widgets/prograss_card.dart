import 'package:flutter/material.dart';

class PrograssCard extends StatefulWidget {
  final String name;
  final Color prograssColor;
  final double amount;
  final double total;
  final bool isExpence;

  const PrograssCard({
    super.key,
    required this.name,
    required this.prograssColor,
    required this.amount,
    required this.total,
    required this.isExpence,
  });

  @override
  State<PrograssCard> createState() => _PrograssCardState();
}

class _PrograssCardState extends State<PrograssCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // 1. කාඩ් එක ඇතුළේ ඉඩ මැනගන්න මේක දාමු
      builder: (context, constraints) {
        // 2. දැන් Screen එකේ පළල නෙවෙයි, කාඩ් එකේ පළල (constraints.maxWidth) ගමු
        double maxAvailableWidth = constraints.maxWidth;
        double percentage = widget.total != 0
            ? (widget.amount / widget.total)
            : 0;

        // ප්‍රමාණය 100% ට වඩා වැඩි නම් 1.0 (Full width) ට සීමා කරමු (Safety)
        if (percentage > 1) percentage = 1;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // වමට පෙළගස්වමු
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: widget.prograssColor.withOpacity(0.43),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                "${percentage.toStringAsFixed(2)}%",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        widget.amount.toStringAsFixed(2),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: widget.isExpence ? Colors.red : Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // 3. Progress Bar එකේ පසුබිම (Grey bar)
                  Stack(
                    children: [
                      Container(
                        height: 12,
                        width: maxAvailableWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors
                              .grey
                              .shade200, // පස්සෙන් තියෙන අළු පාට බාර් එක
                        ),
                      ),
                      // 4. පාට වැටෙන කොටස (Actual Progress)
                      Container(
                        height: 12,
                        width:
                            maxAvailableWidth *
                            percentage, // පංගුව අනුව පළල තීරණය වේ
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: widget.prograssColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //   @override
  //   Widget build(BuildContext context) {
  //     // මේක තේරුන්නෑ ඈ. මතකතියාගන්න.
  //     double prograssWidth = widget.total != 0
  //         ? MediaQuery.of(context).size.width * (widget.amount / widget.total)
  //         : 0;
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //           color: Colors.white,
  //           boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20)],
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(30),
  //                         color: Colors.white,
  //                       ),
  //                       child: Row(
  //                         children: [
  //                           Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(100),
  //                               color: widget.prograssColor,
  //                             ),
  //                           ),
  //                           sizeSpacerWidth1,
  //                           Text(
  //                             widget.name,
  //                             style: const TextStyle(
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 25,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   const Spacer(),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(
  //                       widget.amount.toStringAsFixed(2),
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 25,
  //                         color: widget.isExpence ? Colors.red : Colors.green,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               sizeSpacerHeight1,
  //               // implement the prograss card,
  //               // මේක තේරුන්නෑ ඈ. මතකතියාගන්න.
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Container(
  //                   height: 10,
  //                   width: prograssWidth,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(30),
  //                     color: widget.prograssColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
}
