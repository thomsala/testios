//
//  RestaurantTableViewController.swift
//  tuto
//
//  Created by Thomas Salandre on 11/05/2020.
//  Copyright © 2020 Thomas Salandre. All rights reserved.
//

import UIKit
import Parse
import Kingfisher

class RestaurantTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var restaurantList = [Restaurant]()
    
    func loadRestaurant() {
        let query = PFQuery(className:"Restaurant")
        
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                for object in objects {
                    print(object.objectId as Any)
                    let name = object["name"] as? String
                    if name != nil {
                        
                        let userImageFile = object["picture"] as! PFFileObject
                        let url = userImageFile.url
                        let restaurant = Restaurant(name : name!, photoUrl : url!)
                        self.restaurantList.append(restaurant!)
                    }
            }
        
        self.tableView.reloadData()
    }
}
}



override func viewDidLoad() {
    super.viewDidLoad()
    
    loadRestaurant()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
}

// MARK: - Table view data source

func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return self.restaurantList.count
}


func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cellIdentifier = "RestaurantTableViewCell"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantTableViewCell  else {
        fatalError("The dequeued cell is not an instance of RestaurantTableViewCell.")
    }
    
    // Fetches the appropriate meal for the data source layout.
    let restaurant = restaurantList[indexPath.row]
    
    cell.restaurantNameLabel.text = restaurant.name
    let url = URL(string: restaurant.photoUrl)
    
    let processor = DownsamplingImageProcessor(size: cell.restaurantImageView.bounds.size)
                 |> RoundCornerImageProcessor(cornerRadius: 20)
    cell.restaurantImageView.kf.indicatorType = .activity
    cell.restaurantImageView.kf.setImage(
        with: url,
        options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage
        ])
    //cell.restaurantImageView.kf.setImage(with: url)
    // cell.ratingControl.rating = meal.rating
    
    return cell
}


/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}
