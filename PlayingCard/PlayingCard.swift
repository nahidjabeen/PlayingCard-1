//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by William Labagnara on 3/4/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//
// Reference: Stanford Developing iOS 11 Apps with Swift Lecture 5 - Drawing:
//              https://youtu.be/BuNDzuvqR9c
//

import Foundation

struct PlayingCard : CustomStringConvertible // Protocol CustomStringConvertible helps with debug prints
{
    var description: String {
        return "\(rank)\(suit)"
    }
    
    var suit : Suit
    var rank : Rank
    
    // playing card suit with raw value association of String
    enum Suit : String, CustomStringConvertible {
        var description: String {
            return String(self.rawValue)
        }
        
        case spades = "♠︎" // pips card # used for # of pips per card
        case hearts = "♥︎"
        case clubs = "♣︎"
        case diamonds = "♦︎"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    
    
    enum Rank : CustomStringConvertible {
        var description: String {
            return String(self.order)
        }
        
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order : Int {
            switch self {
                case .ace : return 1
                case .numeric ( let pips ) : return pips
                case .face (let kind) where kind == "J" : return 11
                case .face (let kind) where kind == "Q" : return 12
                case .face (let kind) where kind == "K" : return 13
                default : return 0 // make sure switch/case is exhaustive
            }
        }
        
        // convenient array of "all" playing card ranks ace, 2...10, jack..king
        static var all : [Rank] {
            var allRanks = [ Rank.ace ] // start with ace card
            for pips in 2...10 { // then numeric cards
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")] // then remaining face cards
            return allRanks // returns all the card ranks (array)
        }
    }
}
