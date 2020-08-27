import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddData extends StatefulWidget {
  final List list;
  final int index;
  AddData({this.list,this.index});
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

TextEditingController firstname=TextEditingController();
TextEditingController lastname=TextEditingController();
TextEditingController mobile=TextEditingController();
bool edit=false;
  void addData(){
    if(edit){
      String url="http://your ip address/update.php";
     http.post(url, body:{
      'rollno':widget.list[widget.index]['rollno'],
      'firstname':firstname.text,
      'lastname':lastname.text,
      'mobile':mobile.text,
    });
    }
    else{
      String url="http://your ip address/AddData.php";
     http.post(url, body:{
      'firstname':firstname.text,
      'lastname':lastname.text,
      'mobile':mobile.text,
    });
    }
  }
  @override
  void initState() { 
    super.initState();
    if(widget.index!=null)
    {
      edit=true;
      firstname.text=widget.list[widget.index]['firstname'];
      lastname.text=widget.list[widget.index]['lastname'];
      mobile.text=widget.list[widget.index]['mobile'];
    }
    setState(() {
      addData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(edit?'Update Data':"Add Data With Php"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0,left:20.0,right:20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            TextField(
              controller: firstname,
              decoration: InputDecoration(
                hintText: "Enter your firstname",
                labelText: "Enter your firstname",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: lastname,
              decoration: InputDecoration(
                hintText: "Enter your lastname",
                labelText: "Enter your lastname",
              ),
              keyboardType: TextInputType.text,
            ),

            TextField(
              controller: mobile,
              decoration: InputDecoration(
                hintText: "Enter your mobile",
                labelText: "Enter your mobile",
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height:40),
            RaisedButton(
              color: Colors.blue,
              child: Text(edit?'Update Data':"ADD Data",style: TextStyle(color: Colors.white)),
              onPressed: (){
                setState(() {
                  addData();
                Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>HomeScreen()));
                });
              }),
          ],
        ),
      ),
    );
  }
}
