//
//  Game.swift
//  What's the Image
//
//  Created by Calvin Cantin on 18-09-04.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import Foundation
import UIKit
struct Game
{
    var correctWord: String
    var image: UIImage
    var guessedLetter: [Character]
    // création du bon mot par le joueur
    var formatedWord: String
    {
        var formateWord = ""
        let word = correctWord.lowercased()
        
        for letter in word
        {
            if guessedLetter.contains(letter)
            {
                formateWord += "\(letter)"
            }
            else
            {
                formateWord += "_"
            }
        }
        
        return formateWord
    }
    // Quand le joueur
    mutating func playerGuessed(_ letter: Character)
    {
        guessedLetter.append(letter)
    }
}
