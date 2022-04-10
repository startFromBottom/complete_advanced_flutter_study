enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
}

class ReponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const NO_CONTENT = 201; // success with no content
  static const BAD_REQUEST = 400; // failure, api rejected the request
  static const FORBIDDEN = 403; // failure, api rejected the request
  static const UNAUTHORIZED = 401; // failure, user is not authorized
  static const NOT_FOUND = 404; // failure, api url is not correct and not found
  static const INTERNAL_SERVER_ERROR =
      500; // failure, crash happend in server side

  // local status code
  static const UNKNOWN = -1;
  static const CONNECT_TIMEOUT = -2; //
  static const CANCEL = -3;
  static const RECEIVE_TIMEOUT = -4;
  static const SEND_TIMEOUT = -5;
  static const CACHE_ERROR = -6;
  static const NO_INTERNET_CONNECTION = -7;
}
