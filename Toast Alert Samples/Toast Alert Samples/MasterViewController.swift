//
//  MasterViewController.swift
//  Toast Alert Samples
//
//  Created by Eduardo Irias on 6/28/18.
//  Copyright © 2018 Estamp. All rights reserved.
//

import UIKit
import EWToastAlerts

struct Item {
    var title: String
    var detail: String
}
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [
        Item(title: "Toast with Message & Image", detail: "Toast with message and image. Dismiss with tap or time."),
        Item(title: "Toast with Message & Image Animation", detail: "Toast with message and 1 image animation loop. Dismiss with tap or time."),
        Item(title: "Toast with Message & Image Animation Repeat", detail: "Toast with message and image animation loop. Dismiss with tap or time."),
        Item(title: "Toast with Time Dissmis", detail: "Toast hides with Time only"),
        Item(title: "Toast with Tap Dissmis", detail: "Toast hides with Tap only"),
        Item(title: "Toast Custom", detail: "Toast with manual dismis")]

    var vcToastAlertView = EWToastAlertView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
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
                controller.detailItem = object.detail
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

        let object = objects[indexPath.row]
        cell.textLabel!.text = object.title
        cell.detailTextLabel!.text = object.detail

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
            
            
            switch (indexPath as NSIndexPath).row {
            case 0:
                
                //self.showEWToastAlert("Hey!", image: #imageLiteral(resourceName: "CatIcon"))
                
                let toastAlertView =  EWToastAlertView(message: "Hey!", image: #imageLiteral(resourceName: "CatIcon"))
                toastAlertView.show()
                
                break;
            case 1:
                
                
                
                let images = [ UIImage(named: "Item 5")!, UIImage(named: "Item 4")!, UIImage(named: "Item 3")!, UIImage(named: "Item 2")!,UIImage(named: "Item 1")! ]
                self.showEWToastAlert("Single Animation", images: images, frameDuration: 0.1, repeatAnimation: false, hideWithTap: true, hideWithTime: true, hideTime: 5.0)
                
                break;
            case 2:
                
                let images = [UIImage(named: "Item 1")!, UIImage(named: "Item 2")!, UIImage(named: "Item 3")!, UIImage(named: "Item 4")!,UIImage(named: "Item 5")!, UIImage(named: "Item 5")!, UIImage(named: "Item 4")!, UIImage(named: "Item 3")!, UIImage(named: "Item 2")!,UIImage(named: "Item 1")! ]
                
                self.showEWToastAlert("Repeating", images: images, frameDuration: 0.1, repeatAnimation: true, hideWithTap: true, hideWithTime: true, hideTime: 5.0)
                
                //let tav =  EWToastAlertView(message: "Repeating", images: images, hideWithTap: true, hideWithTime: true, hideTime: 2.0)
                //tav.show()
                
                break;
                
            case 3:
                
                //self.showToastAlert("5 Seconds", image: UIImage(named: "Item 1")!, hideWithTap: false, hideWithTime: true, hideTime: 5.0)
                let tav =  EWToastAlertView(message: "5 Seconds!", image: UIImage(named: "Item 1")! , hideWithTap: false, hideWithTime: true, hideTime: 5.0)
                tav.show()
                
                break;
            case 4:
                
                //self.showToastAlert("Tap", image: UIImage(named: "Item 1")!, hideWithTap: true, hideWithTime: false, hideTime: 5.0)
                let tav =  EWToastAlertView(message: "Tap", image: UIImage(named: "Item 1")! , hideWithTap: true, hideWithTime: false, hideTime: 0.0)
                tav.show()
                
                break;
            case 5:
                
                vcToastAlertView = EWToastAlertView(message: "Custom", image: #imageLiteral(resourceName: "CatIcon"))
                vcToastAlertView.shouldDismissWithTap = false
                vcToastAlertView.shouldDismissWithTime = false
                vcToastAlertView.show()
                
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MasterViewController.hideAlert), userInfo: nil, repeats: false)
                
                break;
            default:
                break;
            }
            
        }
        
    }

    @objc
    func hideAlert() {
        vcToastAlertView.dismiss()
    }
}

