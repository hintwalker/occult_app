import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_repository.dart';

final uploadNotificationProvider = Provider.autoDispose<UploadNotification>(
    (ref) => UploadNotification(ref.read(notificationRepositoryProvider)));
