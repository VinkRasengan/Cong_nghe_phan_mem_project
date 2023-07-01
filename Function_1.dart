// import 'dart:collection';
// ignore: camel_case_types

// ignore: camel_case_types
class item{
  late String name;
  late int age;
  late String address;
  item(this.name,this.age);
}
//https://karthikponnam.medium.com/flutter-search-in-listview-1ffa40956685
class Search{
  // ignore: non_constant_identifier_names
  static List<item> filterSearchResults_byName(List<item> items,String query) {
    return items
        // ignore: avoid_types_as_parameter_names
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  // ignore: non_constant_identifier_names
  static List<item> filterSearchResults_byAddr(List<item> items,String query) {
    return items
        // ignore: avoid_types_as_parameter_names
        .where((item) => item.address.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  // ignore: non_constant_identifier_names
  static List<item> filterSearchResults_byDescribe(List<item> items,String query) {
    return items
        // ignore: avoid_types_as_parameter_names
        .where((item) => item.address.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
class Sort{
  // ignore: non_constant_identifier_names
  static List<item> sort_byName(List<item> items){
    items.sort((a, b) => a.name.compareTo(b.name));
    return items;
  }
    // ignore: non_constant_identifier_names
  static List<item> sort_byAge(List<item> items){
    items.sort((a, b) => a.age.compareTo(b.age));
    return items;
  }
}
void main() {
  var items = <item>[item('sheng',20),item('an',21),item('khang',19)];
  // items = Sort.sort_byName(items);
  items = Sort.sort_byAge(items);
  for (var i in items){
    // ignore: avoid_print
    print(i.name);
  }
  // print("hehe");
}