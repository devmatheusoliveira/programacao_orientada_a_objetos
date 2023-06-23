abstract class VeiculoMotorizado {
  static double _gastoMotocicleta = 0.25;
  static double _gastoCarroPasseio = 0.75;
  static double _gastoCarroEsportivo = 2.3;
  late double _combustivelEmLitros;
  double _valorIPVA;

  VeiculoMotorizado(
    this._valorIPVA,
  ) {
    _combustivelEmLitros = 2.5;
  }

  //abastecer
  void abastecer(double combustivelEmLitros) {
    this._combustivelEmLitros = combustivelEmLitros;
  }

  double getQuantidadeDeCombustivel() {
    return this._combustivelEmLitros;
  }

  String toString() =>
      'VeiculoMotorizado(_combustivelEmLitros: $_combustivelEmLitros, _valorIPVA: $_valorIPVA)';
}
