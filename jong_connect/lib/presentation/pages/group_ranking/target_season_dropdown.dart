import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/season.dart';
import '../../../util/app_sizes.dart';

class TargetSeasonDropdown extends ConsumerStatefulWidget {
  const TargetSeasonDropdown(
      {super.key, required this.groupSeasons, required this.onChangeSeasonId});

  final List<Season> groupSeasons;
  final ValueChanged<int?> onChangeSeasonId;

  @override
  ConsumerState<TargetSeasonDropdown> createState() =>
      _TargetSeasonDropdownState();
}

class _TargetSeasonDropdownState extends ConsumerState<TargetSeasonDropdown> {
  int? filterValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH16,
        const Row(
          children: [
            gapW12,
            Text(
              '対象シーズン',
              style: TextStyle(
                fontSize: Sizes.p12,
              ),
            ),
          ],
        ),
        gapH4,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<int?>(
              isExpanded: true,
              value: filterValue,
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text('全て'),
                ),
                for (var season in widget.groupSeasons)
                  DropdownMenuItem(
                    value: season.id,
                    child: Text(
                      season.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  filterValue = value != -1 ? value : null;
                });
                widget.onChangeSeasonId(filterValue);
              },
              buttonStyleData: ButtonStyleData(
                height: 40,
                padding: const EdgeInsets.only(left: Sizes.p8, right: Sizes.p8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                elevation: 0,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: Sizes.p16, right: Sizes.p8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
