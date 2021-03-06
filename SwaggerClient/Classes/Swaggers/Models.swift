// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> AnyObject
}

public enum ErrorResponse : ErrorType {
    case Error(Int, NSData?, ErrorType)
}

public class Response<T> {
    public let statusCode: Int
    public let header: [String: String]
    public let body: T?

    public init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: NSHTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for (key, value) in rawHeader {
            header[key as! String] = value as? String
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

private var once = dispatch_once_t()
class Decoders {
    static private var decoders = Dictionary<String, ((AnyObject) -> AnyObject)>()

    static func addDecoder<T>(clazz clazz: T.Type, decoder: ((AnyObject) -> T)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0) as! AnyObject }
    }

    static func decode<T>(clazz clazz: [T].Type, source: AnyObject) -> [T] {
        let array = source as! [AnyObject]
        return array.map { Decoders.decode(clazz: T.self, source: $0) }
    }

    static func decode<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject) -> [Key:T] {
        let sourceDictionary = source as! [Key: AnyObject]
        var dictionary = [Key:T]()
        for (key, value) in sourceDictionary {
            dictionary[key] = Decoders.decode(clazz: T.self, source: value)
        }
        return dictionary
    }

    static func decode<T>(clazz clazz: T.Type, source: AnyObject) -> T {
        initialize()
        if T.self is Int32.Type && source is NSNumber {
            return source.intValue as! T;
        }
        if T.self is Int64.Type && source is NSNumber {
            return source.longLongValue as! T;
        }
        if T.self is NSUUID.Type && source is String {
            return NSUUID(UUIDString: source as! String) as! T
        }
        if source is T {
            return source as! T
        }
        if T.self is NSData.Type && source is String {
            return NSData(base64EncodedString: source as! String, options: NSDataBase64DecodingOptions()) as! T
        }

        let key = "\(T.self)"
        if let decoder = decoders[key] {
           return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decodeOptional<T>(clazz clazz: T.Type, source: AnyObject?) -> T? {
        if source is NSNull {
            return nil
        }
        return source.map { (source: AnyObject) -> T in
            Decoders.decode(clazz: clazz, source: source)
        }
    }

    static func decodeOptional<T>(clazz clazz: [T].Type, source: AnyObject?) -> [T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject?) -> [Key:T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [Key:T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static private func initialize() {
        dispatch_once(&once) {
            let formatters = [
                "yyyy-MM-dd",
                "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss'Z'",
                "yyyy-MM-dd'T'HH:mm:ss.SSS"
            ].map { (format: String) -> NSDateFormatter in
                let formatter = NSDateFormatter()
                formatter.locale = NSLocale(localeIdentifier:"en_US_POSIX")
                formatter.dateFormat = format
                return formatter
            }
            // Decoder for NSDate
            Decoders.addDecoder(clazz: NSDate.self) { (source: AnyObject) -> NSDate in
               if let sourceString = source as? String {
                    for formatter in formatters {
                        if let date = formatter.dateFromString(sourceString) {
                            return date
                        }
                    }

                }
                if let sourceInt = source as? Int {
                    // treat as a java date
                    return NSDate(timeIntervalSince1970: Double(sourceInt / 1000) )
                }
                fatalError("formatter failed to parse \(source)")
            } 

            // Decoder for [CalculoPrecoFrete]
            Decoders.addDecoder(clazz: [CalculoPrecoFrete].self) { (source: AnyObject) -> [CalculoPrecoFrete] in
                return Decoders.decode(clazz: [CalculoPrecoFrete].self, source: source)
            }
            // Decoder for CalculoPrecoFrete
            Decoders.addDecoder(clazz: CalculoPrecoFrete.self) { (source: AnyObject) -> CalculoPrecoFrete in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = CalculoPrecoFrete()
                instance.codigo = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["codigo"])
                instance.httpStatus = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["httpStatus"])
                instance.valor = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["valor"])
                instance.adicionalMaoPropria = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalMaoPropria"])
                instance.adicionalAvisoRecebimento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalAvisoRecebimento"])
                instance.adicionalValorDeclarado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalValorDeclarado"])
                instance.valorSemAdicionais = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["valorSemAdicionais"])
                instance.resultado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["resultado"])
                instance.status = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["status"])
                instance.detalhes = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["detalhes"])
                return instance
            }


            // Decoder for [DetalhesEventos]
            Decoders.addDecoder(clazz: [DetalhesEventos].self) { (source: AnyObject) -> [DetalhesEventos] in
                return Decoders.decode(clazz: [DetalhesEventos].self, source: source)
            }
            // Decoder for DetalhesEventos
            Decoders.addDecoder(clazz: DetalhesEventos.self) { (source: AnyObject) -> DetalhesEventos in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = DetalhesEventos()
                instance.tipoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["tipoEvento"])
                instance.statusEvento = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["statusEvento"])
                instance.descricaoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["descricaoEvento"])
                return instance
            }


            // Decoder for [Endereco]
            Decoders.addDecoder(clazz: [Endereco].self) { (source: AnyObject) -> [Endereco] in
                return Decoders.decode(clazz: [Endereco].self, source: source)
            }
            // Decoder for Endereco
            Decoders.addDecoder(clazz: Endereco.self) { (source: AnyObject) -> Endereco in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Endereco()
                instance.logradouro = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["logradouro"])
                instance.bairro = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["bairro"])
                instance.municipio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["municipio"])
                instance.uf = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["uf"])
                return instance
            }


            // Decoder for [Erro]
            Decoders.addDecoder(clazz: [Erro].self) { (source: AnyObject) -> [Erro] in
                return Decoders.decode(clazz: [Erro].self, source: source)
            }
            // Decoder for Erro
            Decoders.addDecoder(clazz: Erro.self) { (source: AnyObject) -> Erro in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Erro()
                instance.resultado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["resultado"])
                instance.status = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["status"])
                instance.detalhes = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["detalhes"])
                return instance
            }


            // Decoder for [Eventos]
            Decoders.addDecoder(clazz: [Eventos].self) { (source: AnyObject) -> [Eventos] in
                return Decoders.decode(clazz: [Eventos].self, source: source)
            }
            // Decoder for Eventos
            Decoders.addDecoder(clazz: Eventos.self) { (source: AnyObject) -> Eventos in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Eventos()
                instance.codigoObjeto = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoObjeto"])
                instance.tipoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["tipoEvento"])
                instance.statusEvento = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["statusEvento"])
                instance.descricaoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["descricaoEvento"])
                instance.nomeUnidade = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["nomeUnidade"])
                instance.codigoSRO = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoSRO"])
                instance.municipio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["municipio"])
                instance.uf = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["uf"])
                instance.codigoMCU = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoMCU"])
                instance.codigoDR = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoDR"])
                instance.siglaDR = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["siglaDR"])
                instance.numeroLista = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["numeroLista"])
                instance.estacao = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["estacao"])
                instance.usuario = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["usuario"])
                instance.dataGravacao = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["dataGravacao"])
                instance.entregador = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["entregador"])
                instance.dataCriacao = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["dataCriacao"])
                instance.acaoBloqueio = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["acaoBloqueio"])
                return instance
            }


            // Decoder for [FaixaCEP]
            Decoders.addDecoder(clazz: [FaixaCEP].self) { (source: AnyObject) -> [FaixaCEP] in
                return Decoders.decode(clazz: [FaixaCEP].self, source: source)
            }
            // Decoder for FaixaCEP
            Decoders.addDecoder(clazz: FaixaCEP.self) { (source: AnyObject) -> FaixaCEP in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = FaixaCEP()
                instance.nome = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["nome"])
                instance.inicio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["inicio"])
                instance.fim = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["fim"])
                return instance
            }


            // Decoder for [InlineResponse200]
            Decoders.addDecoder(clazz: [InlineResponse200].self) { (source: AnyObject) -> [InlineResponse200] in
                return Decoders.decode(clazz: [InlineResponse200].self, source: source)
            }
            // Decoder for InlineResponse200
            Decoders.addDecoder(clazz: InlineResponse200.self) { (source: AnyObject) -> InlineResponse200 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse200()
                instance.nome = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["nome"])
                instance.inicio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["inicio"])
                instance.fim = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["fim"])
                return instance
            }


            // Decoder for [InlineResponse2001]
            Decoders.addDecoder(clazz: [InlineResponse2001].self) { (source: AnyObject) -> [InlineResponse2001] in
                return Decoders.decode(clazz: [InlineResponse2001].self, source: source)
            }
            // Decoder for InlineResponse2001
            Decoders.addDecoder(clazz: InlineResponse2001.self) { (source: AnyObject) -> InlineResponse2001 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse2001()
                instance.logradouro = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["logradouro"])
                instance.bairro = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["bairro"])
                instance.municipio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["municipio"])
                instance.uf = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["uf"])
                return instance
            }


            // Decoder for [InlineResponse2002]
            Decoders.addDecoder(clazz: [InlineResponse2002].self) { (source: AnyObject) -> [InlineResponse2002] in
                return Decoders.decode(clazz: [InlineResponse2002].self, source: source)
            }
            // Decoder for InlineResponse2002
            Decoders.addDecoder(clazz: InlineResponse2002.self) { (source: AnyObject) -> InlineResponse2002 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse2002()
                instance.numero = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["numero"])
                instance.eventos = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["eventos"])
                return instance
            }


            // Decoder for [InlineResponse2003]
            Decoders.addDecoder(clazz: [InlineResponse2003].self) { (source: AnyObject) -> [InlineResponse2003] in
                return Decoders.decode(clazz: [InlineResponse2003].self, source: source)
            }
            // Decoder for InlineResponse2003
            Decoders.addDecoder(clazz: InlineResponse2003.self) { (source: AnyObject) -> InlineResponse2003 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse2003()
                instance.tipoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["tipoEvento"])
                instance.statusEvento = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["statusEvento"])
                instance.descricaoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["descricaoEvento"])
                return instance
            }


            // Decoder for [InlineResponse207]
            Decoders.addDecoder(clazz: [InlineResponse207].self) { (source: AnyObject) -> [InlineResponse207] in
                return Decoders.decode(clazz: [InlineResponse207].self, source: source)
            }
            // Decoder for InlineResponse207
            Decoders.addDecoder(clazz: InlineResponse207.self) { (source: AnyObject) -> InlineResponse207 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse207()
                instance.codigo = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["codigo"])
                instance.httpStatus = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["httpStatus"])
                instance.valor = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["valor"])
                instance.adicionalMaoPropria = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalMaoPropria"])
                instance.adicionalAvisoRecebimento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalAvisoRecebimento"])
                instance.adicionalValorDeclarado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["adicionalValorDeclarado"])
                instance.valorSemAdicionais = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["valorSemAdicionais"])
                instance.resultado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["resultado"])
                instance.status = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["status"])
                instance.detalhes = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["detalhes"])
                return instance
            }


            // Decoder for [InlineResponse400]
            Decoders.addDecoder(clazz: [InlineResponse400].self) { (source: AnyObject) -> [InlineResponse400] in
                return Decoders.decode(clazz: [InlineResponse400].self, source: source)
            }
            // Decoder for InlineResponse400
            Decoders.addDecoder(clazz: InlineResponse400.self) { (source: AnyObject) -> InlineResponse400 in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = InlineResponse400()
                instance.resultado = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["resultado"])
                instance.status = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["status"])
                instance.detalhes = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["detalhes"])
                return instance
            }


            // Decoder for [ObjetoPostal]
            Decoders.addDecoder(clazz: [ObjetoPostal].self) { (source: AnyObject) -> [ObjetoPostal] in
                return Decoders.decode(clazz: [ObjetoPostal].self, source: source)
            }
            // Decoder for ObjetoPostal
            Decoders.addDecoder(clazz: ObjetoPostal.self) { (source: AnyObject) -> ObjetoPostal in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = ObjetoPostal()
                instance.numero = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["numero"])
                instance.eventos = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["eventos"])
                return instance
            }


            // Decoder for [ObjetosEventos]
            Decoders.addDecoder(clazz: [ObjetosEventos].self) { (source: AnyObject) -> [ObjetosEventos] in
                return Decoders.decode(clazz: [ObjetosEventos].self, source: source)
            }
            // Decoder for ObjetosEventos
            Decoders.addDecoder(clazz: ObjetosEventos.self) { (source: AnyObject) -> ObjetosEventos in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = ObjetosEventos()
                instance.codigoObjeto = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoObjeto"])
                instance.tipoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["tipoEvento"])
                instance.statusEvento = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["statusEvento"])
                instance.descricaoEvento = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["descricaoEvento"])
                instance.nomeUnidade = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["nomeUnidade"])
                instance.codigoSRO = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoSRO"])
                instance.municipio = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["municipio"])
                instance.uf = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["uf"])
                instance.codigoMCU = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoMCU"])
                instance.codigoDR = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["codigoDR"])
                instance.siglaDR = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["siglaDR"])
                instance.numeroLista = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["numeroLista"])
                instance.estacao = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["estacao"])
                instance.usuario = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["usuario"])
                instance.dataGravacao = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["dataGravacao"])
                instance.entregador = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["entregador"])
                instance.dataCriacao = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["dataCriacao"])
                instance.acaoBloqueio = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["acaoBloqueio"])
                return instance
            }
        }
    }
}
