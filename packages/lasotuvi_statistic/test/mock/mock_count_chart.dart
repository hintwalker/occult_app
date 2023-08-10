import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:mocktail/mocktail.dart';

class MockCountChart extends Mock implements CountChart {}

class MockCountChartOnCloud extends Mock implements CountChartOnCloud {}

class MockCountTag extends Mock implements CountTag {}

class MockCountTagOnCloud extends Mock implements CountTagOnCloud {}

class MockCountNote extends Mock implements CountNote {}

class MockCountNoteOnCloud extends Mock implements CountNoteOnCloud {}

class MockTakeCurrentStoragePlan extends Mock
    implements TakeCurrentStoragePlan {}
