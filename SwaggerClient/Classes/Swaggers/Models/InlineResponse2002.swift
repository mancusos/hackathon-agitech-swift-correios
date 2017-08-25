//
// InlineResponse2002.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Postal Object model */
public class InlineResponse2002: JSONEncodable {
    /** Número do Objeto Postal */
    public var numero: String?
    public var eventos: [ObjetosEventos]?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["numero"] = self.numero
        nillableDictionary["eventos"] = self.eventos?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
