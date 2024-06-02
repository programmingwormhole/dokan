class RequestHeader {
  static Map<String, String> jsonType () => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  static Map<String, String> urlEncoded () => {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };
}
