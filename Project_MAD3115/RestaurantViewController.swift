//
//  RestaurantViewController.swift
//  Project_MAD3115
//
//  Created by saikrishna B on 24/11/20.
//

import UIKit

class RestaurantViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  
    @IBOutlet weak var RestaurantTable: UITableView!
    var name=""
    
    
    var Restaurants = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Restaurants=addRestaurants()
        self.navigationItem.setHidesBackButton(true, animated: true)
        RestaurantTable.delegate=self
        RestaurantTable.dataSource=self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rest=Restaurants[indexPath.row]
        let cell=tableView.dequeueReusableCell(withIdentifier: "RestCell") as! RestaurantTableViewCell
        cell.setRest(rest: rest)
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="selectRest"){
        let order=segue.destination as? OrderViewController
        order!.restName=name
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rest=Restaurants[indexPath.row]
        name=rest.RestName
        performSegue(withIdentifier: "selectRest", sender: nil)
    }
    func addRestaurants() -> [Restaurant]{
        var tempRest:[Restaurant]=[]
        let Rest1 = Restaurant(RestName: "Paradise", RestImage: #imageLiteral(resourceName: "Hyderabads-Paradise-opens-restaurant-in-Kolkata"))
        let Rest2 = Restaurant(RestName: "KFC", RestImage: #imageLiteral(resourceName: "220px-KFC_logo.svg"))
        let Rest3 = Restaurant(RestName: "Dominos", RestImage: #imageLiteral(resourceName: "Dominos.pizza"))
        let Rest4 = Restaurant(RestName: "Haret Jdoudna", RestImage: #imageLiteral(resourceName: "fattoush"))
        tempRest.append(Rest1)
        tempRest.append(Rest2)
        tempRest.append(Rest3)
        tempRest.append(Rest4)
        return tempRest
    }
    //Haret Jdoudna

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
