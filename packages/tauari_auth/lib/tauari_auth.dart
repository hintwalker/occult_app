library tauari_auth;

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

part 'model/user_model.dart';
part 'state/auth_state.dart';
part 'controller/auth_notifier.dart';
part 'entity/column_user.dart';
part 'entity/user_banned.dart';
part 'entity/user_entity.dart';
part 'entity/user_status.dart';
part 'mapper/user_from_credential.dart';
part 'mapper/user_from_firebase.dart';

part 'repository/auth_repository.dart';
part 'repository/auth_repository_impl.dart';
part 'repository/user_repository.dart';
part 'repository/user_repository_impl.dart';

part 'service/firebase_auth_service.dart';

part 'source/auth_data_source.dart';
part 'source/firebase_auth_data_source.dart';
part 'source/user_data_source.dart';

part 'usecases/register_on_auth_state_changed.dart';
part 'usecases/set_user.dart';
part 'usecases/setup_init_user.dart';
part 'usecases/sign_in_with_google.dart';
part 'usecases/sign_out.dart';
part 'usecases/take_current_user.dart';
