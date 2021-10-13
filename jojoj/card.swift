//
//  Concentation.swift
//  jojoj
//
//  Created by re:Store on 06/10/2021.
//  Copyright © 2021 re:Store. All rights reserved.
//

import Foundation
struct Card: Hashable
{
    var hashValue: Int {  return identifier; }
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier==rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
   private  var identifier: Int
   private static var identifierFactory = 0
   private static func getUniqueId() -> Int
    {
        identifierFactory += 1
        return identifierFactory;
    }
    init() {
        self.identifier = Card.getUniqueId();
    }
}
