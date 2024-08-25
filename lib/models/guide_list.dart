class GuideList {
  String listName;
  String itemName;
  String description;
  String? iconUrl;
  String? backgroundUrl;

  GuideList({
    required this.listName,
    required this.itemName,
    required this.description,
    this.iconUrl,
    this.backgroundUrl,
  });

  factory GuideList.fromMap(Map<String, dynamic> listMap, String documentId) {
    return GuideList(
        listName: listMap['list_name'],
        itemName: listMap['item_name'],
        description: listMap['desciprtion'],
        iconUrl: listMap['icon_url'] ?? '',
        backgroundUrl: listMap['background_url'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'list_name': listName,
      'item_name': itemName,
      'description': description,
      'icon_url': iconUrl,
      'background_url': backgroundUrl,
    };
  }
}
