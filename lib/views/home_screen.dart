import 'package:flutter/material.dart';
import 'package:tgh_technologies_task/util/colors.dart';
import '../widgets/language_selection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColors.darkGrey,
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              'Text Translation',
              style: TextStyle(fontSize: 20, color: AllColors.white),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              color: AllColors.dividerColor,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: LanguageSelectionContainer()),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.swap_horiz_outlined,
                  color: AllColors.lightGrey,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: LanguageSelectionContainer()),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Translate From ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AllColors.textColor,
                        fontSize: 12),
                  ),
                  TextSpan(
                    text: '(Germany)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AllColors.lightGrey,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 170, // Fixed height
              decoration: BoxDecoration(
                color: AllColors.grey,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: TextField(
                          // controller: _textEditingController,
                          maxLines: null, // Makes the text field scrollable
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(color: AllColors.dividerColor,),
                        Text(
                          // '${_textEditingController.text.length}/${2300}', // Display character count
                          '198/${2300}', // Display character count
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Translate To ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AllColors.textColor,
                        fontSize: 12),
                  ),
                  TextSpan(
                    text: '(Germany)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AllColors.lightGrey,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 170, // Fixed height
              decoration: BoxDecoration(
                color: AllColors.grey,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: TextField(
                          // controller: _textEditingController,
                          maxLines: null, // Makes the text field scrollable
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(color: AllColors.dividerColor,),
                        Text(
                          // '${_textEditingController.text.length}/${2300}', // Display character count
                          '198/${2300}', // Display character count
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}