String dropTable(String name) => 'DROP TABLE IF EXISTS $name';
String dropColumn(String columnName, String tableName) =>
    'ALTER TABLE $tableName DROP COLUMN $columnName';
String addIntegerColumn(String columnName, String tableName) =>
    'ALTER TABLE $tableName ADD COLUMN $columnName INTEGER';
