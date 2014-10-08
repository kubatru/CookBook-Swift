//
//  MasterViewController.swift
//  CookBook-Swift
//
//  Created by Jakub Truhlar on 28.08.14.
//  Copyright (c) 2014 Jakub Truhlar. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Edit/Done button (It could be done in storyboard but this is changing button)
        // self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableView Settings
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeManager.cookbook.count
    }
    
    // Fill the list with data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Default")
        
        // Custom Cell
        // Title as subview
        var textLabel = UILabel(frame: CGRectMake(79, 5, cell.frame.size.width - 120, cell.frame.size.height))
        textLabel.text = recipeManager.cookbook[indexPath.row].title
        cell.addSubview(textLabel)
        
        // Detailed text as subview
        var detailTextLabel = UILabel(frame: CGRectMake(80, 25, cell.frame.size.width - 119, cell.frame.size.height))
        
        // For loop to make a horizontal list
        detailTextLabel.text = ""
        for (var i = 0; i < recipeManager.cookbook[indexPath.row].ingedients.count; i++) {
            
            var newLine: String = recipeManager.cookbook[indexPath.row].ingedients[i]
            
            // If ingredient is NOT the last one, add comma
            if (i != recipeManager.cookbook[indexPath.row].ingedients.count - 1) {
                detailTextLabel.text = detailTextLabel.text?.stringByAppendingString("\(newLine), ")
            }
            
            // The last ingredient
            else {
                detailTextLabel.text = detailTextLabel.text?.stringByAppendingString("\(newLine)")
            }
        }
        
        detailTextLabel.font = UIFont (name: detailTextLabel.font.fontName, size: 12)
        detailTextLabel.alpha = 0.7
        cell.addSubview(detailTextLabel)
        
        // Image in imageView as subview in cell
        var imageView = UIImageView(frame: CGRectMake(15, 10, 50, 50))
        imageView.image = recipeManager.cookbook[indexPath.row].photo
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        cell.addSubview(imageView)
        
        // Little detail arrow
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        
        return cell
    }
    
    // Refresh table
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // Delete a cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            recipeManager.cookbook.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // Cell height
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        return 70
    }
    
    // Hide group with this trick of 0.01 height (0 does not work)
    func tableView(tableView: UITableView!, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    // Enter detailView
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("recipeDetail", sender: self)
    }
    
    // Segue for detailView
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "recipeDetail" {
            
            var selectedRow: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let selectedRecipe = recipeManager.cookbook[selectedRow.row]
            // Do NOT forget to add recipeDetail identifier to segueIdentifier            
            (segue.destinationViewController as DetailViewController).recipeName = selectedRecipe.title
            (segue.destinationViewController as DetailViewController).recipeIngredients = selectedRecipe.ingedients
            (segue.destinationViewController as DetailViewController).recipeImage = selectedRecipe.photo
        }
    }
    
}