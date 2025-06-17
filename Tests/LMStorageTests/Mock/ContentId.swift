//
//  ContentId.swift
//  LMStorage
//
//  Created by Paulo Henrique Oliveira Souza on 17/06/25.
//

@testable import LMStorage

struct ContentId: LMCodable {
    var id: String?
    var seriesTmdb: String?
    var source: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case seriesTmdb = "seriesTmdb"
        case source = "source"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(seriesTmdb, forKey: .seriesTmdb)
        try container.encode(source, forKey: .source)
    }
}
