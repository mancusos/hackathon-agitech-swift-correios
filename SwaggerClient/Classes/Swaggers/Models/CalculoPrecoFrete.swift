//
// CalculoPrecoFrete.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Objeto com detalhes do calculo do preço do frete */
public class CalculoPrecoFrete: JSONEncodable {
    /** Código */
    public var codigo: Int32?
    /** Código HTTP para a requisição */
    public var httpStatus: Int32?
    /** Valor do Frente */
    public var valor: String?
    /** Adicional mão propria. */
    public var adicionalMaoPropria: String?
    /** Adicional aviso recebimento. */
    public var adicionalAvisoRecebimento: String?
    /** Adicional valor declarado. */
    public var adicionalValorDeclarado: String?
    /** Valor sem adicionais */
    public var valorSemAdicionais: String?
    /** Resultado do erro */
    public var resultado: String?
    /** Tipo de erro */
    public var status: String?
    /** Detalhes do erro */
    public var detalhes: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["codigo"] = self.codigo?.encodeToJSON()
        nillableDictionary["httpStatus"] = self.httpStatus?.encodeToJSON()
        nillableDictionary["valor"] = self.valor
        nillableDictionary["adicionalMaoPropria"] = self.adicionalMaoPropria
        nillableDictionary["adicionalAvisoRecebimento"] = self.adicionalAvisoRecebimento
        nillableDictionary["adicionalValorDeclarado"] = self.adicionalValorDeclarado
        nillableDictionary["valorSemAdicionais"] = self.valorSemAdicionais
        nillableDictionary["resultado"] = self.resultado
        nillableDictionary["status"] = self.status
        nillableDictionary["detalhes"] = self.detalhes
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}