import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

KeyboardActionsConfig buildKeyboardConfig({
  required FocusNode focusNodeAmount,
  required FocusNode focusNodePeople,
}) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
    nextFocus: true,
    actions: [
      KeyboardActionsItem(
        focusNode: focusNodeAmount,
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text('閉じる'),
              ),
            );
          },
        ],
      ),
      KeyboardActionsItem(
        focusNode: focusNodePeople,
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text('閉じる'),
              ),
            );
          },
        ],
      ),
    ],
  );
}
