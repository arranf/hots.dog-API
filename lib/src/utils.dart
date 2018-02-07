String mapHeroName(String heroName) {
  Map<String, String> heroNameMap = {
    'Lucio': 'Lúcio',
    'Lúcio' : 'Lucio'
  };

  if (heroNameMap.containsKey(heroName)){
    return heroNameMap[heroName];
  }
  return heroName;
}