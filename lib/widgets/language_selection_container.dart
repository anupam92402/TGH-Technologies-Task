import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_technologies_task/provider/language_provider.dart';
import 'package:tgh_technologies_task/util/colors.dart';

class LanguageSelectionContainer extends StatelessWidget {
  final String source;

  const LanguageSelectionContainer({required this.source});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
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
            return ListView(
              padding: EdgeInsets.all(24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style:
                          TextStyle(fontSize: 16, color: AllColors.lightGrey),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'All Languages',
                      style:
                          TextStyle(fontSize: 16, color: AllColors.lightGrey),
                    ),
                    SizedBox(height: 24),
                    ListView.builder(
                      shrinkWrap: true,

                      // Important: Set shrinkWrap to true
                      physics: NeverScrollableScrollPhysics(),
                      // Disable scrolling of the inner ListView
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (source == 'from') {
                              provider.from = provider.list[index];
                            } else {
                              provider.to = provider.list[index];
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AllColors.darkGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              provider.list[index],
                              style: TextStyle(
                                  fontSize: 16, color: AllColors.lightGrey),
                            ),
                          ),
                        );
                      },
                      itemCount: provider.list.length,
                    ),
                  ],
                ),
              ],
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
            source == 'from' ? provider.from : provider.to,
            style: TextStyle(
                color: AllColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}