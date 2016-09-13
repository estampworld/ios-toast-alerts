//
//  MasterViewController.swift
//  Toast Alert Samples
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [
        ["title" : "Toast with Message & Image", "detail" : "Toast with message and image. Dismiss with tap or time."],
        ["title" : "Toast with Message & Image Animation", "detail" : "Toast with message and 1 image animation loop. Dismiss with tap or time."],
        ["title" : "Toast with Message & Image Animation Repeat", "detail" : "Toast with message and image animation loop. Dismiss with tap or time."],
        ["title" : "Toast with Time Dissmis", "detail" : "Toast hides with Time only"],
        ["title" : "Toast with Tap Dissmis", "detail" : "Toast hides with Tap only"],
        ["title" : "Toast Custom", "detail" : "Toast with manual dismis"]]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    var ta : ToastAlertView! = ToastAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let object = objects[(indexPath as NSIndexPath).row]
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object["detail"] as AnyObject?
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 

        let object = objects[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = object["title"]!
        cell.detailTextLabel!.text = object["detail"]!
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
            

            switch (indexPath as NSIndexPath).row {
            case 0:
                
                //self.showToastAlert("Hey!", image: UIImage(named: "Cat Icon")!)
                let tav =  ToastAlertView(message: "Hey!", image: UIImage(named: "Cat Icon")!)
                tav?.show()
                
                break;
            case 1:
                
                
                
                let images = [ UIImage(named: "item4")!, UIImage(named: "item3")!, UIImage(named: "item2")!, UIImage(named: "item1")!,UIImage(named: "item0")! ]
                self.showToastAlert("Single Animation", images: images, frameDuration: 0.1, repeatAnimation: false, hideWithTap: true, hideWithTime: true, hideTime: 5.0)
                
                break;
            case 2:
                
                let images = [UIImage(named: "item0")!, UIImage(named: "item1")!, UIImage(named: "item2")!, UIImage(named: "item3")!,UIImage(named: "item4")!, UIImage(named: "item4")!, UIImage(named: "item3")!, UIImage(named: "item2")!, UIImage(named: "item1")!,UIImage(named: "item0")! ]
                
                self.showToastAlert("Repeating", images: images, frameDuration: 0.1, repeatAnimation: true, hideWithTap: true, hideWithTime: true, hideTime: 5.0)
                
                //let tav =  ToastAlertView(message: "Repeating", images: images, hideWithTap: true, hideWithTime: true, hideTime: 2.0)
                //tav.show()
                
                break;

            case 3:
                
                //self.showToastAlert("5 Seconds", image: UIImage(named: "item0")!, hideWithTap: false, hideWithTime: true, hideTime: 5.0)
                let tav =  ToastAlertView(message: "5 Seconds!", image: UIImage(named: "item0")! , hideWithTap: false, hideWithTime: true, hideTime: 5.0)
                tav?.show()
                
                break;
            case 4:
                
                //self.showToastAlert("Tap", image: UIImage(named: "item0")!, hideWithTap: true, hideWithTime: false, hideTime: 5.0)
                let tav =  ToastAlertView(message: "Tap", image: UIImage(named: "item0")! , hideWithTap: true, hideWithTime: false, hideTime: 0.0)
                tav?.show()
                
                break;
            case 5:
                
                ta = ToastAlertView(message: "Custom", image: UIImage(named: "Cat Icon")!)
                ta.shouldDismissWithTap = false
                ta.shouldDismissWithTime = false
                ta.show()
                
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MasterViewController.hideAlert), userInfo: nil, repeats: false)
                
                break;
            default:
                break;
            }
           
        }
        
    }
    
    func hideAlert() {
        ta.dismiss()
    }

}

