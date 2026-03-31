import '../models/relic_element.dart';

class RelicCollection {
  final String id;
  final String name;
  final List<RelicElement> elements;

  RelicCollection({
    required this.id,
    required this.name,
    required this.elements,
  });
}

class RelicCatalog {
  static final RelicElement defaultSeal = RelicElement(
    id: 'seal_of_lucifer',
    name: 'Seal of Lucifer',
    type: RelicType.seal,
    category: SealCategory.ritual,
    assetPath: 'assets/relics/seal_lucifer.svg',
    description: 'The master seal of the underworld.',
  );
  
  static final RelicElement standardSignature = RelicElement(
    id: 'sig_placeholder',
    name: 'Signee Placeholder',
    type: RelicType.signature,
    category: SealCategory.signature,
    assetPath: 'assets/relics/sig_placeholder.svg',
    description: 'A placeholder for your infernal mark.',
  );

  static final RelicCollection essentialRunes = RelicCollection(
    id: 'essential_runes',
    name: 'Essential Runes & Signatures',
    elements: [defaultSeal, standardSignature],
  );

  static final List<RelicCollection> collections = [essentialRunes];
}
