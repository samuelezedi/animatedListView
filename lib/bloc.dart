
import 'package:flutter/material.dart';

class Bloc extends ChangeNotifier {

  List<double> _width = [];
  List<double> _heights = [];

  getWidth(int index) {
    return _width[index];
  }

  getHeight(int index) {
    return _heights[index];
  }

  setWidth(double value){
    _width.add(value);
  }

  setHeight(double value){
    _heights.add(value);
  }

  changeWidth(int index, double value) {
    _width[index]=value;
    notifyListeners();
  }

  changeHeight(int index, double value) {
    _heights[index] = value;
    notifyListeners();
  }


}
