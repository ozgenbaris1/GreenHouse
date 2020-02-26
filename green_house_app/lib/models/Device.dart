class Device {
  int _deviceID;
  String _name;
  String _createdDate;
  int _isOnline;

  int get deviceID {
    return _deviceID;
  }

  String get name {
    return _name;
  }

  String get createdDate {
    return _createdDate;
  }

  int get isOnline {
    return _isOnline;
  }

  Device({deviceID, name, createdDate, isOnline}){
    _deviceID = deviceID;
    _name = name;
    _createdDate = createdDate;
    _isOnline = isOnline;
  }
}