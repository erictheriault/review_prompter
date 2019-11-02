import Foundation
import StoreKit

class AppReviewPrompter {

    let userDefaults: UserDefaults

    private let actionFrequencyForReview = 3 // Every 3rd action, ask for a review
    private let actionKey = "app_review_action_count"

    private var actionCount: Int {
        set { userDefaults.set(newValue, forKey: actionKey) }
        get { userDefaults.integer(forKey: actionKey) }
    }

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // Call this every time the user completes a relevant action, e.g.,
    // completing a todo
    func recordImportantAction() {
        actionCount += 1
    }

    // Call this when you'd like to request a review if the user has completed
    // an appropriate number of important actions. Refer to Apple's guidelines
    // for best practices: https://developer.apple.com/documentation/storekit/skstorereviewcontroller/requesting_app_store_reviews
    func requestReviewIfNeeded() {
        guard actionCount >= actionFrequencyForReview else { return }

        actionCount = 0

        SKStoreReviewController.requestReview()
    }

}
