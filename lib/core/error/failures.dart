abstract class Failure {
  String get errorMessage;
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message = SERVER_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure({this.message = EMPTY_CACHE_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class OfflineFailure extends Failure {
  final String message;
  OfflineFailure({this.message = OFFLINE_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class ConnectionFailure extends Failure {
  final String message;
  ConnectionFailure({this.message = CONNECTION_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class TimeoutFailure extends Failure {
  final String message;
  TimeoutFailure({this.message = TIMEOUT_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class MultiRequestFailure extends Failure {
  final String message;
  MultiRequestFailure({this.message = MULTI_REQUEST_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}

class GeneralFailure extends Failure {
  final String message;
  GeneralFailure({this.message = GENERAL_FAILURE_MESSAGE});

  @override
  String get errorMessage => message;
}


const String SERVER_FAILURE_MESSAGE = 'Internal Server Failure.';
const String EMPTY_CACHE_FAILURE_MESSAGE = 'Uh-oh! Something went wrong. Please retry.';
const String OFFLINE_FAILURE_MESSAGE = 'No internet connection.';
const String CONNECTION_FAILURE_MESSAGE = 'App experiencing internet outage.';
const String TIMEOUT_FAILURE_MESSAGE = 'Internet is slow. Need faster connection.';
const String MULTI_REQUEST_FAILURE_MESSAGE = 'Please retry after 45 seconds.';
const String GENERAL_FAILURE_MESSAGE = 'Uh-oh! Something went wrong. Please retry.';
const String UNEXPECTED_ERROR = 'Unexpected error occurred.';