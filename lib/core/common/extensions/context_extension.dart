import 'package:flutter/material.dart';
import 'package:w_package/core/common/enums/layout_types.dart';

extension GetTheme on BuildContext{
  Size get _size => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;


  bool get isMobile => _size.shortestSide < 600; 
  bool get isTablet => _size.shortestSide >= 600 && _size.shortestSide < 900;
  bool get isDesktop => _size.shortestSide >= 900;

  LayoutTypes get layout => isMobile ? LayoutTypes.mobile : isTablet ? LayoutTypes.tablet : LayoutTypes.desktop;


  double get scale {
    if (isDesktop) {
      return 1.40;
    } else if (isTablet) {
      return 1.25;
    } else {
      return 1;
    } 
  }
}