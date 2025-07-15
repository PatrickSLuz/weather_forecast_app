class ErrorMessage {
  ErrorMessage._();

  static const generic =
      'Desculpe, houve um erro desconhecido. Por favor, tente novamente mais tarde ou entre em contato com o suporte.';

  /// 400
  static const badRequest =
      'Seu pedido não pôde ser entendido pelo servidor. Verifique os dados e tente novamente.';

  /// 401
  static const unauthorized =
      'Desculpe, você não está autorizado a acessar este recurso. Por favor, verifique suas credenciais e tente novamente.';

  ///403
  static const forbidden =
      'Acesso a este recurso é negado. Você pode não ter as permissões necessárias para visualizar esta página. Por favor, entre em contato com o suporte.';

  /// 404
  static const notFound =
      'Ops! A página que você está procurando não foi encontrada. Por favor, verifique o URL e tente novamente.';

  /// 500
  static const internalServerError =
      'Desculpe, ocorreu um erro em nosso servidor. Nossa equipe foi notificada e estamos trabalhando para resolver o problema. Por favor, tente novamente mais tarde.';

  /// 503
  static const serviceUnavailable =
      'Estamos enfrentando alto tráfego ou realizando manutenção no momento. Por favor, tente novamente em alguns minutos.';
}
