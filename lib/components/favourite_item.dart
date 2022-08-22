import 'package:crypto_flutter_app/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'coin_logo_widget.dart';

class FavouriteItem extends StatelessWidget {
  final DataModel coin;
  final GestureTapCallback? onItemTap;
  final GestureTapCallback? onRowTap;

  const FavouriteItem({Key? key, required this.coin, this.onItemTap, this.onRowTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, 0.6),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CoinLogoWidget(coin: coin),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: SizedBox(height: 32.0, width: 32.0, child: SvgPicture.asset('assets/icons/bin.svg', color: Colors.yellow)),
                onTap: onItemTap,
              ),
            ),
          ],
        ),
        onTap: onRowTap,
      ),
    );
  }
}
