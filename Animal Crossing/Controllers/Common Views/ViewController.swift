//
//  ViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import UIKit
import PubNub

extension UIViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupNavView() {
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font : ACUtils.defaultAppFont(weight: .bold, fontSize: 20)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor(hexString: ColorHex.hex3.rawValue)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationItem.setHidesBackButton(false, animated: true)
   }
    
    func displayLoadingScreen() {
        let alert = UIAlertController(title: nil, message: L10n.pleaseWait, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    // - set app background
    func setBackgroud() {
        let backgroundImge = UIImageView()
        // - image BG
        backgroundImge.image = #imageLiteral(resourceName: "bg")
        backgroundImge.contentMode = .scaleAspectFill
        view.addSubview(backgroundImge)
        backgroundImge.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
