import 'package:flutter/material.dart';

class ScrollableNavigationBar extends StatefulWidget {
  late final NavigationBar navigationBar;

  /// Creates a scrollable navigation bar.
  ///
  /// All parameters match those in [NavigationBar].
  /// For their documentation, see [NavigationBar].
  /// To have direct access to the [NavigationBar] instance, use the [navigationBar] property.
  ScrollableNavigationBar({
    super.key,
    Duration? animationDuration,
    int selectedIndex = 0,
    required List<Widget> destinations,
    void Function(int)? onDestinationSelected,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    Color? indicatorColor,
    ShapeBorder? indicatorShape,
    double? height,
    NavigationDestinationLabelBehavior? labelBehavior,
    MaterialStateProperty<Color?>? overlayColor,
  }) : navigationBar = NavigationBar(
          key: key,
          animationDuration: animationDuration,
          selectedIndex: selectedIndex,
          destinations: destinations,
          onDestinationSelected: onDestinationSelected,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          indicatorColor: indicatorColor,
          indicatorShape: indicatorShape,
          height: height,
          labelBehavior: labelBehavior,
          overlayColor: overlayColor,
        );

  @override
  State<ScrollableNavigationBar> createState() =>
      _ScrollableNavigationBarState();
}

class _ScrollableNavigationBarState extends State<ScrollableNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          widget.navigationBar.onDestinationSelected!(
              (widget.navigationBar.selectedIndex + 1) %
                  widget.navigationBar.destinations.length);
        } else {
          widget.navigationBar.onDestinationSelected!(
              (widget.navigationBar.selectedIndex - 1) %
                  widget.navigationBar.destinations.length);
        }
      },
      child: widget.navigationBar,
    );
  }
}
