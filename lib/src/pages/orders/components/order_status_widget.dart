import 'package:flutter/material.dart';

import '../../../../commons/resources/translation.dart';
import '../../../config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDots(
          isActive: true,
          title: Translation.of(context).confirmedOrder,
        ),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          _StatusDots(
            isActive: true,
            title: Translation.of(context).reversedPix,
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          _StatusDots(
            isActive: true,
            title: Translation.of(context).pixPaymentDue,
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDots(
            isActive: currentStatus >= 2,
            title: Translation.of(context).payment,
          ),
          _CustomDivider(),
          _StatusDots(
            isActive: currentStatus >= 3,
            title: Translation.of(context).preparing,
          ),
          _CustomDivider(),
          _StatusDots(
            isActive: currentStatus >= 4,
            title: Translation.of(context).shipping,
          ),
          _CustomDivider(),
          _StatusDots(
            isActive: currentStatus == 5,
            title: Translation.of(context).delivered,
          ),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDots extends StatelessWidget {
  const _StatusDots({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : SizedBox.shrink(),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
