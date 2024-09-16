class GuideListItem {
  String? listItemId;
  String listId;
  String name;
  String description;

  GuideListItem({
    this.listItemId,
    required this.listId,
    required this.name,
    required this.description,
  });

  factory GuideListItem.fromMap(
      Map<String, dynamic> listItemMap, String documentId) {
    return GuideListItem(
        listItemId: documentId,
        listId: listItemMap['list_id'] ?? '',
        name: listItemMap['name'] ?? '',
        description: listItemMap['description'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'list_id': listId,
      'name': name,
      'description': description,
    };
  }
}
