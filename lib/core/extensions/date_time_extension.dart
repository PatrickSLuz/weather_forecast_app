extension DateTimeExtension on DateTime {
  String dayOfWeek([bool fullName = true]) {
    switch (weekday) {
      case 1:
        if (fullName) return 'Segunda-feira';
        return 'Seg';
      case 2:
        if (fullName) return 'Terça-feira';
        return 'Ter';
      case 3:
        if (fullName) return 'Quarta-feira';
        return 'Qua';
      case 4:
        if (fullName) return 'Quinta-feira';
        return 'Qui';
      case 5:
        if (fullName) return 'Sexta-feira';
        return 'Sex';
      case 6:
        if (fullName) return 'Sábado';
        return 'Sáb';
      case 7:
        if (fullName) return 'Domingo';
        return 'Dom';
      default:
        return 'Dia da Semana';
    }
  }
}
