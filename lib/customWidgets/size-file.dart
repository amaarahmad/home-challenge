//
// import 'dart:js';
//
// import 'package:flutter/material.dart';
//
// Size size = View.of(context as BuildContext).physicalSize /
//     View.of(context as BuildContext).devicePixelRatio;
// const num DESIGN_WIDTH = 375;
// const num DESIGN_HEIGHT = 820; // height of given design
// const num DESIGN_STATUS_BAR = 30;
//
// ///This method is used to get device viewport width.
// get width {
//   return size.width;
// }
//
// ///This method is used to get device viewport height.
// get height {
//   num statusBar =
//       MediaQueryData.fromView(View.of(context as BuildContext)).viewPadding.top;
//   num screenHeight = size.height - statusBar;
//   return screenHeight;
// }
//
// ///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
// double setHorizontalSize(double px) {
//   return (px * width) / DESIGN_WIDTH;
// }
//
// ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
// double setVerticalSize(double px) {
//   return (px * height) / (DESIGN_HEIGHT - DESIGN_STATUS_BAR);
// }
//
// ///This method is used to set smallest px in image height and width
// double getSize(double px) {
//   var height = setVerticalSize(px);
//   var width = setHorizontalSize(px);
//   if (height < width) {
//     return height.toInt().toDouble();
//   } else {
//     return width.toInt().toDouble();
//   }
// }
//
// ///This method is used to set text font size according to Viewport
// double getFontSize(double px) {
//   return getSize(px);
// }
//
// ///This method is used to set padding responsively
// EdgeInsetsGeometry getPadding({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   return getMarginOrPadding(
//     all: all,
//     left: left,
//     top: top,
//     right: right,
//     bottom: bottom,
//   );
// }
//
// ///This method is used to set margin responsively
// EdgeInsetsGeometry getMargin({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   return getMarginOrPadding(
//     all: all,
//     left: left,
//     top: top,
//     right: right,
//     bottom: bottom,
//   );
// }
//
// ///This method is used to set margin responsively
// EdgeInsetsGeometry getMarginOrPadding({
//   double? all,
//   double? left,
//   double? top,
//   double? right,
//   double? bottom,
// }) {
//   if (all != null) {
//     left = all;
//     top = all;
//     right = all;
//     bottom = all;
//   }
//   return EdgeInsets.only(
//     left: setHorizontalSize(
//       left ?? 0,
//     ),
//     top: setVerticalSize(
//       top ?? 0,
//     ),
//     right: setHorizontalSize(
//       right ?? 0,
//     ),
//     bottom: setVerticalSize(
//       bottom ?? 0,
//     ),
//   );
// }