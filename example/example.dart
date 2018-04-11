import 'dart:async';

import 'package:hots_dog_api/hots_dog_api.dart';

main() async {
  try {
    BuildWinRates buildWinRates = await getBuildWinRates('2.30.0', 'Rehgar');
    print(buildWinRates);

  } catch (e) {
    print(e);
  }

  try {
    WinRates winRates = await getWinRates('2.30.0');
    print(winRates);

  } catch (e) {
    print(e);
  }

  try {
    GameInfo gameInfo = await getGameInfo();
    print(gameInfo);
  } catch (e) {
    print(e);
  }
}