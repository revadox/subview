//
//  ViewController.swift
//  calender
//
//  Created by darshan on 03/01/18.
//  Copyright © 2018 darshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var subViewPageController: UIPageControl!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var subView: UIView!
    
    @IBOutlet var labelSubView: UILabel!

    
    @IBOutlet var optionButton: [UIButton]!//uibutton collection property so any change like color font apply to all three button
    
    let user1 = ["name":"user1","image":"user1"]
    let user2 = ["name":"user1","image":"user3"]
    
    var userArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in optionButton {
            button.setTitleColor(#colorLiteral(red: 1, green: 0.4327109567, blue: 0.3853716665, alpha: 1), for: .normal)//change color of all three button
        }
        
        userArray = [user1,user2]
        scrollView.isPagingEnabled = true//it is enable page like slider support
        scrollView.contentSize = CGSize(width:self.view.bounds.width * CGFloat(userArray.count)  ,height:191)//height is fixed but width is like one page so if we have 3 screen then (width of one screen*3)
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        
        dataLoad()
        
//        self.view.addSubview(subView)//add subview
//        labelSubView.textColor =  #colorLiteral(red: 0.5289530693, green: 1, blue: 0.9960366176, alpha: 1)
//

//
//        if let subView2 = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as? ExtraView {
//
//            self.view.addSubview(subView2)
//            subView2.ExtraLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
//
//        }
//
        if let subView3 = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as? ExtraView {
            
            self.view.addSubview(subView3)
            subView3.frame.origin.y = 0
            subView3.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            subView3.ExtraLabel.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            
        }
        
    }
    
    func dataLoad() {
        
        for (index,user) in userArray.enumerated() {
            
            if let subview = Bundle.main.loadNibNamed("slider", owner: self, options: nil)?.first as? SliderView {
                subview.imageView.image = UIImage(named : user["image"]!)
                subview.labelScroll.text = user["name"]
                
                scrollView.addSubview(subview)
                subview.frame.size.width = self.view.bounds.size.width
                subview.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
                
            }
            
        }
        
    }

    @IBAction func tapButton(_ sender: UIButton) {
        
        //        here all there button connect with same tapButton
        //        if all connect with same buttton how can we know which button pressed????
        //        two way....
        //        1 way
        
        let button  = sender //make object of button and cast to UIButton
        
        //        print(((button.titleLabel?.text!)! as Any))
        
        if button.titleLabel?.text! == "Option 1" {
            print("hey you are here")
            button.setTitle("you tap this", for: .normal)
        }
            
            //             2 way:- give tag first then direct access
        else if button.tag == 1 {
            
            button.setTitle("you tap this", for: .normal)
            
        }
        else if button.tag == 2 {
            
            button.setTitle("you tap this", for: .normal)
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        subViewPageController.currentPage = Int(page)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

