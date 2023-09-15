import 'package:flutter/material.dart';
import 'package:tgh_technologies_task/util/colors.dart';

class LanguageSelectionContainer extends StatelessWidget {
  const LanguageSelectionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          // color is applied to main screen when modal bottom screen is displayed
          barrierColor: Colors.black.withOpacity(0.9),
          //background color for modal bottom screen
          backgroundColor: AllColors.grey,
          //elevates modal bottom screen
          elevation: 10,
          // gives rounded corner to modal bottom screen
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          ),
          builder: (BuildContext context) {
            return SizedBox(
              child: ListView(
                padding: EdgeInsets.all(24),
                children: [
                  Text(
                    'From',
                    style: TextStyle(fontSize: 16, color: AllColors.lightGrey),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'All Languages',
                    style: TextStyle(fontSize: 16, color: AllColors.lightGrey),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: AllColors.darkGrey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'Germany',
                      style: TextStyle(fontSize: 16, color: AllColors.lightGrey),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: AllColors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Germany',
            style: TextStyle(
                color: AllColors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}