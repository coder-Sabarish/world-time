import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class world_time {
  String? location;
  String? url="";
  String time="";
  String? flag="";
  bool isDay=true;

  world_time({this.location, this.flag, this.url});

  Future<void> getData() async
  {

    try
    {
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      //print(response.body);
      Map s=jsonDecode(response.body);
      String datime=s['datetime'];
      String offset=s['utc_offset'].substring(1,3);
      DateTime now=DateTime.parse(datime);
      now=now.add(Duration(hours: int.parse(offset)));
      isDay=now.hour>6 && now.hour<19 ? true : false;
      time=DateFormat.jm().format(now);
    }
    catch(e)
    {
      time='cannot get time';
    }

  }
}