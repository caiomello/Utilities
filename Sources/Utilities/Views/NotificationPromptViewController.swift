//
//  NotificationPromptViewController.swift
//
//
//  Created by Caio Mello on 23.03.22.
//

import UIKit

public enum NotificationPromptResponse {
    case accepted
    case denied
}

public final class NotificationPromptViewController: UIViewController {
    @IBOutlet private var textLabel: UILabel! {
        didSet {
            textLabel.text = text
        }
    }

    @IBOutlet private var acceptButton: ActionButton! {
        didSet {
            acceptButton.title = "Enable Notifications"
        }
    }

    private let text: String
    private let completion: (_ response: NotificationPromptResponse) -> Void

    public init?(coder: NSCoder, text: String, completion: @escaping (_ response: NotificationPromptResponse) -> Void) {
        self.text = text
        self.completion = completion
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

// MARK: - Lifecycle

extension NotificationPromptViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        isModalInPresentation = true
        sheetPresentationController?.detents = [.medium()]
        sheetPresentationController?.preferredCornerRadius = 20

        view.directionalLayoutMargins = NSDirectionalEdgeInsets(horizontal: 20, vertical: 20)

        acceptButton.titleColor = view.backgroundColor!
        acceptButton.backgroundColor = view.tintColor
    }
}

// MARK: - Interaction

extension NotificationPromptViewController {
    @IBAction private func acceptButtonAction(_ sender: UIButton) {
        completion(.accepted)
        dismiss(animated: true)
    }

    @IBAction private func denyButtonAction(_ sender: UIButton) {
        completion(.denied)
        dismiss(animated: true)
    }
}
