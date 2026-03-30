import '../models/relic_element.dart';

class RelicCatalog {
  static final RelicElement defaultSeal = RelicElement(
    id: 'seal_of_lucifer',
    name: 'Seal of Lucifer',
    assetPath: 'assets/relics/seal_lucifer.svg',
  );
  
  static final RelicElement standardSignature = RelicElement(
    id: 'sig_placeholder',
    name: 'Signee Placeholder',
    assetPath: 'assets/relics/sig_placeholder.svg',
  );

  static final RelicCollection essentialRunes = RelicCollection(
    id: 'essential_runes',
    name: 'Essential Runes & Signatures',
    elements: [defaultSeal, standardSignature],
  );

  static final List<RelicCollection> collections = [essentialRunes];
}
