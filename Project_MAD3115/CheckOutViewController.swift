//
//  CheckOutViewController.swift
//  Project_MAD3115
//
//  Created by saikrishna B on 24/11/20.
//

import UIKit

class CheckOutViewController: UIViewController {
    var mealTime=[String]()
    var mealType=""
    var mealPlan="Weekly"
    var entireMeal=""
    @IBOutlet weak var OrderSummary: UITextView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //OrderSummary.text="Plan-Selected:\(mealPlan)\n\nMeal-Time:\(mealTime)\n\nMealType:\(mealType)"
        // Do any additional setup after loading the view.
        OrderSummary.text=mealtime()
    }
    

    @IBAction func Order(_ sender: Any) {
        let alert=UIAlertController(title: "Successful", message: "Order Placed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "home", sender: nil)
        }))
            
        self.present(alert, animated: true, completion: nil)
    }
    func mealtime()->String{
        entireMeal="Plan-Selected:\(mealPlan)\n\nMeal-Time:"
        for meal in mealTime{
            entireMeal += meal+","
        }
        entireMeal += "\n\nMealType:\(mealType)"
        return entireMeal
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
