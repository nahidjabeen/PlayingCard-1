//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by William Labagnara on 3/4/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private (set) var cards = [ PlayingCard ] ()
    
    // initializer
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append( PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw () -> PlayingCard? { // How many cards you take out of deck
        
        if cards.count > 0 {
            return cards.remove ( at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
}

// Adding extension to Int type
extension Int {
    var arc4random : Int {
        
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
