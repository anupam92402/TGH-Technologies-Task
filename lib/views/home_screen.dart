import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tgh_technologies_task/provider/language_provider.dart';
import 'package:tgh_technologies_task/util/colors.dart';
import '../widgets/language_selection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _textController;
  TextEditingController? _textReceivedController;

  @override
  void initState() {
    super.initState();
    var provider = context.read<LanguageProvider>();
    provider.getLanguagesList();
    _textController = TextEditingController(text: provider.text);
    _textReceivedController =
        TextEditingController(text: provider.translatedText);
  }

  @override
  void dispose() {
    _textController?.dispose();
    _textReceivedController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColors.darkGrey,
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Text Translation',
              style: TextStyle(fontSize: 20, color: AllColors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: AllColors.dividerColor,
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: LanguageSelectionContainer(
                  source: 'from',
                )),
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
                Expanded(child: LanguageSelectionContainer(source: 'to')),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Translate From ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AllColors.textColor,
                        fontSize: 12),
                  ),
                  TextSpan(
                    text: provider.from,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AllColors.lightGrey,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 170, // Fixed height
              decoration: const BoxDecoration(
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
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: TextField(
                          controller: _textController,
                          maxLines: null,
                          // Makes the text field scrollable
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(color: Colors.grey),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            provider.text = value;
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AllColors.dividerColor,
                        ),
                        Text(
                          // '${_textEditingController.text.length}/${2300}', // Display character count
                          '${provider.text.length}/${2300}',
                          // Display character count
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Translate To ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AllColors.textColor,
                        fontSize: 12),
                  ),
                  TextSpan(
                    text: provider.to,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AllColors.lightGrey,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 170, // Fixed height
              decoration: const BoxDecoration(
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
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: SingleChildScrollView(
                        child: TextField(
                          controller: _textReceivedController,
                          maxLines: null,
                          // Makes the text field scrollable
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: provider.translatedText,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: AllColors.dividerColor,
                        ),
                        Text(
                          // Display character count
                          '${provider.translatedText.length}/${2300}',
                          // Display character count
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () => provider.translateText(),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff232527))),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AllColors.textColor,
                      fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}