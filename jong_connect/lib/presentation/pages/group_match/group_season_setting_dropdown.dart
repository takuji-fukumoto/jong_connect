import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jong_connect/usecase/group_match_use_case.dart';

import '../../../domain/model/group_match.dart';
import '../../../domain/model/season.dart';
import '../../../util/app_sizes.dart';

class GroupSeasonSettingDropdown extends ConsumerStatefulWidget {
  const GroupSeasonSettingDropdown(
      {super.key, required this.groupMatch, required this.groupSeasons});

  final GroupMatch groupMatch;
  final List<Season> groupSeasons;

  @override
  ConsumerState<GroupSeasonSettingDropdown> createState() =>
      _GroupSeasonSettingDropdownState();
}

class _GroupSeasonSettingDropdownState
    extends ConsumerState<GroupSeasonSettingDropdown> {
  int? filterValue;

  @override
  void initState() {
    filterValue = widget.groupMatch.seasonId;
    super.initState();
  }

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
                  child: Text('-'),
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
                ref
                    .read(groupMatchUseCaseProvider)
                    .updateSeason(widget.groupMatch, filterValue);
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
