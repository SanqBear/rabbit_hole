import 'package:flutter/material.dart';

enum InplaceMode {
  portrait,
  landscape,
}

class SizeHandler {
  SizeHandler(BuildContext context) : _context = context;

  final BuildContext _context;

  // device width
  double get width => MediaQuery.of(_context).size.width;
  // device height
  double get height => MediaQuery.of(_context).size.height;

  EdgeInsets get _padding => MediaQuery.of(_context).viewPadding;
  
  // device height without safeArea
  double get height1 => height - _padding.top - _padding.bottom;
  // device height without statusbar
  double get height2 => height - _padding.top;
  // device height without statusbar and toolbar
  double get height3 => height - kToolbarHeight;

  InplaceMode get inplaceMode => width > height ? InplaceMode.landscape : InplaceMode.portrait;

  // get percentage Width from device size
  double getWidth(int percent) => width * percent / 100;
  // get percentage Height from device size
  double getHeight(int percent) => height * percent / 100;
  // get percentage Height without safeArea from device size
  double getHeight1(int percent) => height1 * percent / 100;
  // get percentage Height without statusbar from device size
  double getHeight2(int percent) => height2 * percent / 100;
  // get percentage Height without statusbar and toolbar from device size
  double getHeight3(int percent) => height3 * percent / 100;
}
