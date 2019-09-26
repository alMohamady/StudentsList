

class Student {

  int _id;
  String _name;
  String _description;
  int _pass;
  String _date;

  Student(this._name, this._description, this._pass, this._date);

  Student.withId(this._id, this._name, this._description, this._pass,
      this._date);

  String get date => _date;

  int get pass => _pass;

  String get description => _description;

  String get name => _name;

  int get id => _id;

  set date(String value) {
    _date = value;
  }

  set pass(int value) {
    if (value >= 1 && value <= 2) {
      _pass = value;
    }
  }

  set description(String value) {
    if (value.length <= 255) {
      _description = value;
    }
  }

  set name(String value) {
    if (value.length <= 255) {
      _name = value;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = this._id;
    map["name"] = this._name;
    map["description"] = this._description;
    map["pass"] = this._pass;
    map["date"] = this._date;
    return map;
  }

  Student.getMap(Map<String, dynamic> map){
    this._id = map["id"];
    this._name = map["name"];
    this._description = map["description"];
    this._pass = map["pass"];
    this._date = map["date"];
  }
}