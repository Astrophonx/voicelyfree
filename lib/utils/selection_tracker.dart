import 'dart:collection';

class SelectionTracker<T> {
  final Set<T> _set = Set<T>();

  Set<Function> _listeners = Set<Function>();

  select(T item) {
    _set.add(item);
    _listeners.forEach((element) {
      element();
    });
  }

  bool unselect(T item) {
    bool isRemoved = _set.remove(item);
    _listeners.forEach((element) {
      element();
    });
    return isRemoved;
  }

  Set<T> getSelectedItems() {
    return UnmodifiableSetView(_set);
  }

  bool isSelected(T item) {
    return _set.contains(item);
  }

  setSelected(T item, bool toSelect) {
    toSelect ? select(item) : unselect(item);
  }

  addListener(Function listener) {
    _listeners.add(listener);
  }

  bool removeListener(Function listener) {
    return _listeners.remove(listener);
  }

  clearListeners() {
    _listeners.clear();
  }
}
