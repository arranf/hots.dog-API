import 'dart:async';

import 'package:hots_dog_api/hots_dog_api.dart';

main() async {
  try {
    BuildWinRates winRates = await getBuildWinRates('2.29.9.61552', 'Rehgar');
    print(winRates);

  } catch (e) {
    print(e);
  }
}