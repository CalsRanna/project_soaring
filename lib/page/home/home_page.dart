import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/page/home/home_bottom_bar_widget.dart';
import 'package:project_soaring/page/home/home_character_view.dart';
import 'package:project_soaring/page/home/home_guild_view.dart';
import 'package:project_soaring/page/home/home_house_view.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/page/home/home_map_view.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final viewModel = GetIt.instance.get<HomeViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.initSignal();
    viewModel.initTabController(this);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: viewModel.pageController,
        onPageChanged: viewModel.selectIndex,
        children: [
          Watch(
            (_) => HomeCharacterView(
              character: viewModel.character.value,
              score: viewModel.score.value,
              firstCurrency: viewModel.firstCurrency.value,
              secondCurrency: viewModel.secondaryCurrency.value,
              thirdCurrency: viewModel.thirdCurrency.value,
              fourthCurrency: viewModel.fourthCurrency.value,
              items: viewModel.items.value,
              equipments: viewModel.equipments.value,
              onPutOn: viewModel.putOnItem,
              onTakeOff: viewModel.takeOffItem,
            ),
          ),
          HomeHouseView(),
          HomeGuildView(),
          HomeMapView(onTap: (index) => viewModel.enterMap(context, index)),
          Container(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Watch<HomeBottomBar> _buildBottomBar() {
    var items =
        Strings.bottomBarItems.map((e) => HomeBottomBarItem(label: e)).toList();
    return Watch(
      (context) => HomeBottomBar(
        items: items,
        onItemSelected: viewModel.selectIndex,
        selectedIndex: viewModel.selectedIndex.value,
      ),
    );
  }
}
