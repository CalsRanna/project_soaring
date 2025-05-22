import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/page/market/market_inventory_view.dart';
import 'package:project_soaring/page/market/market_view_model.dart';
import 'package:project_soaring/widget/item_slot.dart';
import 'package:signals/signals_flutter.dart';

@RoutePage()
class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final homeViewModel = GetIt.instance.get<HomeViewModel>();
  final marketViewModel = GetIt.instance.get<MarketViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('坊市')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ItemSlot();
                  },
                  itemCount: 10,
                ),
              ),
              Expanded(
                child: Watch(
                  (_) => MarketInventoryView(
                    items: homeViewModel.items.value,
                    onSell: marketViewModel.sellSingleItem,
                    onSellAll: marketViewModel.sellAllItem,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
