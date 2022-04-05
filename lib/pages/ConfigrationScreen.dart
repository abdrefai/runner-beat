import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
class ConfigrationScreen extends StatefulWidget {

  final String username;
  final String userweight;
  final String userheight;
  final String userElength;
  final String usermetrics;
  final String userBirthdate;
  final bool GpsState;
  final bool fileAccessState;
  ConfigrationScreen({required this.username,required this.fileAccessState,
    required this.GpsState, required this.userBirthdate, required this.userElength,
    required this.userheight, required this.usermetrics , required this.userweight
  });

  @override
  _ConfigrationScreenState createState() => _ConfigrationScreenState();
}

class _ConfigrationScreenState extends State<ConfigrationScreen> {



  String Textname='';
  String weight='';
  String height='';
  String Elength='';
  String metrics='';
  String birthdate='';

  late SharedPreferences preferences;
  bool gps=true;
  bool fileaccess=true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      Textname = widget.username;
      weight = widget.userweight;
      height = widget.userheight;
      Elength = widget.userElength;
      metrics = widget.usermetrics;
      birthdate = widget.userBirthdate;
      gps = widget.GpsState;
      fileaccess = widget.fileAccessState;
    init();
  }
  Future init() async {
    preferences = await SharedPreferences.getInstance();
    print( preferences.getString("name"));

    Textname = preferences.getString("name")??'';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.grey,
            size: 35,
          ),
        ),
        title: Text(
          'Configration',
        ),
        backgroundColor: Color.fromRGBO(39, 36, 53, 1),

        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(child:
      Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1 ,
        color: Color.fromRGBO(39, 36, 53, 1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("profile :",style:TextStyle(color: Colors.white,fontSize: 25) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                initialValue: Textname,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Your Name',
                  labelText: 'Name',
                  labelStyle:  TextStyle(color: Colors.white),
                ),
                onChanged: (name) => setState(() => this.Textname = name),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    child: TextFormField(
                      initialValue: birthdate,
                      keyboardType: TextInputType.datetime,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Your Birthday',
                        labelText: 'Birthday',
                        labelStyle:  TextStyle(color: Colors.white),
                      ),
                      onChanged: (name) => setState(() => this.birthdate = name),
                    ) ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: TextFormField(
                      initialValue: height,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                        ),

                        labelText: 'Height',
                        labelStyle:  TextStyle(color: Colors.white),
                      ),
                      onChanged: (name) => setState(() => this.height = name),
                    ) ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.2  ,
                    child: TextFormField(
                      initialValue: weight,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                        ),

                        labelText: 'Weight',
                        labelStyle:  TextStyle(color: Colors.white),
                      ),
                      onChanged: (name) => setState(() => this.weight = name),
                    ) ,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextFormField(
                      initialValue: Elength,
                      keyboardType: TextInputType.datetime,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Estimated Length',
                        labelText: 'Length',
                        labelStyle:  TextStyle(color: Colors.white),
                      ),
                      onChanged: (name) => setState(() => this.Elength = name),
                    ) ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: TextFormField(
                      initialValue: metrics,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromRGBO(3, 152, 158, 1),width: 2),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Km',
                        labelText: 'Metrics',
                        labelStyle:  TextStyle(color: Colors.white),
                      ),
                      onChanged: (name) => setState(() => this.metrics = name),
                    ) ,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Text("Setting :",style:TextStyle(color: Colors.white,fontSize: 25) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text('GPS',style:TextStyle(color: Colors.white,fontSize: 22) ,),
                  Container(
                    child: CupertinoSwitch(
                      trackColor: Colors.grey,
                        activeColor: Color.fromRGBO(3, 152, 158, 1),
                        value:gps , onChanged: (newvalue){
                        if(gps == true){
                          setState(() {
                            gps = false;
                          });
                               }
                      else if (gps ==false){
                          setState(() {
                            gps = true;
                          });
                        }
                      }
                    ),
                  ),
                  Text('File Access',style:TextStyle(color: Colors.white,fontSize: 22) ,),
                  Container(
                    child: CupertinoSwitch(
                        trackColor: Colors.grey,
                        activeColor: Color.fromRGBO(3, 152, 158, 1),
                        value:fileaccess , onChanged: (newvalue){
                      if(fileaccess == true){
                        setState(() {
                          fileaccess = false;
                        });
                      }
                      else if (fileaccess ==false){
                        setState(() {
                          fileaccess = true;
                        });
                      }
                    }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 150,
                  child: buildButton()
              ),
            ),

          ],
        ),
      )),
    );
  }



 Widget buildButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(52),
        primary: Color.fromRGBO(3, 152, 158, 1),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        'Save',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onPressed:() async {

        preferences.setString('name', Textname);
        preferences.setString('height',height );
        preferences.setString('weight', weight);
        preferences.setString('Elength', Elength);
        preferences.setString('metrics', metrics);
        preferences.setString('birthdate', birthdate);
        preferences.setBool('gps', gps);
        preferences.setBool('fileaccess', fileaccess);

        print(preferences.getString('name'));
      });


}
