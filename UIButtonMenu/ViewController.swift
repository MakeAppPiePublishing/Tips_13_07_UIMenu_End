//
//  ViewController.swift
//  UIButtonMenu
//
//  Created by Steven Lipton on 11/4/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 13 (Q1 2021) video 07
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Learn how to add menus to UIButtons
//  For more code, go to http://bit.ly/AppPieGithub

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    //SF Symbols used below
    let minus = UIImage(systemName:"minus.square")
    let plus = UIImage(systemName:"plus.square")
    let bkColor = UIImage(systemName:"rectangle.lefthalf.fill")
    
    //count is our very small model
    var count = 0
    //Outlets
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    //Actions
    @IBAction func addButton(_ sender: UIButton) {
        
        updateLabel(by:1)
    }
    
    //Display the change in a label
    func updateLabel(by:Int){
        count += by
        label.text = "Count: \(count)"
    }
    // Color picker functionality
    func presentColorPicker(){
        let picker = UIColorPickerViewController()
        picker.delegate = self
        self.present(picker,animated: true)
    }
    //changes on selection
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
    }
    //changes on dismiss
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        view.backgroundColor = viewController.selectedColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(by: 0)
        addButton.layer.cornerRadius = 10.0
        let subtractAction = UIAction(title:"Subtract", image: minus){
            (action) in
            self.updateLabel(by: -1)
        }
        let backgroundAction = UIAction(title:"Background Color", image: bkColor){
            (action) in
            self.presentColorPicker()
        }
        let addCommand = UICommand(title:"Add", image: plus, action: #selector(addButton(_ :)), propertyList:nil)
        let math = UIMenu(title:"Math", children: [addCommand, subtractAction])
        let menu = UIMenu(title:"Options", children: [addCommand, subtractAction,backgroundAction, math])
        addButton.menu = menu
        addButton.showsMenuAsPrimaryAction = true
        barButton.menu = menu
       
    }


}

