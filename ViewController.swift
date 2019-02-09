//
//  ViewController.swift
//  quickEmail
//
//  Created by aoi haru on 2/9/19.
//  Copyright © 2019 aoi haru. All rights reserved.
//

import UIKit
import MessageUI


class ViewController: UIViewController {

    @IBAction func emailButtonTapped(_ sender: SAButton) {
        //this needs to be ran on a device
        showMailComposer()
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["paketpaper@paketpaeper.co"])
        composer.setSubject("HELP!!!")
        composer.setMessageBody("I love you, but...", isHTML: false)
        
        present(composer, animated: true)
        
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        }
        controller.dismiss(animated: true)
    }    
}

