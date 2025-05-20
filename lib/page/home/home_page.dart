import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/page/home/home_bottom_bar_widget.dart';
import 'package:project_soaring/page/home/home_character_view.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/page/home/home_world_map_view.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = GetIt.instance.get<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Watch(
        (context) => PageView(
          controller: viewModel.pageController,
          onPageChanged: viewModel.selectIndex,
          children: [
            HomeCharacterView(),
            Container(),
            Container(),
            HomeMapView(onTap: (index) => viewModel.enterMap(context, index)),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: Watch(
        (context) => HomeBottomBar(
          items: [
            HomeBottomBarItem(label: 'C'),
            HomeBottomBarItem(label: 'H'),
            HomeBottomBarItem(label: 'G'),
            HomeBottomBarItem(label: 'M'),
            HomeBottomBarItem(label: 'S'),
          ],
          onItemSelected: viewModel.selectIndex,
          selectedIndex: viewModel.selectedIndex.value,
        ),
      ),
    );
  }
}
