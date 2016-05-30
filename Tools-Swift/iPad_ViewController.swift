//
//  iPad_ViewController.swift
//  Tools-Swift
//
//  Created by liwei on 16/5/30.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class iPad_ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, RecordControllerDelegate {
    
    @IBOutlet weak var masterTableView: UITableView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var contentTextView: UITextView!
    
    struct TableViewConstants {
        struct CellIdentifier {
            static let tableViewCellId = "kMasterTableViewCellId"
        }
    }
    
    var fontSize: CGFloat = 17
    
    
    let  titleArr = ["BlueColor", "BrownColor", "RedColor", "OrangeColor", "A+&Font", "A-&Font", "H-&Font"];
    
    let dataArr = [UIColor.blueColor(), UIColor.brownColor(), UIColor.redColor(), UIColor.orangeColor()];

    override func viewDidLoad() {
        super.viewDidLoad()

        self.masterTableView.delegate = self;
        self.masterTableView.dataSource = self;
        self.masterTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.contentTextView.font = UIFont.systemFontOfSize(fontSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - RecordControllerDelegate
    func tableViewDidSelectedValue(color: UIColor) {
        self.contentTextView.textColor = color
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier:TableViewConstants.CellIdentifier.tableViewCellId)
       
        cell.backgroundColor = UIColor.clearColor()
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.systemFontOfSize(fontSize)
        
        let titleStr =  String(titleArr[indexPath.row])
        let idx = titleStr.endIndex.advancedBy(-5)
        cell.textLabel?.text =  titleStr.substringToIndex(idx)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row < dataArr.count {
            self.contentTextView.textColor = dataArr[indexPath.row]
        }
        if indexPath.row == 4 {
            self.contentTextView.font = UIFont.systemFontOfSize(fontSize+1)
            fontSize = fontSize + 1
        }
        if indexPath.row == 5 {
            self.contentTextView.font = UIFont.systemFontOfSize(fontSize-1)
            fontSize = fontSize - 1
        }
        if indexPath.row == 6 {
            let recordController = storyboard!.instantiateViewControllerWithIdentifier(RecordViewController.RecordConstants.storyboardId) as! RecordViewController
            recordController.delegate = self;
            let navigationController = UINavigationController(rootViewController: recordController)
            navigationController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
            navigationController.modalPresentationStyle = UIModalPresentationStyle.PageSheet
            
            self.presentViewController(navigationController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
