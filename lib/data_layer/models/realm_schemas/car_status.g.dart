// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_status.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Status extends _Status with RealmEntity, RealmObjectBase, RealmObject {
  Status(
    String carModel,
    String status,
  ) {
    RealmObjectBase.set(this, 'carModel', carModel);
    RealmObjectBase.set(this, 'status', status);
  }

  Status._();

  @override
  String get carModel =>
      RealmObjectBase.get<String>(this, 'carModel') as String;
  @override
  set carModel(String value) => RealmObjectBase.set(this, 'carModel', value);

  @override
  String get status => RealmObjectBase.get<String>(this, 'status') as String;
  @override
  set status(String value) => RealmObjectBase.set(this, 'status', value);

  @override
  Stream<RealmObjectChanges<Status>> get changes =>
      RealmObjectBase.getChanges<Status>(this);

  @override
  Status freeze() => RealmObjectBase.freezeObject<Status>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Status._);
    return const SchemaObject(ObjectType.realmObject, Status, 'Status', [
      SchemaProperty('carModel', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('status', RealmPropertyType.string),
    ]);
  }
}
