//
//  OrderViewController.swift
//  Project_MAD3115
//
//  Created by saikrishna B on 24/11/20.
//

import UIKit

class OrderViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var planSelected=""
    var mealTimeSelected=[String]()
    var mealTypeSelected=""
    var plans=["Weekly","Bi-Weekly","Monthly"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        plans.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        plans[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        planSelected=plans[row]
    }

    @IBOutlet weak var plansPicker: UIPickerView!
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    @IBOutlet weak var vegButton: UIButton!
    @IBOutlet weak var nonVegButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        plansPicker.delegate=self
        plansPicker.dataSource=self
        planSelected=plans[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func MealTime(_ sender: UIButton) {
        
        if sender.tag==0{
            if breakfastButton.isSelected==false{
                breakfastButton.isSelected=true
            mealTimeSelected.append("Breakfast")
            }
            else if breakfastButton.isSelected==true{
                breakfastButton.isSelected=false
                mealTimeSelected.removeAll(where: {$0=="Breakfast"})
            }
            
        }
        if sender.tag==1{
            if lunchButton.isSelected==false{
                lunchButton.isSelected=true
            mealTimeSelected.append("Lunch")
            }
            else if lunchButton.isSelected==true{
                lunchButton.isSelected=false
                mealTimeSelected.removeAll(where: {$0=="Lunch"})
            }
        }
        if sender.tag==2{
            if dinnerButton.isSelected==false{
                dinnerButton.isSelected=true
            mealTimeSelected.append("Dinner")
            }
            else if dinnerButton.isSelected==true{
                dinnerButton.isSelected=false
                mealTimeSelected.removeAll(where: {$0=="Dinner"})
            }
        }
    }
    
    @IBAction func MealType(_ sender: UIButton) {
        vegButton.isSelected=false
        nonVegButton.isSelected=false
        if sender.tag==0{
            vegButton.isSelected=true
            mealTypeSelected="Veg"
        }
        else if sender.tag==1{
            nonVegButton.isSelected=true
            mealTypeSelected="Non-Veg"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var check = segue.destination as! CheckOutViewController
        check.mealPlan=planSelected
        check.mealType=mealTypeSelected
        check.mealTime=mealTimeSelected
        
    }
    
    
     @IBAction func Proceed(_ sender: Any) {
        debugPrint(planSelected)
        debugPrint(mealTimeSelected)
        debugPrint(mealTypeSelected)
        performSegue(withIdentifier: "checkout", sender:self)
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
