const apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://127.0.0.1:5000',
);

Uri apiUri(String path) => Uri.parse('$apiBaseUrl$path');
