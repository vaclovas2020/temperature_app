class Temperature{
  final String city;
  final int temperature;
  final String scale;
  Temperature({required this.city, required this.temperature, required this.scale});
  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
        city: json['city'],
        temperature: json['temperature'],
        scale: json['scale']
    );
  }
}