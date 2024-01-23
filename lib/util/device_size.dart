import 'package:flutter/widgets.dart';

class DeviceSize {
  DeviceSize(BuildContext context) : _context = context;

  final BuildContext _context;
  late double _width;
  late double _height;
  late double _aspectRatio;

  void init() {
    _width = MediaQuery.of(_context).size.width;
    _height = MediaQuery.of(_context).size.height;
    _aspectRatio = MediaQuery.of(_context).size.width /
        MediaQuery.of(_context).size.height;
  }

  double get width => _width;
  double get height => _height;
  double get aspectRatio => _aspectRatio;
}
