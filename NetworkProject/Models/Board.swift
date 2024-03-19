//
//  Board.swift
//  NetworkProject
//
//  Created by Муслим Гаппаров on 3/19/24.
//

import Foundation

struct MainBoard: Decodable {
    let boards: [Board]
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
