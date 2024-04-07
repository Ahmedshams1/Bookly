import 'package:bookly/Features/home/data/presentation/views/widgets/custom_AppBar.dart';
import 'package:bookly/Features/home/data/presentation/views/widgets/custom_list_view.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        CustomListViewItem(),
      ],
    );
  }
}
