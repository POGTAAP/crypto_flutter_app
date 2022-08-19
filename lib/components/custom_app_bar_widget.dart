import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 160.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.ellipsis,
        ),
        background: Image.asset('assets/images/header.jpg', fit: BoxFit.cover),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
