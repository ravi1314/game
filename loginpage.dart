import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {

   Loginpage({Key? key}) : super(key: key);
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validet(){
    if(formkey.currentState!.validate()){
      print("ok");
    }
    else{
      print("erorr");
    }

    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
        
        title: Text("Login",style:
        TextStyle(color: Colors.black,
        ),),
      ),
      body: Padding(padding: EdgeInsets.all(50),
      
      child: Center(
        
        child: Form(
          key: formkey,
          child: 
        Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (val){
                if(val!.isEmpty){
                  return "Required";
                }
                else{
                  return null;
                }
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
              validator: (val){
                if(val!.isEmpty){
                  return "Required";
                }
                else{
                  return null;
                }
              },
            ),
            Padding(padding: EdgeInsets.only(top: 20),

            child: RaisedButton(
              color: Colors.amber,
              onPressed: (){
                validet;
              },

            child: Text("Login"),
            ),)
            
          ],
        )),
      ),
      ),
      
          
          
        
    
    );
  }
}