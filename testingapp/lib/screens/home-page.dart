import 'package:flutter/material.dart';
import 'package:testingapp/screens/contactlist.dart';
import 'package:testingapp/services/user-service.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [
  ];
@override
void initState(){
  super.initState();
  getUsersList();
}
getUsersList() async{
  var _userFromApi = await getUsers(); 
  setState(() {
  users =  _userFromApi;  
  });
 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client List'),
        
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        
         child: users.isEmpty ?Center(child: CircularProgressIndicator())  : ListView.builder(
           itemCount: users.length,
           itemBuilder: (BuildContext context,int index){
             var user = users[index];
             return ListTile(
               title : Text(user['name']['first']+''+user['name']['last']),
               subtitle: Text(user['email']),
                leading: CircleAvatar(backgroundImage: NetworkImage(user['picture']['medium'])),
              // leading: CircleAvatar(child: Text(user['name']['first']+''+user['name']['last'].initials()),),
             );
           }, 
           )
        
        ),
       floatingActionButton: FloatingActionButton(
        onPressed:(){ Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => contactlist()),);},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),  
    );
  }
  
}