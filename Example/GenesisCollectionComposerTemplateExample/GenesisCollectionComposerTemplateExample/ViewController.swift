//
//  ViewController.swift
//  GenesisCollectionComposerTemplateExample
//
//  Created by Akira Matsuda on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction
    private func presentSampleModule(_ sender: Any) {
        navigationController?.pushViewController(SampleRouter.assembleModule(), animated: true)
    }
}
