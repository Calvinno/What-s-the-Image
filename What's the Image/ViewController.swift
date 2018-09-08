//
//  ViewController.swift
//  What's the Image
//
//  Created by Calvin Cantin on 18-09-04.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit
//liste de mot et image
var imageAndWord = ["Maison": #imageLiteral(resourceName: "image 1"),"Bateau": #imageLiteral(resourceName: "image2") ,"Train": #imageLiteral(resourceName: "image 3"),"Vase": #imageLiteral(resourceName: "image 4")]
//récupération des clées
var theKey = Array(imageAndWord.keys)
// Nombre de clé
let totalKey = theKey.count + 1
//récupération des valeurs
var theValue = Array(imageAndWord.values)
// comptage d'image trouvé
var imageFindNumber = 0
class ViewController: UIViewController {
    // initialisation des vues
    @IBOutlet var lettersButtons: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    //Quand une lettre est pressée
    @IBAction func lettersButtonsPressed(_ sender: UIButton)
    {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        let lowCasedLetter = Character(letter.lowercased())
        currentGame.playerGuessed(lowCasedLetter)
        if currentGame.correctWord == currentGame.formatedWord
        {
            newRound()
            
        }
        updateUI()
    }
    // Actualisation de l'interface
    func updateUI()
    {
        let word = currentGame.formatedWord.map{String($0)}
        let spacingWord = word.joined(separator: " ")
        wordLabel.text = spacingWord
        imageView.image = currentGame.image
        scoreLabel.text = "Image: \(imageFindNumber)/\(totalKey)"
        
    }
    var currentGame: Game!
    // Initialisation de l'image et du mot
    func newRound()
    {
        if !theKey.isEmpty && !theValue.isEmpty
        {
        enableOrNotButton(true)
        let word = theKey.removeFirst().lowercased()
        let value = theValue.removeFirst()
        currentGame = Game(correctWord:word, image:value, guessedLetter: [])
        imageFindNumber += 1
        updateUI()
        }
        else
        {
            enableOrNotButton(false)
        }
    }
    //Activation ou désactivation de tout les bouttons
    func enableOrNotButton(_ enable: Bool)
    {
            for button in lettersButtons
            {
                button.isEnabled = enable
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        print(currentGame.correctWord)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

