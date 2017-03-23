//
//  UIAlertController+Blocks.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIAlertController_Blocks
import UIKit

enum UIAlertControllerPreferred {
    case dismiss
    case action
    case none
}

extension UIAlertController {

    // MARK: - Public methods

    static func showAlert(inViewController viewController: UIViewController,
                         withTitle title: String = "",
                         message: String,
                         dismissTitle: String,
                         dismissHandler: @escaping (() -> Void) = {},
                         actionTitle: String = "",
                         actionHandler: @escaping (() -> Void) = {},
                         preferredTitle: UIAlertControllerPreferred = .none) {
        
        let alert = UIAlertController.showAlert(in: viewController,
                                    withTitle: title,
                                    message: message,
                                    cancelButtonTitle: nil,
                                    destructiveButtonTitle: nil,
                                    otherButtonTitles: [dismissTitle, actionTitle],
                                    tap: {(controller, action, buttonIndex) in
                                                        
                                        if (buttonIndex == controller.firstOtherButtonIndex) {
                                            dismissHandler()
                                        } else {
                                            actionHandler()
                                        }
        })
        
        if (preferredTitle != .none) {
            let actions = alert.actions
            alert.preferredAction = (preferredTitle == .dismiss) ? actions[0] : actions[1]
        }
    }
}
