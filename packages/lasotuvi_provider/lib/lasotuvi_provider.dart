library lasotuvi_provider;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energy_store/energy_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';
import 'package:tauari_purchase/tauari_purchase.dart';
import 'package:tauari_utils/tauari_utils.dart';

part 'user/user_data_source_provider.dart';
part 'user/set_user_provider.dart';
part 'user/user_repository_provider.dart';
part 'user/setup_init_user_provider.dart';

part 'auth/auth_notifier_provider.dart';
part 'auth/auth_data_source_provider.dart';
part 'auth/auth_repository_provider.dart';
part 'auth/auth_service_provider.dart';
part 'auth/auth_state_changes_provider.dart';
part 'auth/current_user_provider.dart';
part 'auth/current_user_stream_provider.dart';
part 'auth/firebase_auth_provider.dart';
part 'auth/register_on_auth_state_changed_provider.dart';
part 'auth/sign_in_with_google_provider.dart';
part 'auth/sign_out_provider.dart';

part 'energy_store/controller/energy_store_controller_provider.dart';
part 'energy_store/energy_data_source_provider.dart';
part 'energy_store/energy_repository_provider.dart';
part 'energy_store/usecase/plus_energy_provider.dart';
part 'energy_store/usecase/take_energy_provider.dart';

part 'purchase/usecase/subscribe_purchase_listing_changes_provider.dart';
part 'purchase/usecase/post_resolve_purchase_provider.dart';
part 'purchase/usecase/buy_consumable_product_provider.dart';
part 'purchase/usecase/query_product_details_provider.dart';
part 'purchase/usecase/available_for_sell_provider.dart';

part 'purchase/purchase_data_source_provider.dart';
part 'purchase/purchase_repository_provider.dart';
part 'firebase/firebase_firestore_provider.dart';
part 'cloud_service/firestore_service_provider.dart';
