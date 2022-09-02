import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  List<world_time> locations = [
    world_time(url: 'Africa/Abidjan', location: 'Abidjan', flag: ''),
    world_time(url: 'Africa/Accra', location: 'Accra', flag: ''),
    world_time(url: 'Africa/Algiers', location: 'Algiers', flag: ''),
    world_time(url: 'Africa/Bissau', location: 'Bissau', flag: ''),
    world_time(url: 'Africa/Cairo', location: 'Cairo', flag: ''),
    world_time(url: 'Africa/Casablanca', location: 'Casablanca', flag: ''),
    world_time(url: 'Africa/Ceuta', location: 'Ceuta', flag: ''),
    world_time(url: 'Africa/El_Aaiun', location: 'El_Aaiun', flag: ''),
    world_time(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: ''),
    world_time(url: 'Africa/Juba', location: 'Juba', flag: ''),
    world_time(url: 'Africa/Khartoum', location: 'Khartoum', flag: ''),
    world_time(url: 'Africa/Lagos', location: 'Lagos', flag: ''),
    world_time(url: 'Africa/Maputo', location: 'Maputo', flag: ''),
    world_time(url: 'Africa/Monrovia', location: 'Monrovia', flag: ''),
    world_time(url: 'Africa/Nairobi', location: 'Nairobi', flag: ''),
    world_time(url: 'Africa/Ndjamena', location: 'Ndjamena', flag: ''),
    world_time(url: 'Africa/Sao_Tome', location: 'Sao_Tome', flag: ''),
    world_time(url: 'Africa/Tripoli', location: 'Tripoli', flag: ''),
    world_time(url: 'Africa/Tunis', location: 'Tunis', flag: ''),
    world_time(url: 'Africa/Windhoek', location: 'Windhoek', flag: ''),
    world_time(url: 'America/Adak', location: 'Adak', flag: ''),
    world_time(url: 'America/Anchorage', location: 'Anchorage', flag: ''),
    world_time(url: 'America/Araguaina', location: 'Araguaina', flag: ''),
    world_time(url: 'America/Argentina/Buenos_Aires', location: 'Argentina/Buenos_Aires', flag: ''),
    world_time(url: 'America/Argentina/Catamarca', location: 'Argentina/Catamarca', flag: ''),
    world_time(url: 'America/Argentina/Cordoba', location: 'Argentina/Cordoba', flag: ''),
    world_time(url: 'America/Argentina/Jujuy', location: 'Argentina/Jujuy', flag: ''),
    world_time(url: 'America/Argentina/La_Rioja', location: 'Argentina/La_Rioja', flag: ''),
    world_time(url: 'America/Argentina/Mendoza', location: 'Argentina/Mendoza', flag: ''),
    world_time(url: 'America/Argentina/Rio_Gallegos', location: 'Argentina/Rio_Gallegos', flag: ''),
    world_time(url: 'America/Argentina/Salta', location: 'Argentina/Salta', flag: ''),
    world_time(url: 'Asia/Tokyo', location: 'Tokyo', flag: ''),
    world_time(url: 'Asia/Kolkata', location: 'India', flag: ''),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHOOSE LOCATION'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(locations[index].location.toString()),
                onTap: () async {
                  await locations[index].getData();
                  Navigator.pushReplacementNamed(context,'/home', arguments: {
                    'location':locations[index].location,
                    'flag':locations[index].flag,
                    'time':locations[index].time,
                    'isDay':locations[index].isDay
                  });
                },
              ),
            );
          }
      ),
    );
  }
}
