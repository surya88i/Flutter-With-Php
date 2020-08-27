import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AddData.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 Future fetchData() async{
    final response=await http.get('http://192.168.43.126/conn.php');
    return jsonDecode(response.body);
    
  }
@override
void initState() { 
  super.initState();
  setState(() {
    fetchData();
  });
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Fetch Data To Internet"),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context,snapshot){
            return snapshot.hasData?ListView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount:snapshot.data.length==null?0:snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                List list=snapshot.data;
                return Card(
                    child: ListTile(
                    leading: GestureDetector(
                      child: Icon(Icons.mode_edit),
                      onTap: (){
                        setState(() {
                          
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddData(list: list,index: index)));
                        });
                      },
                    ),
                    title: Text('${list[index]['firstname']+"\t"+ list[index]['lastname']}'),
                    subtitle: Text(list[index]['mobile']),
                    trailing:  GestureDetector(
                      child: Icon(Icons.delete_outline),
                      onTap: (){
                        setState(() {
                          String url='http://192.168.43.126/delete.php';
                          http.post(url,body:{
                            'rollno':list[index].rno,
                          });
                        });
                      },
                    ),
                  ),
                );
              }):Center(
            child: CircularProgressIndicator(),
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>AddData())
          )),
    );
  }
}


