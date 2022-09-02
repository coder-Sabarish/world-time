import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context)?.settings.arguments as Map;
    var bg=data['isDay']? 'day.jpg' : 'night.jpg';
    var bgcolor=data['isDay']? Colors.blue[700] : Colors.black;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgcolor,
          title: Text('WORLD TIME'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/${bg}'),
              fit: BoxFit.fill,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(66, 120, 80, 50),
            child: Column(
              children: [
                //Text('home page'),
                FlatButton.icon(
                    onPressed: () {Navigator.pushNamed(context, '/location');},
                    color: Colors.green,
                    icon: Icon(Icons.location_pin),
                    label: Text(
                        'choose Location',
                        style: TextStyle(
                          fontSize: 25.0,

                        ),
                    )
                ),
                SizedBox(height: 40),
                Container(
                  color: Colors.grey[400],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                              '${data['location']}',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                          ),
                        SizedBox(height: 30,),
                        Text(
                          '${data['time']}',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.black,
                          ),
                        )
                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
