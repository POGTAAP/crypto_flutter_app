import 'package:crypto_flutter_app/models/data_model.dart';
import 'package:flutter/material.dart';

import 'coin_logo_widget.dart';

class FavoriteItem extends StatelessWidget {
  final DataModel coin;
  final GestureTapCallback? onTap;

  const FavoriteItem({Key? key, required this.coin, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CoinLogoWidget(coin: coin),
            GestureDetector(
              child: const Icon(Icons.close),
              onTap: onTap,
            ),
          ],
        ));
  }
}