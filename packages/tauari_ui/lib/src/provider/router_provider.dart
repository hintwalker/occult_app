import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider =
    Provider.autoDispose<GoRouter>((ref) => throw UnimplementedError());
