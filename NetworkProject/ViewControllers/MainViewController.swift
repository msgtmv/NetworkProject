//
//  MainViewController.swift
//  NetworkProject
//
//  Created by Муслим Гаппаров on 3/19/24.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pagesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetch(MainBoard.self, withURL: "https://a.4cdn.org/boards.json") { [weak self] result in
            switch result {
            case .success(let mainBoard):
                let board = mainBoard.boards[1]
                self?.titleLabel.text = "Title: \(board.title)"
                self?.pagesLabel.text = "Number of pages: \(board.pages.formatted())"
            case .failure(let error):
                print(error)
                self?.titleLabel.text = "No title"
                self?.pagesLabel.text = "No pages"
            }
        }
    }


}

