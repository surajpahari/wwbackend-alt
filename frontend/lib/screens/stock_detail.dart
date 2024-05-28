import 'package:flutter/material.dart';
import 'package:walletwise/models/stock.dart';
import 'package:walletwise/theme/theme_constant.dart';
import 'package:walletwise/utils/appbar/walletWiseBar.dart';

class StockDetail extends StatelessWidget {
  const StockDetail({required this.stock, super.key});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: myTheme,
        child: Scaffold(
          appBar: WalletWiseBar.normalPageBar(stock.name),
        ));
  }
}