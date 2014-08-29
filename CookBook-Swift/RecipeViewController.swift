//
//  TaskViewController.swift
//  CookBook-Swift
//
//  Created by Jakub Truhlar on 28.08.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

import UIKit
import MobileCoreServices

class RecipeViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var recipeNameField: UITextField!
    @IBOutlet var recipeIngredientsField: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBAction func addBtnPressed(sender: UIButton) {
        
        // Only if both fields are not empty and image is selected
        if !recipeNameField.text.isEqual("") && !recipeIngredientsField.text.isEqual("") && (!imageView.image == nil || imageView.image != UIImage (named: "unknown.jpg")) {
            
            var recipeIngredients: [String] = []
            recipeIngredients = recipeIngredientsField.text.componentsSeparatedByString(",")
            // Send data from fields to structure
            recipeManager.newRecipe(recipeNameField.text, ingr: recipeIngredients, pht: imageView.image)
            
            // Hide keyboard
            self.view.endEditing(true)
        
            // Reset fields
            recipeNameField.text = ""
            recipeIngredientsField.text = ""
            
            // Go back to the tableView scene
            navigationController.popViewControllerAnimated(true)
            
        }
    }
    
    // Hide the keyboard when touch ends
    // Dont forget to set both TextFields as delegete to make it works
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    // Hide the keyboard when the Enter button is pressed
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    // Image Picker View
    @IBAction func chooseImage(sender: UIButton) {
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePickerController.allowsEditing = false
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // Constructor with imageView settings
    
    override func viewDidLoad() {
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.alpha = 0.1
        imageView.image = UIImage (named: "unknown.jpg")
    }
    
    
    // Selected image
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        
        // End the library view
        dismissViewControllerAnimated(true, completion: nil)
        
        // selected image + settings
        imageView.image = image
        imageView.alpha = 1.0
        // Set border color
        // imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 0
    }
}
