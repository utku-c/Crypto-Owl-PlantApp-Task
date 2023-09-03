// ignore_for_file: constant_identifier_names

enum SvgEnum {
  icon_window,
  icon_sun,
  icon_raindrop,
  icon_delete,
  icon_arrow,
  home_profile_icon,
  home_home_icon,
  home_flowerpot_icon,
  app_search_icon,
  app_raindrop_icon,
}

extension SvgPathExtension on SvgEnum {
  String get svgPath => "assets/svg/$name.svg";
}
