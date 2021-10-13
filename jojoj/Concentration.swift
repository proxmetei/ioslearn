//
//  card.swift
//  jojoj
//
//  Created by re:Store on 06/10/2021.
//  Copyright © 2021 re:Store. All rights reserved.
//

import Foundation

struct Concentration  {
   private(set) var cards = [Card] ()
   private var indexOfOneAndOnlyFaceUp :Int?
    {
        get{
            var foundIndex : Int?
            for index in cards.indices
            {
                if cards[index].isFaceUp
                {
                    if foundIndex==nil
                    {
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex;
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index==newValue)
            }
        }
    }
   mutating func chooseCard(at index : Int)
    {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): choosen index not in the cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index
            {
                if cards[matchIndex] == cards[index]
                {
                    cards[matchIndex].isMatched = true;
                    cards[index].isMatched = true;
                }
                cards[index].isFaceUp = true;
            }
            else{
                indexOfOneAndOnlyFaceUp = index;
            }
        }
    }
    init(numberOfPairs: Int) {
        assert(numberOfPairs>0, "Concentration.init(\(numberOfPairs)): you must have at least 1 pair of cards")
        for _ in 1...numberOfPairs
        {
            let card = Card();
            cards += [card, card];
        }
        var shuffleCards = [Card] ()
        //var cardsInd = [cards.indices];
        var cardsInd = [Int] ();
        for  i in cards.indices
        {
            cardsInd.append(i);
        }
        while cardsInd.count > 0 {
            shuffleCards.append(cards[cardsInd.remove(at: cardsInd.count.arc4random)])
        }
        cards=shuffleCards;
    }
}
