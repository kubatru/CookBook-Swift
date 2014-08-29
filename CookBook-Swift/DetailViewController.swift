//
//  DetailViewController.swift
//  CookBook-Swift
//
//  Created by Jakub Truhlar on 28.08.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet var recipeNameLabel: UILabel?
    @IBOutlet var recipeIngredientsView: UITextView?
    @IBOutlet var recipeImageView: UIImageView?
    
    // Local variables
    var recipeName: String?
    var recipeIngredients: [String] = [""]
    var recipeImage: UIImage?
    
    // Gets data after cell is selected
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Title
        self.recipeNameLabel?.text = recipeName
        
        // ---
        
        // For loop to make a vertical list
        recipeIngredientsView?.text = ""
        for (var i = 0; i < recipeIngredients.count; i++) {
            
            recipeIngredientsView?.text = recipeIngredientsView?.text.stringByAppendingString("· \(recipeIngredients[i]) \n")
        }
        // Some graphic changes
        recipeIngredientsView?.textColor = UIColor.grayColor()
        recipeIngredientsView?.textAlignment = NSTextAlignment.Center
        
        // ---
        
        // Image with subview for rounded corners etc.
        var recipeImageViewEdited = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width/2.1, self.view.frame.size.width/2.1))
        recipeImageViewEdited.image = recipeImage
        
        recipeImageViewEdited.layer.cornerRadius = (self.view.frame.size.width/2.1)/2
        recipeImageViewEdited.layer.borderWidth = 1
        recipeImageViewEdited.layer.borderColor = UIColor.grayColor().CGColor
        recipeImageViewEdited.clipsToBounds = true
        self.recipeImageView?.addSubview(recipeImageViewEdited)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

