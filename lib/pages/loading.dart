import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void time() async
  {
    world_time now= world_time(location: 'India', flag: 'germany.png', url: 'Asia/Kolkata');
    await now.getData();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location':now.location,
      'flag':now.flag,
      'time':now.time,
      'isDay':now.isDay
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 300,),
          Text(
              'Loading',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SpinKitThreeBounce(
            color: Colors.green,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}
