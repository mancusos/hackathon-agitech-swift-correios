//
// PreosAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class PreosAPI: APIBase {
    /**

     - parameter clientId: (header) Identificaçáo do cliente usado na autenticaçáo. 
     - parameter accessToken: (header) Access token usado na autenticaçáo. 
     - parameter codigoServico: (query) Pode conter mais de um código por consulta separados por virgula. 40010 - SEDEX Varejo, 40045 - SEDEX a Cobrar Varejo, 40215 - SEDEX 10 Varejo, 40290 - SEDEX Hoje Varejo, 41106 - PAC Varejo 
     - parameter cepOrigem: (query) CEP de Origem sem hífen.Exemplo: 05311900 
     - parameter cepDestino: (query) CEP de Destino sem hífen 
     - parameter peso: (query) Peso da encomenda, incluindo sua embalagem. O peso deve ser informado em quilogramas. Se o formato for Envelope, o valor máximo permitido será 1 kg 
     - parameter formato: (query) Formato da encomenda (incluindo embalagem). 1 - Formato caixa/pacote, 2 - Formato rolo/prisma, 3 - Envelope 
     - parameter comprimento: (query) Comprimento da encomenda (incluindo embalagem), em centímetros. 
     - parameter altura: (query) Altura da encomenda (incluindo embalagem), em centímetros. Se o formato for envelope, informar zero (0). 
     - parameter largura: (query) Largura da encomenda (incluindo embalagem), em centímetros. 
     - parameter diametro: (query) Diâmetro da encomenda (incluindo embalagem), em centímetros. 
     - parameter servicoMaoPropria: (query) Indica se a encomenda será entregue com o serviço adicional mão própria. Valores possíveis: S ou N (S - Sim, N - Não) (optional, default to N)
     - parameter valorDeclarado: (query) Indica se a encomenda será entregue com o serviço adicional valor declarado. Neste campo deve ser apresentado o valor declarado desejado, em Reais. (optional)
     - parameter avisoRecebimento: (query) Indica se a encomenda será entregue com o serviço adicional aviso de recebimento. Valores possíveis: S ou N (S - Sim, N - Não) (optional, default to N)
     - parameter codigoEmpresa: (query) Seu código administrativo junto à ECT. O código está disponível no corpo do contrato firmado com os Correios. (optional)
     - parameter senhaEmpresa: (query) Senha para acesso ao serviço, associada ao seu código administrativo. A senha inicial corresponde aos 8 primeiros dígitos do CNPJ informado no contrato. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func precosGet(clientId clientId: String, accessToken: String, codigoServico: String, cepOrigem: String, cepDestino: String, peso: Int32, formato: Int32, comprimento: Int32, altura: Int32, largura: Int32, diametro: Int32, servicoMaoPropria: String? = nil, valorDeclarado: Int32? = nil, avisoRecebimento: String? = nil, codigoEmpresa: String? = nil, senhaEmpresa: String? = nil, completion: ((data: [InlineResponse207]?, error: ErrorType?) -> Void)) {
        precosGetWithRequestBuilder(clientId: clientId, accessToken: accessToken, codigoServico: codigoServico, cepOrigem: cepOrigem, cepDestino: cepDestino, peso: peso, formato: formato, comprimento: comprimento, altura: altura, largura: largura, diametro: diametro, servicoMaoPropria: servicoMaoPropria, valorDeclarado: valorDeclarado, avisoRecebimento: avisoRecebimento, codigoEmpresa: codigoEmpresa, senhaEmpresa: senhaEmpresa).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     - GET /precos
     - Cálculo de Preços por CEP de origem, CEP de destino e tipo de entrega.
     - examples: [{contentType=application/json, example=[ {
  "codigo" : 40010,
  "resultado" : "null",
  "adicionalMaoPropria" : "0,00",
  "httpStatus" : 200,
  "valor" : "21,00",
  "valorSemAdicionais" : "21,00",
  "adicionalAvisoRecebimento" : "0,00",
  "detalhes" : "null",
  "adicionalValorDeclarado" : "0,00",
  "status" : "null"
} ]}]
     
     - parameter clientId: (header) Identificaçáo do cliente usado na autenticaçáo. 
     - parameter accessToken: (header) Access token usado na autenticaçáo. 
     - parameter codigoServico: (query) Pode conter mais de um código por consulta separados por virgula. 40010 - SEDEX Varejo, 40045 - SEDEX a Cobrar Varejo, 40215 - SEDEX 10 Varejo, 40290 - SEDEX Hoje Varejo, 41106 - PAC Varejo 
     - parameter cepOrigem: (query) CEP de Origem sem hífen.Exemplo: 05311900 
     - parameter cepDestino: (query) CEP de Destino sem hífen 
     - parameter peso: (query) Peso da encomenda, incluindo sua embalagem. O peso deve ser informado em quilogramas. Se o formato for Envelope, o valor máximo permitido será 1 kg 
     - parameter formato: (query) Formato da encomenda (incluindo embalagem). 1 - Formato caixa/pacote, 2 - Formato rolo/prisma, 3 - Envelope 
     - parameter comprimento: (query) Comprimento da encomenda (incluindo embalagem), em centímetros. 
     - parameter altura: (query) Altura da encomenda (incluindo embalagem), em centímetros. Se o formato for envelope, informar zero (0). 
     - parameter largura: (query) Largura da encomenda (incluindo embalagem), em centímetros. 
     - parameter diametro: (query) Diâmetro da encomenda (incluindo embalagem), em centímetros. 
     - parameter servicoMaoPropria: (query) Indica se a encomenda será entregue com o serviço adicional mão própria. Valores possíveis: S ou N (S - Sim, N - Não) (optional, default to N)
     - parameter valorDeclarado: (query) Indica se a encomenda será entregue com o serviço adicional valor declarado. Neste campo deve ser apresentado o valor declarado desejado, em Reais. (optional)
     - parameter avisoRecebimento: (query) Indica se a encomenda será entregue com o serviço adicional aviso de recebimento. Valores possíveis: S ou N (S - Sim, N - Não) (optional, default to N)
     - parameter codigoEmpresa: (query) Seu código administrativo junto à ECT. O código está disponível no corpo do contrato firmado com os Correios. (optional)
     - parameter senhaEmpresa: (query) Senha para acesso ao serviço, associada ao seu código administrativo. A senha inicial corresponde aos 8 primeiros dígitos do CNPJ informado no contrato. (optional)

     - returns: RequestBuilder<[InlineResponse207]> 
     */
    public class func precosGetWithRequestBuilder(clientId clientId: String, accessToken: String, codigoServico: String, cepOrigem: String, cepDestino: String, peso: Int32, formato: Int32, comprimento: Int32, altura: Int32, largura: Int32, diametro: Int32, servicoMaoPropria: String? = nil, valorDeclarado: Int32? = nil, avisoRecebimento: String? = nil, codigoEmpresa: String? = nil, senhaEmpresa: String? = nil) -> RequestBuilder<[InlineResponse207]> {
        let path = "/precos"
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "codigoServico": codigoServico,
            "cepOrigem": cepOrigem,
            "cepDestino": cepDestino,
            "peso": peso.encodeToJSON(),
            "formato": formato.encodeToJSON(),
            "comprimento": comprimento.encodeToJSON(),
            "altura": altura.encodeToJSON(),
            "largura": largura.encodeToJSON(),
            "diametro": diametro.encodeToJSON(),
            "servicoMaoPropria": servicoMaoPropria,
            "valorDeclarado": valorDeclarado?.encodeToJSON(),
            "avisoRecebimento": avisoRecebimento,
            "codigoEmpresa": codigoEmpresa,
            "senhaEmpresa": senhaEmpresa
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
        let nillableHeaders: [String: AnyObject?] = [
            "client_id": clientId,
            "access_token": accessToken
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)
 
        let requestBuilder: RequestBuilder<[InlineResponse207]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false, headers: headerParameters)
    }

}