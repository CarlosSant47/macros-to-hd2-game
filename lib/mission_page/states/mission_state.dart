class MissionState {
  MissionState._();

  static final MissionState _instance = MissionState._();

  static MissionState get instance => _instance;

  bool useGridLayout = true;

  final String gridIconPath = "assets/images/grid_icon.webp";
  final String listIconPath = "assets/images/list_icon.webp";
}
