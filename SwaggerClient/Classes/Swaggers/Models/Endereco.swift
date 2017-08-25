//
// Endereco.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Customer Model */
public class Endereco: JSONEncodable {
    /** Nome do logradouro */
    public var logradouro: String?
    /** Nome do Bairro */
    public var bairro: String?
    /** Nome do municipio */
    public var municipio: String?
    /** Estado */
    public var uf: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["logradouro"] = self.logradouro
        nillableDictionary["bairro"] = self.bairro
        nillableDictionary["municipio"] = self.municipio
        nillableDictionary["uf"] = self.uf
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
