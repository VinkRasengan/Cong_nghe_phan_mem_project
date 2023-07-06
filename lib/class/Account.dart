// ignore_for_file: file_names
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
part 'Account.g.dart';
@HiveType(typeId: 0)
class Account{
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String password;
  @HiveType(typeId: 1)
  late Person info;
  
  Account(this.username,this.password);
}
// ignore_for_file: file_names
@HiveType(typeId: 1)
class Person{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int age;
  @HiveField(2)
  late String address;
  @HiveField(3)
  late String phoneNumber;
  @HiveField(4)
  late String education;
  @HiveField(5)
  late String sexualOrentation;
  @HiveField(6)
  late String describe;
  
  Person(this.name,this.age);
  void setName(String a){name=a;}
  bool setAge(int a){
    if(age<=0){
      return false;
    }
    age=a;
    return true;
  }
  void setDescribe(String a){describe=a;}
}