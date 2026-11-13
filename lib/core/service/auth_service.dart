import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;



import 'dart:convert';

class AuthService {


  Future loginService({required String email , required String password})async{
    Map d ={
      "email":email,
      "password":password,
    };

    Uri url = Uri.parse("{{Exp}}/login");
    var res = await http.post(
        url,
        body: jsonEncode(d),
        headers:{
          "Accept": "application/json",
          "Content-Type": "application/json",
        }
    );
    if(res.statusCode == 200){
      return res;
    }
    else{
      return false;
    }
  }
}


