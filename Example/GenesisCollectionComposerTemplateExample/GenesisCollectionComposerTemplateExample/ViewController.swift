//
//  ViewController.swift
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Internal

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Private

    @IBAction
    private func presentSampleModule(_ sender: Any) {
        navigationController?.pushViewController(SampleRouter.assembleModule(), animated: true)
    }

    @IBAction
    private func presentFetchableSampleModule(_ sender: Any) {
        navigationController?.pushViewController(FetchableSampleRouter.assembleModule(), animated: true)
    }
}
