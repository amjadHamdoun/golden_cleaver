// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PagesState extends PagesState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final bool? isSuccessOrders;
  @override
  final bool? isLoadingOrders;
  @override
  final bool? isLoadingSlider;
  @override
  final bool? isSuccessSlider;
  @override
  final bool? isLoadingCate;
  @override
  final bool? isSuccessCate;
  @override
  final bool? isLoadingBasket;
  @override
  final bool? isSuccessBasket;
  @override
  final OrderModel? orderModel;
  @override
  final String? errorMessage;
  @override
  final UserModel? userModel;
  @override
  final SliderModel? sliderModel;
  @override
  final ProductModel? productModel;
  @override
  final CategoryModel? categoryModel;
  @override
  final NotificationModel? notificationModel;
  @override
  final List<Basket>? carts;

  factory _$PagesState([void Function(PagesStateBuilder)? updates]) =>
      (new PagesStateBuilder()..update(updates)).build();

  _$PagesState._(
      {this.isSuccess,
      this.isLoading,
      this.isSuccessOrders,
      this.isLoadingOrders,
      this.isLoadingSlider,
      this.isSuccessSlider,
      this.isLoadingCate,
      this.isSuccessCate,
      this.isLoadingBasket,
      this.isSuccessBasket,
      this.orderModel,
      this.errorMessage,
      this.userModel,
      this.sliderModel,
      this.productModel,
      this.categoryModel,
      this.notificationModel,
      this.carts})
      : super._();

  @override
  PagesState rebuild(void Function(PagesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagesStateBuilder toBuilder() => new PagesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagesState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        isSuccessOrders == other.isSuccessOrders &&
        isLoadingOrders == other.isLoadingOrders &&
        isLoadingSlider == other.isLoadingSlider &&
        isSuccessSlider == other.isSuccessSlider &&
        isLoadingCate == other.isLoadingCate &&
        isSuccessCate == other.isSuccessCate &&
        isLoadingBasket == other.isLoadingBasket &&
        isSuccessBasket == other.isSuccessBasket &&
        orderModel == other.orderModel &&
        errorMessage == other.errorMessage &&
        userModel == other.userModel &&
        sliderModel == other.sliderModel &&
        productModel == other.productModel &&
        categoryModel == other.categoryModel &&
        notificationModel == other.notificationModel &&
        carts == other.carts;
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
                                                                            0,
                                                                            isSuccess
                                                                                .hashCode),
                                                                        isLoading
                                                                            .hashCode),
                                                                    isSuccessOrders
                                                                        .hashCode),
                                                                isLoadingOrders
                                                                    .hashCode),
                                                            isLoadingSlider
                                                                .hashCode),
                                                        isSuccessSlider
                                                            .hashCode),
                                                    isLoadingCate.hashCode),
                                                isSuccessCate.hashCode),
                                            isLoadingBasket.hashCode),
                                        isSuccessBasket.hashCode),
                                    orderModel.hashCode),
                                errorMessage.hashCode),
                            userModel.hashCode),
                        sliderModel.hashCode),
                    productModel.hashCode),
                categoryModel.hashCode),
            notificationModel.hashCode),
        carts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PagesState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('isSuccessOrders', isSuccessOrders)
          ..add('isLoadingOrders', isLoadingOrders)
          ..add('isLoadingSlider', isLoadingSlider)
          ..add('isSuccessSlider', isSuccessSlider)
          ..add('isLoadingCate', isLoadingCate)
          ..add('isSuccessCate', isSuccessCate)
          ..add('isLoadingBasket', isLoadingBasket)
          ..add('isSuccessBasket', isSuccessBasket)
          ..add('orderModel', orderModel)
          ..add('errorMessage', errorMessage)
          ..add('userModel', userModel)
          ..add('sliderModel', sliderModel)
          ..add('productModel', productModel)
          ..add('categoryModel', categoryModel)
          ..add('notificationModel', notificationModel)
          ..add('carts', carts))
        .toString();
  }
}

class PagesStateBuilder implements Builder<PagesState, PagesStateBuilder> {
  _$PagesState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccessOrders;
  bool? get isSuccessOrders => _$this._isSuccessOrders;
  set isSuccessOrders(bool? isSuccessOrders) =>
      _$this._isSuccessOrders = isSuccessOrders;

  bool? _isLoadingOrders;
  bool? get isLoadingOrders => _$this._isLoadingOrders;
  set isLoadingOrders(bool? isLoadingOrders) =>
      _$this._isLoadingOrders = isLoadingOrders;

  bool? _isLoadingSlider;
  bool? get isLoadingSlider => _$this._isLoadingSlider;
  set isLoadingSlider(bool? isLoadingSlider) =>
      _$this._isLoadingSlider = isLoadingSlider;

  bool? _isSuccessSlider;
  bool? get isSuccessSlider => _$this._isSuccessSlider;
  set isSuccessSlider(bool? isSuccessSlider) =>
      _$this._isSuccessSlider = isSuccessSlider;

  bool? _isLoadingCate;
  bool? get isLoadingCate => _$this._isLoadingCate;
  set isLoadingCate(bool? isLoadingCate) =>
      _$this._isLoadingCate = isLoadingCate;

  bool? _isSuccessCate;
  bool? get isSuccessCate => _$this._isSuccessCate;
  set isSuccessCate(bool? isSuccessCate) =>
      _$this._isSuccessCate = isSuccessCate;

  bool? _isLoadingBasket;
  bool? get isLoadingBasket => _$this._isLoadingBasket;
  set isLoadingBasket(bool? isLoadingBasket) =>
      _$this._isLoadingBasket = isLoadingBasket;

  bool? _isSuccessBasket;
  bool? get isSuccessBasket => _$this._isSuccessBasket;
  set isSuccessBasket(bool? isSuccessBasket) =>
      _$this._isSuccessBasket = isSuccessBasket;

  OrderModel? _orderModel;
  OrderModel? get orderModel => _$this._orderModel;
  set orderModel(OrderModel? orderModel) => _$this._orderModel = orderModel;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  UserModel? _userModel;
  UserModel? get userModel => _$this._userModel;
  set userModel(UserModel? userModel) => _$this._userModel = userModel;

  SliderModel? _sliderModel;
  SliderModel? get sliderModel => _$this._sliderModel;
  set sliderModel(SliderModel? sliderModel) =>
      _$this._sliderModel = sliderModel;

  ProductModel? _productModel;
  ProductModel? get productModel => _$this._productModel;
  set productModel(ProductModel? productModel) =>
      _$this._productModel = productModel;

  CategoryModel? _categoryModel;
  CategoryModel? get categoryModel => _$this._categoryModel;
  set categoryModel(CategoryModel? categoryModel) =>
      _$this._categoryModel = categoryModel;

  NotificationModel? _notificationModel;
  NotificationModel? get notificationModel => _$this._notificationModel;
  set notificationModel(NotificationModel? notificationModel) =>
      _$this._notificationModel = notificationModel;

  List<Basket>? _carts;
  List<Basket>? get carts => _$this._carts;
  set carts(List<Basket>? carts) => _$this._carts = carts;

  PagesStateBuilder();

  PagesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _isSuccessOrders = $v.isSuccessOrders;
      _isLoadingOrders = $v.isLoadingOrders;
      _isLoadingSlider = $v.isLoadingSlider;
      _isSuccessSlider = $v.isSuccessSlider;
      _isLoadingCate = $v.isLoadingCate;
      _isSuccessCate = $v.isSuccessCate;
      _isLoadingBasket = $v.isLoadingBasket;
      _isSuccessBasket = $v.isSuccessBasket;
      _orderModel = $v.orderModel;
      _errorMessage = $v.errorMessage;
      _userModel = $v.userModel;
      _sliderModel = $v.sliderModel;
      _productModel = $v.productModel;
      _categoryModel = $v.categoryModel;
      _notificationModel = $v.notificationModel;
      _carts = $v.carts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagesState;
  }

  @override
  void update(void Function(PagesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PagesState build() {
    final _$result = _$v ??
        new _$PagesState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            isSuccessOrders: isSuccessOrders,
            isLoadingOrders: isLoadingOrders,
            isLoadingSlider: isLoadingSlider,
            isSuccessSlider: isSuccessSlider,
            isLoadingCate: isLoadingCate,
            isSuccessCate: isSuccessCate,
            isLoadingBasket: isLoadingBasket,
            isSuccessBasket: isSuccessBasket,
            orderModel: orderModel,
            errorMessage: errorMessage,
            userModel: userModel,
            sliderModel: sliderModel,
            productModel: productModel,
            categoryModel: categoryModel,
            notificationModel: notificationModel,
            carts: carts);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
