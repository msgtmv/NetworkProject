//
//  Board.swift
//  NetworkProject
//
//  Created by Муслим Гаппаров on 3/19/24.
//

import Foundation

struct MainBoard: Decodable {
    let boards: [Board]
    
    init(boards: [Board]) {
        self.boards = boards
    }
    
    init(boardData: [String: Any]) {
        boards = boardData["boards"] as? [Board] ?? []
    }
    
    static func getMainBoard(from value: Any) -> MainBoard {
        guard let value = value as? [String: Any] else { return MainBoard(boards: []) }
        return MainBoard(boardData: value)
    }
}

struct Board: Decodable {
    let board: String
    let title: String
    let pages: Int
    let wsBoard: Int
    let perPage: Int
    let maxFilesize: Int
    let maxWebmFilesize: Int
    let maxCommentChars: Int
    let maxWebmDuration: Int
    let bumpLimit: Int
    let imageLimit: Int
    let metaDescription: String
    let cooldowns: Cooldown
}

struct Cooldown: Decodable {
    let threads: Int
    let replies: Int
    let images: Int
}
