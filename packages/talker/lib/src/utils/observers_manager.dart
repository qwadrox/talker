import 'package:talker/src/models/talker_data_interface.dart';
import 'package:talker/src/models/talker_error.dart';
import 'package:talker/src/models/talker_exception.dart';
import 'package:talker/src/observer.dart';

/// Manager to wrap all observers
class TalkerObserversManager {
  TalkerObserversManager(this.observers);
  final List<TalkerObserver> observers;

  /// Called when [Talker] handle an [TalkerError]
  void onError(TalkerError talkerError) {
    for (final o in observers) {
      o.onError.call(talkerError);
    }
  }

  /// Called when [Talker] handle an [TalkerException]
  void onException(TalkerException talkerException) {
    for (final o in observers) {
      o.onException.call(talkerException);
    }
  }

  /// Called when [Talker] handle an [TalkerDataInterface] log
  void onLog(TalkerDataInterface log) {
    for (final o in observers) {
      o.onLog.call(log);
    }
  }
}