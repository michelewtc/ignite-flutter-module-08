class GerenciaDeEstado {
  var _state;
  var _listens = <Function>[];

  get state => _state;

  void setState(var state) {
    _state = state;
    _update();
  }

  void _update() {
    for (var i = 0; i < _listens.length; i++) {
      _listens[i](_state);
    }
  }

  void listen(void Function(dynamic state) onUpdate) {
    _listens.add(onUpdate);
  }
}
