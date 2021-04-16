import 'dart:async';

abstract class Event {
  final Object message;

  Event(this.message);
}

class AppEventBus {
  static final instance = AppEventBus._();

  AppEventBus._();

  final _eventBus = StreamController<Event>.broadcast();

  Stream<Event> get eventBus => _eventBus.stream;

  static emit(Event event) => instance._eventBus.add(event);

  void dispose() => _eventBus.close();
}
