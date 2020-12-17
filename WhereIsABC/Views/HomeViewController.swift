//
//  HomeViewController.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/11/20.
//

import GoogleMobileAds
import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Properties
    
    @IBOutlet weak var button_Play: UIButton!
    @IBOutlet weak var switch_UseZed: UISwitch!
    
    @IBOutlet weak var bannerContainerView: UIView!
    private var bannerView: GADBannerView!
    
    // MARK: - Overrides
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupBannerAd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        SFX.shared.playBGMusic()
        animatePlayButton()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        SFX.shared.stopBGMusic()
    }
    
    private func setupViews() {
        let useZed = AppDefaults.getObjectWithKey(.useZed, type: Bool.self) ?? false
        switch_UseZed.setOn(useZed, animated: false)
    }
    
    private func setupBannerAd() {
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        
        // test ad: "ca-app-pub-3940256099942544/2934735716"
        bannerView.adUnitID = "ca-app-pub-7352177825579783/4388107469"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    private func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerContainerView.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: bannerContainerView.topAnchor),
            bannerView.bottomAnchor.constraint(equalTo: bannerContainerView.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: bannerContainerView.centerXAnchor)
        ])
    }
    
    private func animatePlayButton() {
        button_Play.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        
        UIView.animate(
            withDuration: 10.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 5.0,
            options: .allowUserInteraction,
            animations: {
                self.button_Play.transform = CGAffineTransform.identity
            }) { (complete) in
            if complete {
                self.animatePlayButton()
            }
        }
    }
    
    @IBAction func play(_ sender: Any) {
        let gameController = mainSB.instantiateViewController(identifier: "GameViewController")
            as! GameViewController
        gameController.modalPresentationStyle = .fullScreen
        gameController.modalTransitionStyle = .crossDissolve
        self.present(gameController, animated: true, completion: nil)
    }
    
    @IBAction func useZedSwitchDidChange(_ sender: Any) {
        AppDefaults.store(switch_UseZed.isOn, key: .useZed)
        SFX.shared.stopBGMusic()
        SFX.shared.playQuestionForLetter(.Z)
    }
}

// MARK: - GADBannerViewDelegate

extension HomeViewController: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }
}
