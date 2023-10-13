import 'package:flutter/widgets.dart';

class ContextProvider<T> extends InheritedWidget {
  const ContextProvider({
    super.key,
    required this.value,
    required super.child,
  });
  
  final T value;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static T of<T>(BuildContext context) {
    final widget = context.getInheritedWidgetOfExactType<ContextProvider<T>>();
    assert(widget != null, 'Invalid context for ContextProvider<T>');
    return widget!.value;
  }
}
