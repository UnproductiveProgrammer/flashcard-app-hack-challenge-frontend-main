//
//  Set.swift
//  Flashcard
//
//  Created by Kelly Ryoo on 12/3/20.
//

import Foundation

struct FlashcardSet{
    var name: String
    var id: Int
    //public var flashcards: [String: String]
    //public var terms: [String]
    //public var definitions: [String]
    public var flashcards: [Flashcard]
    // flashcard is another class
    // flashcards is a list of flashcard
    // one flashcard has 1 term and 1 definition
}

/*
 add set button on main page
 - brings to new view controller with new set screen
 - set limit to how many terms someone can add
 
 */
