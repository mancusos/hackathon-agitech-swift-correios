//
// ObjetosEventos.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Customer Model */
public class ObjetosEventos: JSONEncodable {
    /** Código do Objeto */
    public var codigoObjeto: String?
    /** Tipo do Evento */
    public var tipoEvento: String?
    /** Status do Evento */
    public var statusEvento: Int32?
    /** Descrição do Evento */
    public var descricaoEvento: String?
    /** Nome da Unidade */
    public var nomeUnidade: String?
    /** Código do SRO */
    public var codigoSRO: String?
    /** Nome do Municipio */
    public var municipio: String?
    /** Sigla do Estado */
    public var uf: String?
    /** Código do MCU */
    public var codigoMCU: String?
    /** Código DR */
    public var codigoDR: String?
    /** Sigla do DR */
    public var siglaDR: String?
    /** Número na Lista */
    public var numeroLista: String?
    /** Estação */
    public var estacao: Int32?
    /** Nome do Usuário */
    public var usuario: String?
    /** Data da Gravação */
    public var dataGravacao: String?
    /** Entregador */
    public var entregador: String?
    /** Data de Criação */
    public var dataCriacao: String?
    /** Ação de Bloqueio */
    public var acaoBloqueio: Int32?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["codigoObjeto"] = self.codigoObjeto
        nillableDictionary["tipoEvento"] = self.tipoEvento
        nillableDictionary["statusEvento"] = self.statusEvento?.encodeToJSON()
        nillableDictionary["descricaoEvento"] = self.descricaoEvento
        nillableDictionary["nomeUnidade"] = self.nomeUnidade
        nillableDictionary["codigoSRO"] = self.codigoSRO
        nillableDictionary["municipio"] = self.municipio
        nillableDictionary["uf"] = self.uf
        nillableDictionary["codigoMCU"] = self.codigoMCU
        nillableDictionary["codigoDR"] = self.codigoDR
        nillableDictionary["siglaDR"] = self.siglaDR
        nillableDictionary["numeroLista"] = self.numeroLista
        nillableDictionary["estacao"] = self.estacao?.encodeToJSON()
        nillableDictionary["usuario"] = self.usuario
        nillableDictionary["dataGravacao"] = self.dataGravacao
        nillableDictionary["entregador"] = self.entregador
        nillableDictionary["dataCriacao"] = self.dataCriacao
        nillableDictionary["acaoBloqueio"] = self.acaoBloqueio?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
