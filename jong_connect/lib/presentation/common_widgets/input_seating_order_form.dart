import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jong_connect/util/app_sizes.dart';

import '../../domain/model/app_user.dart';

class InputSeatingOrderForm extends StatefulWidget {
  const InputSeatingOrderForm({super.key, required this.players});

  final List<AppUser> players;

  @override
  State<InputSeatingOrderForm> createState() => _InputSeatingOrderFormState();
}

class _InputSeatingOrderFormState extends State<InputSeatingOrderForm> {
  final List<String> orderNames = ['起家', '南家', '西家', '北家'];
  List<bool> isSetOrder = [];
  List<int?> seatOrders = [];
  int currentOrder = 1;

  @override
  void initState() {
    super.initState();
    isSetOrder = List.generate(widget.players.length, (index) => false);
    seatOrders = List.generate(widget.players.length, (index) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingV20H16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < widget.players.length; i++) ...[
            GestureDetector(
              onTap: () {
                if (!isSetOrder[i]) {
                  seatOrders[i] = currentOrder;
                  currentOrder++;
                } else {
                  if (seatOrders[i] == null) {
                    return;
                  }
                  final targetOrder = seatOrders[i]!;
                  seatOrders = seatOrders
                      .map((order) =>
                          (order ?? 0) > targetOrder ? (order ?? 0) - 1 : order)
                      .toList();
                  seatOrders[i] = null;
                  currentOrder--;
                }
                setState(() {
                  isSetOrder[i] = !isSetOrder[i];
                });
                if (seatOrders.every((order) => order != null)) {
                  var outputOrders =
                      seatOrders.map<int>((order) => order!).toList();
                  context.pop(outputOrders);
                }
              },
              child: Container(
                width: double.infinity,
                height: Sizes.p32,
                decoration: BoxDecoration(
                  color: isSetOrder[i]
                      ? Colors.amber.withAlpha(200)
                      : Colors.white,
                  border: Border.all(color: Colors.black12, width: 1),
                ),
                child: Row(
                  children: [
                    gapW8,
                    Expanded(
                      child: Text(widget.players[i].name),
                    ),
                    Expanded(
                      child: Text(seatOrders[i] != null
                          ? orderNames[seatOrders[i]! - 1]
                          : ''),
                    ),
                    gapW8,
                  ],
                ),
              ),
            ),
            gapH8,
          ],
        ],
      ),
    );
  }
}
