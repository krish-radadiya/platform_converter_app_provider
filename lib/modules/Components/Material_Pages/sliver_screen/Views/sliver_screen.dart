import 'package:flutter/material.dart';

class Sliver_screen extends StatelessWidget {
  Sliver_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            collapsedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground,
              ],
              title: Text(
                'sliver appbar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }
}
