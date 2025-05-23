import 'package:get_it/get_it.dart';
import 'package:project_soaring/constant/strings.dart';
import 'package:project_soaring/core/forge/forge_controller.dart';
import 'package:project_soaring/core/item/item.dart';
import 'package:project_soaring/page/home/home_view_model.dart';
import 'package:project_soaring/util/dialog_util.dart';
import 'package:project_soaring/page/forge/forge_bottom_sheet.dart';
import 'package:project_soaring/widget/loot_dialog.dart';
import 'package:signals/signals_flutter.dart';

class ForgeViewModel {
  final materials = signal<List<Item?>>(List.generate(9, (index) => null));

  Future<void> forge() async {
    DialogUtil.instance.loading();
    var item = await ForgeController().forge(materials.value);
    materials.value = List.generate(9, (index) => null);
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    homeViewModel.addItems([item]);
    homeViewModel.removeItems(materials.value.whereType<Item>().toList());
    DialogUtil.instance.dismiss();
    DialogUtil.instance.show(
      LootDialog(title: Strings.forgeDialogTitle, loots: [item]),
    );
  }

  void openBottomSheet(int index) {
    var homeViewModel = GetIt.instance.get<HomeViewModel>();
    var forgeBottomSheet = ForgeBottomSheet(
      items: homeViewModel.items.value,
      onPutIn: (item) => putIn(item, index),
    );
    DialogUtil.instance.openBottomSheet(forgeBottomSheet);
  }

  void putIn(Item item, int index) {
    DialogUtil.instance.dismiss(count: 2);
    var newMaterials = <Item?>[];
    for (int i = 0; i < 9; i++) {
      if (i == index) {
        newMaterials.add(item.copyWith(count: 1));
      } else {
        newMaterials.add(materials.value[i]?.copyWith(count: 1));
      }
    }
    materials.value = newMaterials;
  }
}
