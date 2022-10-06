import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../commons/resources/locale_images.dart';
import '../../../../commons/resources/translation.dart';
import '../../../models/cart_item_model.dart';
import '../../../models/order_model.dart';
import '../../../service/utils_services.dart';
import '../../common_widgets/payment_dialog.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Translation.of(context).order + '${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map(
                          (orderItem) {
                            return _OrderItemWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _makeTotalPrice(context),
            _makeButtonPix(context)
          ],
        ),
      ),
    );
  }

  Text _makeTotalPrice(BuildContext context) => Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: Translation.of(context).total,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: utilsServices.priceToCurrency(order.total),
            ),
          ],
        ),
      );

  Visibility _makeButtonPix(BuildContext context) => Visibility(
        visible: order.status == 'pending_payment',
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            _makeShowDialog(context);
          },
          icon: Image.asset(
            LocaleImages().imagePix,
            height: 18,
          ),
          label: Text(
            Translation.of(context).qrCodeWithPix,
          ),
        ),
      );

  Future<dynamic> _makeShowDialog(BuildContext context) => showDialog(
        context: context,
        builder: (_) {
          return PaymentDialog(
            order: order,
          );
        },
      );
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    final random = Random();

    late String item = orderItem
        .item.itemName![random.nextInt(orderItem.item.itemName!.length)];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity}'
            '${orderItem.item.unit} ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(item),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
