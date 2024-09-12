import 'package:travel_guide/models/guide.dart';
import 'package:travel_guide/serivces/guide_service.dart';

class GuideRepository {
  final GuideService guideService;

  GuideRepository(this.guideService);

  Stream<List<Guide>> getGuides() {
    return guideService.getGuides();
  }

  Future<String> addGuide(Guide guide) {
    return guideService.addGuide(guide);
  }

  deleteGuide(String guideId) {
    return guideService.deleteGuide(guideId);
  }
}
