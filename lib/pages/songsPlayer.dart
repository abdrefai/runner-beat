import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
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
          color: Colors.white,
          size: 24,
        ),
      ),
      title: Text(
        'test ',

      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 30,))
      ],
        backgroundColor: Color.fromRGBO(39, 36, 53, 1),
      centerTitle: true,
      elevation: 0,
    ),
      body: Container(
        color:   Color.fromRGBO(39, 36, 53, 1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 50),
              child: Container(
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.width*0.5,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/318/600',
                ),
              ),
            ),
            SizedBox(height: 25,),
            Text('data',style: TextStyle(
                color: Colors.white),
            ),
            SizedBox(height: 10,),
            Text('data',style: TextStyle(
                color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                    Text('data',style: TextStyle(
                        color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle,size: 30,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 30,color: Colors.white))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.shuffle,size: 30,color: Colors.grey)),
                IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 30,color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,25,40),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,size: 70,color: Colors.grey)),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 30,color: Colors.grey)),
                IconButton(onPressed: (){}, icon: Icon(Icons.repeat,size: 30,color: Colors.grey))
              ],
            ),

            SliderTheme(data: SliderThemeData(
                thumbColor: Colors.white,
                activeTrackColor: Color.fromRGBO(3, 152, 158, 1),
                inactiveTickMarkColor: Color.fromRGBO(3, 152, 158, 1),
                inactiveTrackColor: Colors.grey,
            ), child: Slider.adaptive(value: 50, onChanged: (v){},
              min: 0,
              max: 100,)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25,5,25,5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('2000',style: TextStyle(
                      color: Colors.white),
                  ),
                  Text('2000',style: TextStyle(
                      color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05)
          ],
        ),
      ),

    );
  }
}
