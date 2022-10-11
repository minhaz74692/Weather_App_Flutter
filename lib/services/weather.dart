
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/utilities/api_kye.dart';
import 'location.dart';
import 'networking.dart';

ApiKey apiSecret = ApiKey();
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather (cityName) async{
    NetworkHandle networkData = NetworkHandle(url:'$openWeatherMapUrl?q=$cityName&appid=${apiSecret.apiSectreKey}&units=metric');
    var weatherData =await networkData.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async{
    LocationHandle location = LocationHandle();
    await location.getCurrentLocation();
    NetworkHandle networkData = NetworkHandle(url: '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=${apiSecret.apiSectreKey}&units=metric');
    var weatherData =await networkData.getData();
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
