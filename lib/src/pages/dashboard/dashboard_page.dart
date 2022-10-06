// ignore_for_file: prefer_single_quotes

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/controller/cart_controller.dart';
import '../product/controller/product_controller.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final productController = Get.put(ProductController());

  final CartController cartController = Get.find();

  final double valor = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico de vendas"),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return Column(
          children: [
            (controller.count2 == 0)
                ? Center(
                    child: Text('Nenhum valor encontardo'),
                  )
                : Expanded(
                    child: PieChart(
                      PieChartData(
                          centerSpaceRadius: 100,
                          centerSpaceColor: Colors.white,
                          borderData: FlBorderData(show: false),
                          sections: [
                            PieChartSectionData(
                                value: controller.totalPrice,
                                color: Colors.blue),
                            PieChartSectionData(
                                value: controller.count.toDouble(),
                                color: Colors.orange),
                          ]),
                    ),
                  ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Quantidades: ${controller.count.toDouble()}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Valor Total: ${controller.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
