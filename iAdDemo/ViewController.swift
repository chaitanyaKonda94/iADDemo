//
//  ViewController.swift
//  iAdDemo
//
//  Created by SMSCountry Networks Pvt. Ltd on 14/11/18.
//  Copyright © 2018 SMSCountry Network Pvt.Ltd. All rights reserved.
//

import UIKit
//import iAd
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    lazy var adBannerView: GADBannerView = {
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adBannerView.adUnitID = "ca-app-pub-8501671653071605/1974659335"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        return adBannerView
    }()
    
    var interstitial: GADInterstitial?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request a Google Ad
        adBannerView.load(GADRequest())
        
        // Display the intertitial ad
        interstitial = createAndLoadInterstitial()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return 4
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return adBannerView
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return adBannerView.frame.height
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        // Configure the cell...
        if indexPath.row == 0 {
         //   cell.postImageView.image = UIImage(named: "red-lights-lisbon")
            cell.postTitle.text = "Red Lights, Lisbon"
//            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
//            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else if indexPath.row == 1 {
//            cell.postImageView.image = UIImage(named: "val-throrens-france")
            cell.postTitle.text = "Val Thorens, France"
//            cell.postAuthor.text = "BARA ART (bara-art.com)"
//            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else if indexPath.row == 2 {
//            cell.postImageView.image = UIImage(named: "summer-beach-huts")
            cell.postTitle.text = "Summer Beach Huts, England"
//            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
//            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        } else {
 //           cell.postImageView.image = UIImage(named: "taxis-nyc")
            cell.postTitle.text = "Taxis, NYC"
//            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
//            cell.authorImageView.image = UIImage(named: "appcoda-fav-logo")
            
        }
        
        return cell
    }
    
    // MARK: - GADBannerViewDelegate methods
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView!) {
        print("Banner loaded successfully")
        
        // Reposition the banner ad to create a slide down effect
        let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
        bannerView.transform = translateTransform
        
        UIView.animate(withDuration: 0.5) {
            bannerView.transform = CGAffineTransform.identity
        }
        
        //        UIView.animate(withDuration: 0.5) {
        //            self.tableView.tableHeaderView?.frame = bannerView.frame
        //            bannerView.transform = CGAffineTransform.identity
        //            self.tableView.tableHeaderView = bannerView
        //        }
        
    }
    
    func adView(_ bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("Fail to receive ads")
        print(error)
        
    }
    
    // MARK: - Help methods
    
    private func createAndLoadInterstitial() -> GADInterstitial? {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8501671653071605/2568258533")
        
        guard let interstitial = interstitial else {
            return nil
        }
        
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
        interstitial.delegate = self
        
        return interstitial
    }
    
    // MARK: - GADInterstitialDelegate methods
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial!) {
        print("Interstitial loaded successfully")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial!) {
        print("Fail to receive interstitial")
    }
    
//    lazy var adBannerView: GADBannerView = {
//        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
//        adBannerView.adUnitID = "ca-app-pub-5867010529578069~5702709122"
//        adBannerView.delegate = self
//        adBannerView.rootViewController = self
//
//        return adBannerView
//    }()
//
//    var interstitial: GADInterstitial?
//
// //   @IBOutlet weak var bannerView: GADBannerView!
//
////     var bannerView: GADBannerView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//       // Banner.isHidden=true
////
////        // In this case, we instantiate the banner with desired ad size.
////        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
////
////        bannerView.adUnitID = "ca-app-pub-5867010529578069~5702709122"
////        bannerView.rootViewController = self
////        bannerView.load(GADRequest())
////        bannerView.delegate = self
//
////
////        addBannerViewToView(bannerView)
////
////        bannerView.adUnitID = "ca-app-pub-5867010529578069~5702709122"
////        bannerView.rootViewController = self
////          bannerView.load(GADRequest())
////         bannerView.delegate = self
//
//        // Request a Google Ad
//        adBannerView.load(GADRequest())
//
//
//        // Display the intertitial ad
//        interstitial = createAndLoadInterstitial()
//
//    }
//
//
//    // MARK: - GADBannerViewDelegate methods
//
//    func adViewDidReceiveAd(_ bannerView: GADBannerView!) {
//        print("Banner loaded successfully")
//
//        // Reposition the banner ad to create a slide down effect
//        let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
//        bannerView.transform = translateTransform
//
//        UIView.animate(withDuration: 0.5) {
//            bannerView.transform = CGAffineTransform.identity
//        }
//
//        //        UIView.animate(withDuration: 0.5) {
//        //            self.tableView.tableHeaderView?.frame = bannerView.frame
//        //            bannerView.transform = CGAffineTransform.identity
//        //            self.tableView.tableHeaderView = bannerView
//        //        }
//
//    }
//
//    func adView(_ bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
//        print("Fail to receive ads")
//        print(error)
//
//    }
//
//    // MARK: - Help methods
//
//    private func createAndLoadInterstitial() -> GADInterstitial? {
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8501671653071605/2568258533")
//
//        guard let interstitial = interstitial else {
//            return nil
//        }
//
//        let request = GADRequest()
//        request.testDevices = [ kGADSimulatorID ]
//        interstitial.load(request)
//        interstitial.delegate = self
//
//        return interstitial
//    }
//
//    // MARK: - GADInterstitialDelegate methods
//
//    func interstitialDidReceiveAd(_ ad: GADInterstitial!) {
//        print("Interstitial loaded successfully")
//        ad.present(fromRootViewController: self)
//    }
//
//    func interstitialDidFail(toPresentScreen ad: GADInterstitial!) {
//        print("Fail to receive interstitial")
//    }
//
//
//    // MARK: - Table view data source
//
//     func numberOfSections(in tableView: UITableView) -> Int {
//        // Return the number of sections
//        return 1
//    }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the number of rows
//        return 4
//    }
//
//     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return adBannerView
//    }
//
//     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//        return 50
//    }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
//
//        // Configure the cell...
//        if indexPath.row == 0 {
//           // cell.postImageView.image = UIImage(named: "red-lights-lisbon")
//            cell.postTitle.text = "Red Lights, Lisbon"
//
//
//        } else if indexPath.row == 1 {
//         //   cell.postImageView.image = UIImage(named: "val-throrens-france")
//            cell.postTitle.text = "Val Thorens, France"
//
//
//        } else if indexPath.row == 2 {
//         //   cell.postImageView.image = UIImage(named: "summer-beach-huts")
//            cell.postTitle.text = "Summer Beach Huts, England"
//
//        } else {
//         //   cell.postImageView.image = UIImage(named: "taxis-nyc")
//            cell.postTitle.text = "Taxis, NYC"
//
//
//        }
//
//        return cell
//    }
//
//
//
    
    
//    func addBannerViewToView(_ bannerView: GADBannerView) {
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bannerView)
//        view.addConstraints(
//            [NSLayoutConstraint(item: bannerView,
//                                attribute: .bottom,
//                                relatedBy: .equal,
//                                toItem: bottomLayoutGuide,
//                                attribute: .top,
//                                multiplier: 1,
//                                constant: 0),
//             NSLayoutConstraint(item: bannerView,
//                                attribute: .centerX,
//                                relatedBy: .equal,
//                                toItem: view,
//                                attribute: .centerX,
//                                multiplier: 1,
//                                constant: 0)
//            ])
//
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bannerView)
//        if #available(iOS 11.0, *) {
//            // In iOS 11, we need to constrain the view to the safe area.
//            positionBannerViewFullWidthAtBottomOfSafeArea(bannerView)
//        }
//        else {
//            // In lower iOS versions, safe area is not available so we use
//            // bottom layout guide and view edges.
//            positionBannerViewFullWidthAtBottomOfView(bannerView)
//        }
//    }
//
//
//    /// Tells the delegate an ad request loaded an ad.
//    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
//        print("adViewDidReceiveAd")
//        // Add banner to view and add constraints as above.
//        addBannerViewToView(bannerView)
//        bannerView.alpha = 0
//        UIView.animate(withDuration: 1, animations: {
//            bannerView.alpha = 1
//        })
//    }
//
//    /// Tells the delegate an ad request failed.
//    func adView(_ bannerView: GADBannerView,
//                didFailToReceiveAdWithError error: GADRequestError) {
//        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
//    }
//
//    /// Tells the delegate that a full-screen view will be presented in response
//    /// to the user clicking on an ad.
//    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
//        print("adViewWillPresentScreen")
//    }
//
//    /// Tells the delegate that the full-screen view will be dismissed.
//    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
//        print("adViewWillDismissScreen")
//    }
//
//    /// Tells the delegate that the full-screen view has been dismissed.
//    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
//        print("adViewDidDismissScreen")
//    }
//
//    /// Tells the delegate that a user click will open another app (such as
//    /// the App Store), backgrounding the current app.
//    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
//        print("adViewWillLeaveApplication")
//    }
//
//
//
//    // MARK: - view positioning
//    @available (iOS 11, *)
//    func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView) {
//        // Position the banner. Stick it to the bottom of the Safe Area.
//        // Make it constrained to the edges of the safe area.
//        let guide = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
//            guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
//            guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
//            ])
//    }
//
//    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
//        view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                              attribute: .leading,
//                                              relatedBy: .equal,
//                                              toItem: view,
//                                              attribute: .leading,
//                                              multiplier: 1,
//                                              constant: 0))
//        view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                              attribute: .trailing,
//                                              relatedBy: .equal,
//                                              toItem: view,
//                                              attribute: .trailing,
//                                              multiplier: 1,
//                                              constant: 0))
//        view.addConstraint(NSLayoutConstraint(item: bannerView,
//                                              attribute: .bottom,
//                                              relatedBy: .equal,
//                                              toItem: bottomLayoutGuide,
//                                              attribute: .top,
//                                              multiplier: 1,
//                                              constant: 0))
//    }

//    private func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
//
//        Banner.isHidden = false
//
//    }
//
//    func bannerViewDidLoadAd(banner: ADBannerView!) {
//
//        Banner.isHidden=false
//
//    }
//
//    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
//
//        return true
//
//    }
    
   
}

