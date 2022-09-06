import 'package:flutter/material.dart';
import 'package:nearby_location_finder/resources/text_style.dart';

import 'color.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  Function() onClickCancelButton;
  Function() onClickSaveButton;
  final String cancelButtonText;
  final String saveButtonText;
  final bool isSameStylesForButtons;

  ConfirmationDialog(
      {Key? key,
      required this.message,
      required this.onClickCancelButton,
      required this.onClickSaveButton,
      this.isSameStylesForButtons = false,
      this.cancelButtonText = "Cancel",
      this.saveButtonText = "Exit"})
      : super(key: key);

  static showConfirmationDialog(
      {required BuildContext context,
      required String message,
      required Function() onClickSave,
      required Function() onClickCancel,
      bool isSameStylesForButtons = false,
      String cancelButtonText = "Cancel",
      String saveButtonText = "Exit"}) async {
    bool check = false;
    await showDialog(
        context: context,
        builder: (BuildContext context) => ConfirmationDialog(
              message: message,
              cancelButtonText: cancelButtonText,
              saveButtonText: saveButtonText,
              isSameStylesForButtons: isSameStylesForButtons,
              onClickCancelButton: () {
                onClickCancel();
                check = false;
              },
              onClickSaveButton: () {
                onClickSave();
                check = true;
              },
            ));
    return check;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                message,
                style: AppTextStyle.body2,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onClickSaveButton();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(saveButtonText,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.body2.copyWith(
                                color: isSameStylesForButtons
                                    ? AppColor.secondaryColor
                                    : AppColor.primaryGrey,
                              )),
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFFB2B2B2)),
                          borderRadius: BorderRadius.circular(8),
                          color: isSameStylesForButtons
                              ? AppColor.primaryColor
                              : const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onClickCancelButton();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      // constraints: BoxConstraints(
                      //   minWidth: MediaQuery.of(context).size.width / 5,
                      //   // minHeight: dialogHeight * 0.2,
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(cancelButtonText,
                              style: AppTextStyle.body2
                                  .copyWith(color: AppColor.secondaryColor)),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.primaryColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
