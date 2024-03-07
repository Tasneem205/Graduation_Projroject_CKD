import 'package:flutter/material.dart';
import 'package:graduation_project/pages/home.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  State<Diabetes> createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
  floatingActionButton: FloatingActionButton(onPressed: (){},
  child: Icon(Icons.add,size: 50,color: Color(0xFF0E725B),),
  
  
  ),


      
appBar: AppBar(
  elevation: 1,
  leading: IconButton(
            onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home()));},
            icon: Icon(
              Icons.arrow_back,
              size: 27,
              color: Color(0xFF0E725B),
            )),

  title: Text("Diabetes",style: TextStyle(color: Color(0xFF0E725B),fontSize: 27),),
),


body: Container(
  
    width: double.infinity,
    height: double.infinity,
    color: Color.fromARGB(55, 222, 221, 221),



  
  child: SingleChildScrollView(
  
    
    child: 
  
    
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    
    
      children: [  
      Container(  
    
        width:double.infinity,
    height: 120,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        
        child: Column(children: [ 
    Text(" TODAY",style: TextStyle(color: Color(0xFF0E725B),fontSize: 25)),
    Text(" ------------- ",style: TextStyle(fontSize: 20)),
    Text(" not yet",style: TextStyle(fontSize: 15)),
    
    
      ],
      ), ),
      
      SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 129,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 9),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 18 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 22))),

    Container(
      margin: EdgeInsets.fromLTRB(150, 44, 10, 2),
      alignment: Alignment.bottomRight,
      
      child: Text(" High",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "159",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 27),
                        ),
                      )
      
      
      
      ],),),
    
      
      SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 129,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 9),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 17 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 22))),

    Container(
      margin: EdgeInsets.fromLTRB(150, 44, 10, 2),
      alignment: Alignment.bottomRight,
      
      child: Text(" Normal",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "115",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 27),
                        ),
                      )
      
      
      
      ],),),
    

  SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 129,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 9),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 16 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 22))),

    Container(
      margin: EdgeInsets.fromLTRB(150, 44, 10, 2),
      alignment: Alignment.bottomRight,
      
      child: Text(" High",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "200",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 27),
                        ),
                      )
      
      
      
      ],),),
    
  SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 129,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 9),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 15 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 22))),

    Container(
      margin: EdgeInsets.fromLTRB(150, 44, 10, 2),
      alignment: Alignment.bottomRight,
      
      child: Text(" High",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "284",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 27),
                        ),
                      )
      
      
      
      ],),),
    
  SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 129,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 9),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 14 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 22))),

    Container(
      margin: EdgeInsets.fromLTRB(150, 44, 10, 2),
      alignment: Alignment.bottomRight,
      
      child: Text(" Low",style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
      Container(
                        margin: EdgeInsets.fromLTRB(0, 1, 5, 9),
                        alignment: Alignment.topLeft,
                        child: Text(
                          " 81",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 28),
                        ),
                      )
      
      
      
      ],),),
    













    ],),),),




        
    );
  }
}