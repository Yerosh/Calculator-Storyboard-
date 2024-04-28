//
//  ViewController.swift
//  calculator2
//
//  Created by Yernur Adilbek on 9/27/23.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    
    var firstNum: String = "";
    var secondNum: String = "";
    var operation: String = "";
    
    var haveResult: Bool = false;
    
    var resultNumber: String = "";
    var numAfterResult: String = "";
    

    @IBOutlet weak var myLabel: UILabel!

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var back: UIView!
    
    @IBOutlet var themeButtons: [UIButton]!
    
    @IBOutlet weak var colorPicker: UIColorWell!
    
    @IBAction func colorChanger(_ sender: UIColorWell){
        back.backgroundColor = sender.selectedColor
    }
    
    @IBAction func dark(_ sender: Any) {
        back.backgroundColor = UIColor.black
    }
    @IBAction func light(_ sender: Any) {
        back.backgroundColor = UIColor.white
    }
    @IBAction func red(_ sender: Any) {
        selectorColor()
    }

    
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    @IBAction func multiply(_ sender: Any) {
        operation = "x"
    }
    @IBAction func substract(_ sender: Any) {
        operation = "-"
    }
    @IBAction func plus(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperations())
        let resArray = resultNumber.components(separatedBy: ".")
        if resArray[1] == "0"{
            myLabel.text = resArray[0]
        }else{
            myLabel.text = resultNumber
        }
        numAfterResult = ""
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == ""{
            firstNum += String(sender.tag);
            myLabel.text = firstNum;
        }else if operation != "" && !haveResult{
            secondNum += String(sender.tag);
            myLabel.text = secondNum;
        }else if operation != "" && haveResult{
            numAfterResult += String(sender.tag)
            myLabel.text = numAfterResult;
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        firstNum = ""
        secondNum = ""
        operation = ""
        haveResult = false
        resultNumber = ""
        numAfterResult = ""
        myLabel.text = "0"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for b in buttons{
            b.layer.cornerRadius = b.frame.size.height / 2;
            b.layer.masksToBounds = true
        }
        
    }
    
    
    
    func doOperations() -> Double{
        if operation == "+"{
            if !haveResult{
                haveResult = true;
                return Double(firstNum)! + Double(secondNum)!
            }else{
                return Double(resultNumber)! + Double(numAfterResult)!
            }
        }
        else if operation == "-"{
            if !haveResult{
                haveResult = true;
                return Double(firstNum)! - Double(secondNum)!
            }else{
                return Double(resultNumber)! - Double(numAfterResult)!
            }
        }
        else if operation == "x"{
            if !haveResult{
                haveResult = true;
                return Double(firstNum)! * Double(secondNum)!
            }else{
                return Double(resultNumber)! * Double(numAfterResult)!
            }
        }
        else if operation == "/"{
            if !haveResult{
                haveResult = true;
                return Double(firstNum)! / Double(secondNum)!
            }else{
                return Double(resultNumber)! / Double(numAfterResult)!
            }
        }
        
        return 0
    }
    
    
    @objc private func selectorColor(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        view.backgroundColor = color
    }


}
