//
//  MasterViewController.swift
//  Toast Alert Samples
//
//  Created by Eduardo Irias on 6/28/18.
//  Copyright © 2018 Estamp. All rights reserved.
//

import UIKit
import Toast_Alerts

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

//    var vcToastAlertView = ToastAlertView()

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
                                
//                let toastAlertView =  ToastAlertView(message: "Added to Library!", image: #imageLiteral(resourceName: "CatIcon"))
//                toastAlertView.show()
//
            default:
                break
            }
        }
        
    }

    @objc
    func hideAlert() {
        //vcToastAlertView.dismiss()
    }
}

