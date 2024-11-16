import 'package:flutter/material.dart';
import 'package:jong_connect/util/app_sizes.dart';
import 'package:keyboard_actions/keyboard_custom.dart';

class CustomNumberKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  @override
  final ValueNotifier<String> notifier;

  CustomNumberKeyboard({super.key, required this.notifier});

  @override
  Size get preferredSize => const Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          gapH8,
          Expanded(
            child: Row(
              children: [
                gapW8,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 空白の時以外はマイナスは受け付けない
                      if (notifier.value.isNotEmpty) {
                        return;
                      }
                      updateValue('-');
                    },
                    child: const _CustomKeyContainer(
                      label: '-',
                    ),
                  ),
                ),
                gapW8,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 空白あるいはマイナスのみの時は0は受け付けない
                      if (notifier.value.isEmpty || notifier.value == '-') {
                        return;
                      }
                      updateValue('${notifier.value}0');
                    },
                    child: const _CustomKeyContainer(
                      label: '0',
                    ),
                  ),
                ),
                gapW8,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (notifier.value.isEmpty) {
                        return;
                      }
                      var value = notifier.value
                          .substring(0, notifier.value.length - 1);
                      updateValue(value);
                    },
                    child: SizedBox(
                      height: double.maxFinite,
                      child: Icon(
                        Icons.backspace,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                ),
                gapW8,
              ],
            ),
          ),

          gapH4,

          /// 1 ~ 3
          Expanded(
            child: Row(
              children: [
                for (var i = 1; i <= 3; i++) ...[
                  gapW8,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        updateValue('${notifier.value}$i');
                      },
                      child: _CustomKeyContainer(
                        label: i.toString(),
                      ),
                    ),
                  ),
                ],
                gapW8,
              ],
            ),
          ),

          gapH4,

          /// 4 ~ 6
          Expanded(
            child: Row(
              children: [
                for (var i = 4; i <= 6; i++) ...[
                  gapW8,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        updateValue('${notifier.value}$i');
                      },
                      child: _CustomKeyContainer(
                        label: i.toString(),
                      ),
                    ),
                  ),
                ],
                gapW8,
              ],
            ),
          ),

          gapH4,

          /// 7 ~ 9
          Expanded(
            child: Row(
              children: [
                for (var i = 7; i <= 9; i++) ...[
                  gapW8,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        updateValue('${notifier.value}$i');
                      },
                      child: _CustomKeyContainer(
                        label: i.toString(),
                      ),
                    ),
                  ),
                ],
                gapW8,
              ],
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}

class _CustomKeyContainer extends StatelessWidget {
  const _CustomKeyContainer({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.p24,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
    );
  }
}
