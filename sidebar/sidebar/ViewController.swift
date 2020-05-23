//
//  ViewController.swift
//  sidebar
//
//  Created by Anubhav Singh on 22/05/20.
//  Copyright © 2020 Catalyst. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UIView!
    @IBOutlet weak var tablebar: UITableView!
    
    var arrimg = [#imageLiteral(resourceName: "study.png") ,#imageLiteral(resourceName: "study") ,#imageLiteral(resourceName: "orgLogo"), #imageLiteral(resourceName: "profile")]
    var arrlbl = ["Home", "About Us", "Our Team", "Contact us!"]
    var isTableViewOpen: Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrlbl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.img.image = arrimg[indexPath.row]
        cell.label.text = arrlbl[indexPath.row]
        return cell
    }
    
    // navigation from side bar to different page
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let uname:uiViewController = self.storyboard?.instantiateViewController(withIdentifier: "uname") as! uiViewController
            self.navigationController?.pushViewController(uname, animated: true)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.isHidden = true
        tablebar.backgroundColor = UIColor.white
        isTableViewOpen = false
    }
    
    
    // open and close sidebar code
    // we can use library for this
    @IBAction func sidebarbutton(_ sender: UIBarButtonItem) {
        
        tablebar.isHidden = false
        tableview.isHidden = false
        self.view.bringSubviewToFront(tableview)
        //tablebar.backgroundColor = UIColor.lightGray
        if !isTableViewOpen{
            
        isTableViewOpen = true
            tableview.frame = CGRect(x: 0, y: 0, width: 0, height: 774)
            tablebar.frame = CGRect(x: 0, y: 0, width: 0, height: 774)
            
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            
            tableview.frame = CGRect(x: 0, y: 88, width: 245, height: 774)
            tablebar.frame = CGRect(x: 0, y: 0, width: 245, height: 774)
            
            UIView.commitAnimations()
            
        }
       
            else{
            
            tablebar.isHidden = true
            tableview.isHidden = true
                
                isTableViewOpen = false
               tableview.frame = CGRect(x: 0, y: 88, width: 245, height: 774)
                          tablebar.frame = CGRect(x: 0, y: 0, width: 245, height: 774)
                
                UIView.setAnimationDuration(0.3)
                UIView.setAnimationDelegate(self)
                UIView.beginAnimations("TableAnimation", context: nil)
                
            tableview.frame = CGRect(x: 0, y: 0, width: 0, height: 774)
            tablebar.frame = CGRect(x: 0, y: 0, width: 0, height: 774)

                
                UIView.commitAnimations()
            }
        
    }
    
}
