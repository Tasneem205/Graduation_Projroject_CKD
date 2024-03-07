import 'package:flutter/material.dart';
import 'package:graduation_project/pages/home.dart';

class Pressure extends StatefulWidget {
  const Pressure({Key? key}) : super(key: key);

  @override
  State<Pressure> createState() => _PressureState();
}

class _PressureState extends State<Pressure> {
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

  title: Text("Pressure",style: TextStyle(color: Color(0xFF0E725B),fontSize: 27),),
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
    height: 100,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        
        child: Column(children: [ 
    Text(" TODAY",style: TextStyle(color: Color(0xFF0E725B),fontSize: 25)),
    Text(" ------------- ",style: TextStyle(fontSize: 20)),
    Text(" not yet",style: TextStyle(fontSize: 12)),
    
    
      ],
    
    
    
      ), ),
    SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 150,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 10),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 18 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 20))),

    Container(
      margin: EdgeInsets.fromLTRB(190, 1, 0, 10),
      alignment: Alignment.topRight,
      
      child: Text(" High",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

               Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 40, 0),
                        alignment: Alignment.topLeft,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "118",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 50, 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SYS",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),
 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 40, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "76",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DIA",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),

 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "73",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 25),
                        alignment: Alignment.topRight,
                        child: Text(
                          "PUL",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),



            ],),

        ],),


    )
,
    SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 150,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 10),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 17 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 20))),

    Container(
      margin: EdgeInsets.fromLTRB(190, 1, 0, 10),
      alignment: Alignment.topRight,
      
      child: Text(" High",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

               Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 40, 0),
                        alignment: Alignment.topLeft,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "118",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 50, 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SYS",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),
 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 40, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "76",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DIA",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),

 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "73",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 25),
                        alignment: Alignment.topRight,
                        child: Text(
                          "PUL",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),



            ],),
        
        




        ],),


    )
    ,
    SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 150,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 10),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 16 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 20))),

    Container(
      margin: EdgeInsets.fromLTRB(190, 1, 0, 10),
      alignment: Alignment.topRight,
      
      child: Text(" High",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

               Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 40, 0),
                        alignment: Alignment.topLeft,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "118",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 50, 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SYS",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),
 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 40, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "76",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DIA",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),

 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "73",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 25),
                        alignment: Alignment.topRight,
                        child: Text(
                          "PUL",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),



            ],),
        
        




        ],),


    )
    ,
    SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 150,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 10),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 15 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 20))),

    Container(
      margin: EdgeInsets.fromLTRB(190, 1, 0, 10),
      alignment: Alignment.topRight,
      
      child: Text(" High",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

               Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 40, 0),
                        alignment: Alignment.topLeft,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "118",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 50, 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SYS",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),
 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 40, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "76",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DIA",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),

 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "73",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 25),
                        alignment: Alignment.topRight,
                        child: Text(
                          "PUL",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),



            ],),
        
        




        ],),


    )
    ,
    SizedBox(height: 2,),
    Container(
      width:double.infinity,
    height: 150,  
    margin: EdgeInsets.fromLTRB(10, 7, 10, 10), 
    alignment: Alignment.topLeft,   
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusDirectional.circular(10)),
        
        child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 40, 10),
      alignment: Alignment.topLeft,
      
                
                child: Text(" feb 14 ",style: TextStyle(color: Color(0xFF0E725B),fontSize: 20))),

    Container(
      margin: EdgeInsets.fromLTRB(190, 1, 0, 10),
      alignment: Alignment.topRight,
      
      child: Text(" High",style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 237, 116, 108)))),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

               Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 4, 40, 0),
                        alignment: Alignment.topLeft,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "118",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 50, 25),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "SYS",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),
 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 4, 40, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "76",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "DIA",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),

 Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 4, 0, 0),
                        alignment: Alignment.topRight,
                        
                        
                        
                        height: 50,
                        width: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "73",
                              style:
                                  TextStyle(color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 25),
                        alignment: Alignment.topRight,
                        child: Text(
                          "PUL",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      )
                    ],
                  ),



            ],),
        
        




        ],),


    ),
    
  
    
    
    
    ],),
  ),
),

    );
  }
}

















  





