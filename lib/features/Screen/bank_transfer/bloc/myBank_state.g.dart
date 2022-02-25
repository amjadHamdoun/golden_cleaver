// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myBank_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyBankState extends MyBankState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isSuccessOrder;
  @override
  final bool? isLoadingOrder;
  @override
  final File? image;
  @override
  final String? errorMessage;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final double? deliveryPrice;
  @override
  final MyBankModel? myBankModel;
  @override
  final CityModel? cityModel;
  @override
  final SectionModel? sectionModel;
  @override
  final LatLng? center;
  @override
  final String? total;
  @override
  final String? totalWithVat;
  @override
  final String? cityName;
  @override
  final int? cityId;
  @override
  final String? sectionName;
  @override
  final int? sectionId;
  @override
  final String? home;
  @override
  final String? street;
  @override
  final String? description;
  @override
  final String? name;
  @override
  final String? account_number;
  @override
  final String? bank_id;
  @override
  final List<Basket>? carts;
  @override
  final CartResModel? cartResModel;

  factory _$MyBankState([void Function(MyBankStateBuilder)? updates]) =>
      (new MyBankStateBuilder()..update(updates)).build();

  _$MyBankState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessOrder,
      this.isLoadingOrder,
      this.image,
      this.errorMessage,
      this.lat,
      this.lon,
      this.deliveryPrice,
      this.myBankModel,
      this.cityModel,
      this.sectionModel,
      this.center,
      this.total,
      this.totalWithVat,
      this.cityName,
      this.cityId,
      this.sectionName,
      this.sectionId,
      this.home,
      this.street,
      this.description,
      this.name,
      this.account_number,
      this.bank_id,
      this.carts,
      this.cartResModel})
      : super._();

  @override
  MyBankState rebuild(void Function(MyBankStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyBankStateBuilder toBuilder() => new MyBankStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyBankState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessOrder == other.isSuccessOrder &&
        isLoadingOrder == other.isLoadingOrder &&
        image == other.image &&
        errorMessage == other.errorMessage &&
        lat == other.lat &&
        lon == other.lon &&
        deliveryPrice == other.deliveryPrice &&
        myBankModel == other.myBankModel &&
        cityModel == other.cityModel &&
        sectionModel == other.sectionModel &&
        center == other.center &&
        total == other.total &&
        totalWithVat == other.totalWithVat &&
        cityName == other.cityName &&
        cityId == other.cityId &&
        sectionName == other.sectionName &&
        sectionId == other.sectionId &&
        home == other.home &&
        street == other.street &&
        description == other.description &&
        name == other.name &&
        account_number == other.account_number &&
        bank_id == other.bank_id &&
        carts == other.carts &&
        cartResModel == other.cartResModel;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, isSuccess.hashCode), isLoading.hashCode), isSuccessOrder.hashCode), isLoadingOrder.hashCode), image.hashCode), errorMessage.hashCode), lat.hashCode), lon.hashCode),
                                                                                deliveryPrice.hashCode),
                                                                            myBankModel.hashCode),
                                                                        cityModel.hashCode),
                                                                    sectionModel.hashCode),
                                                                center.hashCode),
                                                            total.hashCode),
                                                        totalWithVat.hashCode),
                                                    cityName.hashCode),
                                                cityId.hashCode),
                                            sectionName.hashCode),
                                        sectionId.hashCode),
                                    home.hashCode),
                                street.hashCode),
                            description.hashCode),
                        name.hashCode),
                    account_number.hashCode),
                bank_id.hashCode),
            carts.hashCode),
        cartResModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MyBankState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessOrder', isSuccessOrder)
          ..add('isLoadingOrder', isLoadingOrder)
          ..add('image', image)
          ..add('errorMessage', errorMessage)
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('deliveryPrice', deliveryPrice)
          ..add('myBankModel', myBankModel)
          ..add('cityModel', cityModel)
          ..add('sectionModel', sectionModel)
          ..add('center', center)
          ..add('total', total)
          ..add('totalWithVat', totalWithVat)
          ..add('cityName', cityName)
          ..add('cityId', cityId)
          ..add('sectionName', sectionName)
          ..add('sectionId', sectionId)
          ..add('home', home)
          ..add('street', street)
          ..add('description', description)
          ..add('name', name)
          ..add('account_number', account_number)
          ..add('bank_id', bank_id)
          ..add('carts', carts)
          ..add('cartResModel', cartResModel))
        .toString();
  }
}

class MyBankStateBuilder implements Builder<MyBankState, MyBankStateBuilder> {
  _$MyBankState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccessOrder;
  bool? get isSuccessOrder => _$this._isSuccessOrder;
  set isSuccessOrder(bool? isSuccessOrder) =>
      _$this._isSuccessOrder = isSuccessOrder;

  bool? _isLoadingOrder;
  bool? get isLoadingOrder => _$this._isLoadingOrder;
  set isLoadingOrder(bool? isLoadingOrder) =>
      _$this._isLoadingOrder = isLoadingOrder;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lon;
  double? get lon => _$this._lon;
  set lon(double? lon) => _$this._lon = lon;

  double? _deliveryPrice;
  double? get deliveryPrice => _$this._deliveryPrice;
  set deliveryPrice(double? deliveryPrice) =>
      _$this._deliveryPrice = deliveryPrice;

  MyBankModel? _myBankModel;
  MyBankModel? get myBankModel => _$this._myBankModel;
  set myBankModel(MyBankModel? myBankModel) =>
      _$this._myBankModel = myBankModel;

  CityModel? _cityModel;
  CityModel? get cityModel => _$this._cityModel;
  set cityModel(CityModel? cityModel) => _$this._cityModel = cityModel;

  SectionModel? _sectionModel;
  SectionModel? get sectionModel => _$this._sectionModel;
  set sectionModel(SectionModel? sectionModel) =>
      _$this._sectionModel = sectionModel;

  LatLng? _center;
  LatLng? get center => _$this._center;
  set center(LatLng? center) => _$this._center = center;

  String? _total;
  String? get total => _$this._total;
  set total(String? total) => _$this._total = total;

  String? _totalWithVat;
  String? get totalWithVat => _$this._totalWithVat;
  set totalWithVat(String? totalWithVat) => _$this._totalWithVat = totalWithVat;

  String? _cityName;
  String? get cityName => _$this._cityName;
  set cityName(String? cityName) => _$this._cityName = cityName;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  String? _sectionName;
  String? get sectionName => _$this._sectionName;
  set sectionName(String? sectionName) => _$this._sectionName = sectionName;

  int? _sectionId;
  int? get sectionId => _$this._sectionId;
  set sectionId(int? sectionId) => _$this._sectionId = sectionId;

  String? _home;
  String? get home => _$this._home;
  set home(String? home) => _$this._home = home;

  String? _street;
  String? get street => _$this._street;
  set street(String? street) => _$this._street = street;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _account_number;
  String? get account_number => _$this._account_number;
  set account_number(String? account_number) =>
      _$this._account_number = account_number;

  String? _bank_id;
  String? get bank_id => _$this._bank_id;
  set bank_id(String? bank_id) => _$this._bank_id = bank_id;

  List<Basket>? _carts;
  List<Basket>? get carts => _$this._carts;
  set carts(List<Basket>? carts) => _$this._carts = carts;

  CartResModel? _cartResModel;
  CartResModel? get cartResModel => _$this._cartResModel;
  set cartResModel(CartResModel? cartResModel) =>
      _$this._cartResModel = cartResModel;

  MyBankStateBuilder();

  MyBankStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessOrder = $v.isSuccessOrder;
      _isLoadingOrder = $v.isLoadingOrder;
      _image = $v.image;
      _errorMessage = $v.errorMessage;
      _lat = $v.lat;
      _lon = $v.lon;
      _deliveryPrice = $v.deliveryPrice;
      _myBankModel = $v.myBankModel;
      _cityModel = $v.cityModel;
      _sectionModel = $v.sectionModel;
      _center = $v.center;
      _total = $v.total;
      _totalWithVat = $v.totalWithVat;
      _cityName = $v.cityName;
      _cityId = $v.cityId;
      _sectionName = $v.sectionName;
      _sectionId = $v.sectionId;
      _home = $v.home;
      _street = $v.street;
      _description = $v.description;
      _name = $v.name;
      _account_number = $v.account_number;
      _bank_id = $v.bank_id;
      _carts = $v.carts;
      _cartResModel = $v.cartResModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyBankState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyBankState;
  }

  @override
  void update(void Function(MyBankStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MyBankState build() {
    final _$result = _$v ??
        new _$MyBankState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessOrder: isSuccessOrder,
            isLoadingOrder: isLoadingOrder,
            image: image,
            errorMessage: errorMessage,
            lat: lat,
            lon: lon,
            deliveryPrice: deliveryPrice,
            myBankModel: myBankModel,
            cityModel: cityModel,
            sectionModel: sectionModel,
            center: center,
            total: total,
            totalWithVat: totalWithVat,
            cityName: cityName,
            cityId: cityId,
            sectionName: sectionName,
            sectionId: sectionId,
            home: home,
            street: street,
            description: description,
            name: name,
            account_number: account_number,
            bank_id: bank_id,
            carts: carts,
            cartResModel: cartResModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
