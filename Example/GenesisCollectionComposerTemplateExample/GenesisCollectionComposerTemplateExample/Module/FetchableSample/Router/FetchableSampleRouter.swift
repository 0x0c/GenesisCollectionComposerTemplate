//
//  FetchableSampleRouter
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2024/10/07.
//

import UIKit

// MARK: - FetchableSampleRouterInput

@MainActor
protocol FetchableSampleRouterInput: AnyObject {
    // MARK: View transitions
}

// MARK: - FetchableSampleRouter

@MainActor
final class FetchableSampleRouter {
    // MARK: Lifecycle

    init(viewController: FetchableSampleViewController) {
        self.viewController = viewController
    }

    // MARK: Internal

    static func assembleModule() -> FetchableSampleViewController {
        let view = FetchableSampleViewController()
        // TODO: Create a Storyboard with the same name as "FetchableSample".
        // TODO: And Change "FetchableSample" of "R.storyboard.FetchableSample" to lowercase.
        // guard let view = R.storyboard.FetchableSample.instantiateInitialViewController() else {
        //     fatalError("Fail to load FetchableSampleViewController from Storyboard.")
        // }
        let interactor = FetchableSampleInteractor()
        let router = FetchableSampleRouter(viewController: view)
        let presenter = FetchableSamplePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter

        return view
    }

    // MARK: Private

    private unowned let viewController: FetchableSampleViewController
}

// MARK: FetchableSampleRouterInput

extension FetchableSampleRouter: FetchableSampleRouterInput {}
