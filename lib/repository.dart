import 'dart:convert';
import 'package:flutter/services.dart';

class Profession {
  Future other() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/categories.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Specialty {
  Future other() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/specialty.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Account {
  Future other() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/acount.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Homepage {
  Future home() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/dummy.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Access {
  Future control() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/accessfda.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Service {
  Future list() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/servicelist.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Listoffda {
  Future fdalist() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/listfda.json");
    final value = jsonDecode(response);
    return value;
  }
}

class Searchengine {
  Future searchbar() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/search.json");
    final Map<String, dynamic> value = jsonDecode(response);
    return value;
  }
}

class Paymentlist {
  Future listpay() async {
    final String response =
        await rootBundle.loadString("assets/jsonfile/payment.json");
    final Map<String, dynamic> value = jsonDecode(response);
    return value;
  }
}
