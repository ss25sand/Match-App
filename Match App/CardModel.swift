//
//  CardModel.swift
//  Match App
//
//  Created by Saman Sandhu on 2019-12-21.
//  Copyright © 2019 Saman Sandhu. All rights reserved.
//

// has most utility functions (non-UI stuff)
import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare an array to store the numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            // Get a random number
            let randomNum = arc4random_uniform(13) + 1
            
            // Ensure that the random number isn't one we already have
            if !generatedNumbersArray.contains(Int(randomNum)) {
             
                // Log the number
                print(randomNum)
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(Int(randomNum))
                
                let firstCard = Card()
                firstCard.imageName = "card\(randomNum)"
                
                let secondCard = Card()
                secondCard.imageName = "card\(randomNum)"
                
                generatedCardsArray += [firstCard, secondCard]
                
            }
            
        }
        
        // Randomize the array
        
        for i in 0...generatedCardsArray.count-1 {
            
            // Find a random index to swap with
            let randomNum = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            // Swap the two cards
            let temp = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNum]
            generatedCardsArray[randomNum] = temp
            
        }
        
        // Return the array
        return generatedCardsArray
    }
    
}
