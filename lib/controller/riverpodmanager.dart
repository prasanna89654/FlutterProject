import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/nearbyprovider.dart';
import 'package:project/controller/publicprovider.dart';

final publicriverpod =
    ChangeNotifierProvider<Publicprovider>((ref) => Publicprovider());
final nearbyriverpod =
    ChangeNotifierProvider<Nearbyprovider>((ref) => Nearbyprovider());
// final newsriverpod = ChangeNotifierProvider<Newsdata>((ref) => Newsprovider());
