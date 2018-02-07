import 'dart:async';

import 'package:hots_dog_api/hots_dog_api.dart';

main() async {
  try {
    BuildWinRates buildWinRates = await getBuildWinRates('2.29.9.61552', 'Rehgar');
    print(buildWinRates);

  } catch (e) {
    print(e);
  }

  try {
    WinRates winRates = await getWinRates('2.29.9.61552');
    print(winRates);

  } catch (e) {
    print(e);
  }
}