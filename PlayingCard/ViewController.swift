//
//  ViewController.swift
//  PlayingCard
//
//  Created by William Labagnara on 3/4/19.
//  Copyright © 2019 William Labagnara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        for _ in 1...20 {
            if let card = deck.draw() {
                print ( "\(card)" )
            }
        }
    }


}

