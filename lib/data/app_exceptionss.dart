class AppExpectioin implements Exception{

  final _message;
  final _prefixe;

  AppExpectioin([this._message,this._prefixe]);

  String toString(){
    return "$_prefixe$_message";

  }
}

class FetchdataExpection extends AppExpectioin{

  FetchdataExpection([String? message]):super(message,"Error during communication");

}



class BadRequestExpection extends AppExpectioin{

  BadRequestExpection([String? message]):super(message,"Invalid Url");

}


class UnauthrozedExpection extends AppExpectioin{

  UnauthrozedExpection([String? message]):super(message,"Unauthroized request" );

}


class InvalidInputExpection extends AppExpectioin{

  InvalidInputExpection([String? message]):super(message,"Invalid input" );

}