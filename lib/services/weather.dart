import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '8ebb09c594c866f297d55b16bfd24d72';
const openweatherurl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getcityweather(String city) async  {
    var url='$openweatherurl?q=$city&appid=$apikey&units=metric';
    NetworkHelper nh = NetworkHelper(url);

    var wdata = await nh.getdata();
    return wdata;
  }

  Future<dynamic> getlocweather() async{
    Location ob = Location();
    await ob.getcurrentlocation();
    NetworkHelper nh = NetworkHelper('$openweatherurl?lat=${ob.latitude}&lon=${ob.longitude}&appid=$apikey&units=metric');

    var wdata = await nh.getdata();
    return wdata;
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
