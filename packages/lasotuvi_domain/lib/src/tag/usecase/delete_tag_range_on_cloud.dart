import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class DeleteTagRangeOnCloud
    extends DeleteRangeOnCloud<Tag, CloudTagRepository> {
  DeleteTagRangeOnCloud(super.repository);
}
