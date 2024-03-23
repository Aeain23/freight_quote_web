
import 'package:flutter/material.dart';

const widthSpacing = const SizedBox(width: 10);
const titleSpace = const SizedBox(height: 15);
const bottomSpace = const SizedBox(height: 18);



const titleStyle = TextStyle(
  color: Color(0xFF7A8999),
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
  height: 0.10,
);

const inputTextStyle = TextStyle(
  color: Color(0xFF7A8999),
  fontSize: 14,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  // height: 0.10,
);

class InputBox extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const InputBox({super.key, required this.title, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        titleSpace,
        TextFormField(
          controller: controller,
          cursorHeight: 20,
          readOnly: false,
          minLines: 1,
          maxLines: 1,
          // maxLines: 6,
          decoration: inputBoxStyle(),
          style: inputTextStyle,
        ),
        bottomSpace,
      ],
    );
  }
}


class DoubleInputBox extends StatelessWidget {
  final String title;
  final String? secondTitle;
  final TextEditingController? controller;
  final TextEditingController? secondController;
  final int firstRatio;
  final int secondRatio;
  const DoubleInputBox({
    super.key,
    required this.title,
    this.secondTitle,
    this.controller,
    this.secondController,
    this.firstRatio = 1,
    this.secondRatio = 1,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            secondTitle == null
                ? const SizedBox()
                : Expanded(
                    flex: secondRatio,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        secondTitle!,
                        style: titleStyle,
                      ),
                    ),
                  ),
          ],
        ),
        titleSpace,
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: TextFormField(
                inputFormatters: [],
                controller: controller,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
            widthSpacing,
            Expanded(
              flex: secondRatio,
              child: TextFormField(
                controller: secondController,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
          ],
        ),
        bottomSpace,
      ],
    );
  }
}

class TripleInputBox extends StatelessWidget {
  final String title;
  final String? secondTitle;
  final String? thirdTitle;
  final TextEditingController? controller;
  final TextEditingController? secondController;
  final TextEditingController? thirdController;
  final int firstRatio;
  final int secondRatio;
  final int thirdRatio;
  const TripleInputBox({
    super.key,
    required this.title,
    this.secondTitle,
    this.thirdTitle,
    this.controller,
    this.secondController,
    this.thirdController,
    this.firstRatio = 1,
    this.secondRatio = 1,
    this.thirdRatio = 1,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: Text(
                title,
                style: titleStyle,
              ),
            ),
            secondTitle == null
                ? const SizedBox()
                : Expanded(
                    flex: secondRatio,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        secondTitle!,
                        style: titleStyle,
                      ),
                    ),
                  ),
            thirdTitle == null
                ? const SizedBox()
                : Expanded(
                    flex: secondRatio,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.024),
                      child: Text(
                        thirdTitle!,
                        style: titleStyle,
                      ),
                    ),
                  ),
          ],
        ),
        titleSpace,
        Row(
          children: [
            Expanded(
              flex: firstRatio,
              child: TextFormField(
                inputFormatters: [],
                controller: controller,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
            widthSpacing,
            Expanded(
              flex: secondRatio,
              child: TextFormField(
                controller: secondController,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
            widthSpacing,
            Expanded(
              flex: thirdRatio,
              child: TextFormField(
                controller: thirdController,
                cursorHeight: 20,
                readOnly: false,
                minLines: 1,
                maxLines: 1,
                // maxLines: 6,
                decoration: inputBoxStyle(),
                style: inputTextStyle,
              ),
            ),
          ],
        ),
        bottomSpace,
      ],
    );
  }
}
InputDecoration inputBoxStyle() {
  return InputDecoration(
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(15.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
}