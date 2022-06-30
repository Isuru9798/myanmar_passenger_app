class Config {
  static const BACKEND_URL = String.fromEnvironment('BACKEND_URL',
      defaultValue: 'https://myanmarbackend.herokuapp.com');
}
