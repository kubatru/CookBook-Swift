//
//  TaskManager.swift
//  CookBook-Swift
//
//  Created by Jakub Truhlar on 28.08.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

import UIKit

struct recipe {
    var title = "no title"
    var ingedients: [String] = ["no ingrediences"]
    var photo: UIImage?
}

class RecipeManager: NSObject {
    
    // Array collects structure
    var cookbook: [recipe] = [recipe(title: "Hovězí guláš", ingedients: ["Maso", "Paprika", "Mouka", "Cibule"], photo: UIImage (named: "gulas.jpg")), recipe(title: "Česnečka se sýrem", ingedients: ["Brambory", "Česnek", "Krutony", "Sýr"], photo: UIImage (named: "cesnecka.jpg"))]
    
    func newRecipe(ttl:String, ingr:[String], pht:UIImage) {
        
        cookbook.append(recipe(title: ttl,ingedients: ingr,photo: pht))
    }
}

// New instance
var recipeManager = RecipeManager()
