abstract class IPVA {
  //interfaces no dart também são implementadas com
  //abstract class

  final double aliquotaCarroPasseio = 1.3;
  final double aliquotaMotocicleta = 0.75;
  final double aliquotaCarroEsportivo = 3.15;

  double valorBase = 500.00;

  double? calcularIPVA(String veiculoTipo) {
    switch (veiculoTipo) {
      case 'M':
        return valorBase * aliquotaMotocicleta;
      case 'C':
        return valorBase * aliquotaCarroPasseio;
      case 'E':
        return valorBase * aliquotaCarroEsportivo;
      default:
        return null;
    }
  }
}
