import 'package:flutter/material.dart';
import 'package:lasting_age/ageInfo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> ageInfoMap = {};
  AgeInfo dob;
  List<String> keys;
  List<String> values;

  FlutterToast flutterToast;

  @override
  void initState() {
    super.initState();
    flutterToast = FlutterToast(context);
  }

  _showToast(String key) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.date_range),
          SizedBox(
            width: 12.0,
          ),
          Text(key + " pressed"),
        ],
      ),
    );

    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        title: Text(
          'LastingAge',
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            color: Colors.blueGrey[800],
            height: size.height * 0.25,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Enter Your Birth Date',
                    style: TextStyle(
                      color: Colors.amber[200],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                    top: 5.0,
                  ),
                  child: Text(
                    'See how old you are...',
                    style: TextStyle(
                      color: Colors.blueGrey[400],
                      fontSize: 12.0,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2021),
                    ).then((date) {
                      setState(() {
                        dob = new AgeInfo(date);
                        ageInfoMap['Years'] = dob.years;
                        ageInfoMap['Weeks'] = dob.weeks;
                        ageInfoMap['Days'] = dob.days;
                        ageInfoMap['Hours'] = dob.hours;
                        ageInfoMap['Minutes'] = dob.minutes;
                        ageInfoMap['Seconds'] = dob.seconds;

                        keys = ageInfoMap.keys.toList();
                        values = ageInfoMap.values.toList();
                      });
                    });
                  },
                  minWidth: size.width * 0.40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  elevation: 10.0,
                  color: Colors.lightBlueAccent[200],
                  splashColor: Colors.blueAccent[100],
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Colors.blueGrey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    dob == null ? '' : dob.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              width: double.infinity,
              child: dob == null
                  ? Text('')
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      itemExtent: 60,
                      itemCount: ageInfoMap.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Card(
                            shadowColor: Colors.blueGrey[900],
                            elevation: 10.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 1.0,
                              horizontal: 20.0,
                            ),
                            color: Colors.blueGrey[800],
                            child: ListTile(
                              // dense: true,
                              onTap: () {
                                _showToast(keys.elementAt(index));
                              },
                              title: Text(
                                keys.elementAt(index) + ": ",
                                style: TextStyle(
                                  color: Colors.blueGrey[50],
                                ),
                              ),
                              trailing: Text(
                                values.elementAt(index) + "",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
