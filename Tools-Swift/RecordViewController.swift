//
//  RecordViewController.swift
//  Tools-Swift
//
//  Created by liwei on 16/5/30.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit


@objc protocol RecordControllerDelegate {
    func tableViewDidSelectedValue(color: UIColor)
}

class RecordViewController: UITableViewController {
    
    public weak var delegate: RecordControllerDelegate?
    
    struct RecordConstants {
        static let recordCellId = "kRecordCellId"
        static let storyboardId = "kRecordStoryboardId"
    }
    
    let textColors = [UIColor.Fourormat(), UIColor.FiveHundredPX(),UIColor.AboutMeBlue(), UIColor.AboutMeYellow(),UIColor.Addvocate(),UIColor.Adobe(), UIColor.Aim(),UIColor.Amazon(), UIColor.Android(),UIColor.Asana(), UIColor.Atlassian(),UIColor.Behance(), UIColor.bitly(),UIColor.Blogger(),UIColor.Carbonmade(), UIColor.Cheddar(),UIColor.Fourormat(), UIColor.CocaCola(),UIColor.CodeSchool(), UIColor.Delicious(),UIColor.Dell(), UIColor.Designmoo(),UIColor.Deviantart(),UIColor.DesignerNews(), UIColor.Dewalt(),UIColor.DisqusBlue(), UIColor.DisqusOrange(),UIColor.Dribbble(), UIColor.Dropbox(),UIColor.Drupal(), UIColor.Dunked(),UIColor.eBay(),UIColor.Ember(), UIColor.Engadget(),UIColor.Envato(), UIColor.Etsy(),UIColor.Evernote(), UIColor.Fab(),UIColor.Facebook(), UIColor.Firefox(),UIColor.FlickrBlue(),UIColor.FlickrPink(), UIColor.Forrst(),UIColor.Foursquare(), UIColor.Garmin(),UIColor.GetGlue(), UIColor.Gimmebar(),UIColor.GitHub(), UIColor.GoogleBlue(),UIColor.GoogleGreen(),UIColor.GoogleRed(), UIColor.googleWhite(),UIColor.GoogleYellow(), UIColor.GooglePlus(),UIColor.Grooveshark(), UIColor.Groupon(),UIColor.HackerNews(), UIColor.HelloWallet(),UIColor.HerokuLight(),UIColor.HerokuDark(), UIColor.HootSuite(),UIColor.Houzz(), UIColor.HP(),UIColor.HTML5(), UIColor.Hulu(),UIColor.IBM(), UIColor.IKEA(),UIColor.Instagram(), UIColor.IMDb(),UIColor.Instapaper(),UIColor.Intel(), UIColor.Intuit(),UIColor.Kickstarter(), UIColor.kippt(),UIColor.Kodery(), UIColor.LastFM(),UIColor.LinkedIn(),UIColor.Livestream(), UIColor.Lumo(),UIColor.MakitaRed(), UIColor.MakitaBlue(),UIColor.Mixpanel(), UIColor.Meetup(),UIColor.Netflix(), UIColor.Nokia(),UIColor.NVIDIA(),UIColor.Odnoklassniki(), UIColor.Opera(),UIColor.Path(), UIColor.PayPalDark(),UIColor.PayPalLight(), UIColor.Pinboard(),UIColor.Pinterest(), UIColor.PlayStation(),UIColor.Pocket(),UIColor.Prezi(), UIColor.Pusha(),UIColor.Quora(), UIColor.QuoteFm(),UIColor.Rdio(), UIColor.Readability(),UIColor.RedHat(), UIColor.RedditBlue(),UIColor.RedditOrange(),UIColor.Resource(), UIColor.Rockpack(),UIColor.Roon(), UIColor.RSS(),UIColor.Salesforce(), UIColor.Samsung(),UIColor.Shopify(), UIColor.Skype(),UIColor.SmashingMagazine(),UIColor.Snagajob(), UIColor.Softonic(),UIColor.SoundCloud(), UIColor.SpaceBox(),UIColor.Spotify(), UIColor.Sprint(),UIColor.Squarespace(), UIColor.StackOverflow(),UIColor.Staples(),UIColor.StatusChart(), UIColor.Stripe(),UIColor.StudyBlue(), UIColor.StumbleUpon(),UIColor.TMobile(), UIColor.Technorati(),UIColor.TheNextWeb(), UIColor.Treehouse(),UIColor.Trello(),UIColor.Trulia(), UIColor.Tumblr(),UIColor.TwitchTv(), UIColor.Twitter(),UIColor.Typekit(), UIColor.TYPO3(),UIColor.Ubuntu(), UIColor.Ustream(),UIColor.Verizon(),UIColor.Vimeo(), UIColor.Vine(),UIColor.Virb(), UIColor.VirginMedia(),UIColor.VKontakte(), UIColor.Wooga(),UIColor.WordPressBlue(), UIColor.WordPressOrange(),UIColor.WordPressGrey(),UIColor.Wunderlist(), UIColor.XBOX(),UIColor.XING(), UIColor.Yahoo(),UIColor.Yandex(), UIColor.Yelp(),UIColor.Fourormat(), UIColor.Fourormat(),UIColor.Fourormat(),UIColor.Fourormat(), UIColor.Fourormat(),UIColor.Fourormat(), UIColor.YouTube(),UIColor.Zalongo(), UIColor.Zendesk(),UIColor.Zerply(), UIColor.Zootool()]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(button: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textColors.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier(RecordConstants.recordCellId, forIndexPath: indexPath)
        
        cell.contentView.backgroundColor = textColors[indexPath.row]
        
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = String(indexPath.row + 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.delegate?.tableViewDidSelectedValue(textColors[indexPath.row])
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
