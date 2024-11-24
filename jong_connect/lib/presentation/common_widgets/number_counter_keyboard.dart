import 'package:flutter/material.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:keyboard_actions/keyboard_custom.dart';

import '../../util/score_color.dart';

class NumberCounterKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  @override
  final ValueNotifier<String> notifier;

  NumberCounterKeyboard({super.key, required this.notifier});

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Column(
        children: [
          gapH8,
          // Center(child: Text(notifier.value.toString())),
          // gapH4,
          Expanded(
            child: Row(
              children: [
                gapW8,
                Expanded(
                  child: _numberInputButton(context, 1),
                ),
                gapW4,
                Expanded(
                  child: _numberInputButton(context, 5),
                ),
                gapW4,
                Expanded(
                  child: _numberInputButton(context, 10),
                ),
                gapW8,
              ],
            ),
          ),
          gapH8,
          Expanded(
            child: Row(
              children: [
                gapW8,
                Expanded(
                  child: _numberInputButton(context, -1),
                ),
                gapW4,
                Expanded(
                  child: _numberInputButton(context, -5),
                ),
                gapW4,
                Expanded(
                  child: _numberInputButton(context, -10),
                ),
                gapW8,
              ],
            ),
          ),
          gapH16,
        ],
      ),
    );
  }

  Widget _numberInputButton(BuildContext context, int value) {
    return ElevatedButton(
      onPressed: () {
        var num = int.tryParse(notifier.value);
        if (num == null) {
          return;
        }
        updateValue((num + value).toString());
      },
      child: Center(
        child: Text(
          '${value > 0 ? '+' : ''}$value',
          style: TextStyle(
            fontSize: Sizes.p16,
            color: scoreColor(context, value),
          ),
        ),
      ),
    );
  }
}
