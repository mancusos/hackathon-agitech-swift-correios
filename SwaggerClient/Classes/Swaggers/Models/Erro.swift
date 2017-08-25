//
// Erro.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class Erro: JSONEncodable {
    public var resultado: String?
    public var status: String?
    public var detalhes: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["resultado"] = self.resultado
        nillableDictionary["status"] = self.status
        nillableDictionary["detalhes"] = self.detalhes
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
