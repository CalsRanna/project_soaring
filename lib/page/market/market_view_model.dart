import 'package:get_it/get_it.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/page/market/sell_dialog.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/util/preset_util.dart';

class MarketViewModel {
  void sellSingleItem(Item item) {
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    homeViewModel.removeItems([item.copyWith(count: 1)]);
    DialogUtil.instance.dismiss();
    var sellCount = item.rank * 7;
    if (sellCount > 0) {
      var currency = PresetUtil.firstCurrency.copyWith(count: sellCount);
      homeViewModel.addItems([currency]);
      DialogUtil.instance.show(SellDialog(title: '出售结果', currency: [currency]));
    }
  }

  void sellAllItem(Item item) {
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    homeViewModel.removeItems([item]);
    DialogUtil.instance.dismiss();
    var sellCount = item.rank * 7 * item.count;
    if (sellCount > 0) {
      var currency = PresetUtil.firstCurrency.copyWith(count: sellCount);
      homeViewModel.addItems([currency]);
      DialogUtil.instance.show(SellDialog(title: '出售结果', currency: [currency]));
    }
  }
}
