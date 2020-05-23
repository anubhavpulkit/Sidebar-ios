//
//  ViewController.swift
//  Side Menu with library
//
//  Created by Anubhav Singh on 24/05/20.
//  Copyright © 2020 Catalyst. All rights reserved.
//
import SideMenu
import UIKit

class ViewController: UIViewController {

    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menu = SideMenuNavigationController(rootViewController: UIViewController())
        menu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }

    @IBAction func didtapmenu(_ sender: UIButton) {
        present(menu!, animated: true)
    }
    
}

