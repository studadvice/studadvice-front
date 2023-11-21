import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final List<Widget> items;
  final double ratioPerItem;

  BottomSheetWidget({required this.items, required this.ratioPerItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0), // Top left corner
        topRight: Radius.circular(20.0), // Top right corner
      ),
      child: Container(
        height: (items.length * ratioPerItem).clamp(100.0, 500.0),
        color: Theme.of(context).scaffoldBackgroundColor, 
        child: Column(
          children: [
            SizedBox(
              // This is the divider
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Container(
                  height: 5.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items,
              ),
            ),
            const SizedBox(
              height: 50.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

