import 'package:game/constant/functions.dart';
import 'package:game/constant/players.dart';
import 'package:game/helper/helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String lastMove = Players.noPlayer;
  final metrixCount = 3;
  final double boxSize = 93.0;
  late List<List<String>> metrixBox;
  @override
  void onInit() {
    super.onInit();
    setMetrixBox();
  }

  setMetrixBox() {
    metrixBox = List.generate(metrixCount,
        (index) => List.generate(metrixCount, (index) => Players.noPlayer));
    update(["game"]);
    return metrixBox;
  }

  selectButton(
    String value,
    int x,
    int y,
    List<List<String>> metrixBox,
    int metrixCount,
  ) {
    if (value == Players.noPlayer) {
      final newValue = lastMove == Players.O ? Players.X : Players.O;

      lastMove = newValue;
      metrixBox[x][y] = newValue;
      update(["game"]);
      if (Helper.isWinner(x, y, metrixBox, metrixCount)) {
        dailogBox(
            "Player Won", "$lastMove won the game...", metrixBox, metrixCount);
      } else if (metrixBox.every((element) =>
          element.every((element) => element != Players.noPlayer))) {
        dailogBox("Game Over", "Press restart...", metrixBox, metrixCount);
      }
    }
  }
}
