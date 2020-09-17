import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '21e04c7bc0cb23560b63b0aa3b882814';
const String openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> cityWeather(String cityName) async {
    String url = '$openWeatherMap?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> updateWeather() async {
    Location cl = Location();
    await cl.getLocation();
    NetworkHelper nh = NetworkHelper(
        '$openWeatherMap?lat=${cl.latitude}&lon=${cl.longitude}&appid=$apiKey');
    var weatherData = await nh.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 28) {
      return 'Time for shorts and 👕';
    } else if (temp > 20) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
