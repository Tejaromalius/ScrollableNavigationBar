# ScrollableNavigationBar

![Pub Version](https://img.shields.io/pub/v/scrollable_navigation_bar?style=flat&logo=dart&color=green)

This widget provides a scrollable version of Flutter's built-in `NavigationBar`, allowing users to navigate through destinations by swiping horizontally.

## Key Features:

- **Scrollable:** Enables horizontal scrolling to access navigation items.
- **Customizable:** Leverages all existing properties from the `NavigationBar` widget for customization (see [`NavigationBar`](https://api.flutter.dev/flutter/material/NavigationBar-class.html) documentation for details).

## Usage:

1. **Import the widget:**

   ```dart
   import 'package:scrollable_navigation_bar/scrollable_navigation_bar.dart';
   ```

2. **Create an instance:**

   ```dart
   ScrollableNavigationBar(
     destinations: [
       NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
       NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
       // ... more destinations
     ],
     onDestinationSelected: (int index) {
       // Handle navigation logic here
     },
     // Other customization options (refer to NavigationBar documentation)
   ),
   ```

## Example Usage:

```dart
import 'package:flutter/material.dart';
import 'package:scrollable_navigation_bar/scrollable_navigation_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  List<Widget> _screens = [
    Container(child: Center(child: Text('Home'))),
    Container(child: Center(child: Text('Search'))),
    Container(child: Center(child: Text('Add'))),
    Container(child: Center(child: Text('Notifications'))),
  ];

  List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    NavigationDestination(
      icon: Icon(Icons.add),
      label: 'Add',
    ),
    NavigationDestination(
      icon: Icon(Icons.notifications),
      label: 'Notifications',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: ScrollableNavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) =>
              setState(() => selectedIndex = index),
          destinations: _destinations),
    );
  }
}
```

## Contribution

Contributions are welcome! If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/your_repository). I appreciate your contributions to make **ScrollableNavigationBar** even better!
