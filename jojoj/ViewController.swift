//
//  ViewController.swift
//  jojoj
//
//  Created by re:Store on 04/10/2021.
//  Copyright © 2021 re:Store. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private lazy var game = Concentration(numberOfPairs: numberOfPairs)
  
   var numberOfPairs: Int {
        return cardButtons.count/2
    }
   private(set) var flipCount = 0{
        didSet{
                    flipCountLabel.text = "Flips: \(flipCount)";
        }
    }
   private var emojiChoices = ["🐭","🐷","🦊","🐸","🐯","🦁"]
   private var emoji = [Card : String]()
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBAction private func touchButton(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            flipCount += 1;
            game.chooseCard(at: cardNumber);
            updateViewFromModel()
        }
        else
        {
            
        }
        
    }
    
  
    @IBOutlet private var cardButtons: [UIButton]!
    
   private func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index];
            let card = game.cards[index];
            if card.isFaceUp
            {
                button.setTitle(emojiForCard(for: card), for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
            }
            else
            {
                button.setTitle("", for: UIControl.State.normal);
        button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.3560973406, blue: 0, alpha: 1);
            }
        }
    }
  private  func emojiForCard(for card: Card) -> String{
//        if  emoji[card.identifier] != nil{
//        return emoji[card.identifier]!;
//        }
//        return "?";
        if emoji[card] == nil , emojiChoices.count>0
        {
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random);
        }
        return emoji[card] ?? "?"
    }
}
extension Int{
    var arc4random: Int {
        if(self>0){
        return Int( arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return Int( arc4random_uniform(UInt32(abs(self))))
        }
        return 0;
    }
}

