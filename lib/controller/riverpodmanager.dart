import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/publicprovider.dart';

final publicriverpod =
    ChangeNotifierProvider<Publicprovider>((ref) => Publicprovider());
