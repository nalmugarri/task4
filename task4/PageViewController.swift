//
//  PageViewController.swift
//  task4
//
//  Created by Noura Khaled on 16/12/2018.
//  Copyright © 2018 Noura Almugarri. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // lazy is called only when the proprty used
    lazy var subViewController:[UIViewController] = {
        return [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController ,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController ,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        ]
    }()
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.lastIndex(of: viewController) ?? 0
        if (currentIndex <= 0){
            return nil
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.lastIndex(of: viewController) ?? 0
        if (currentIndex >= subViewController.count-1){
            return nil
        }
        return subViewController[currentIndex+1]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        // assign data source and delegat self means that all the function are well be implemented withih the class
        
        // to set the view Controller :
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
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
