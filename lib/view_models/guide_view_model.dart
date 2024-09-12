import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_guide/models/guide.dart';
import 'package:travel_guide/repositories/guide_repository.dart';

class GuideViewModel extends ChangeNotifier {
  final GuideRepository guideRepository;

  List<Guide> _guides = [];
  List<Guide> get guides => _guides;

  GuideViewModel(this.guideRepository) {
    fetchGuides();
  }

  void fetchGuides() {
    guideRepository.getGuides().listen((guideList) {
      _guides = guideList;
      notifyListeners();
    });
  }

  Future<String> addGuide(Guide guide) async {
    return await guideRepository.addGuide(guide);
  }

  Future<void> deleteGuide(String guideId) async {
    return await guideRepository.deleteGuide(guideId);
  }
}
