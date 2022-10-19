//
//  LoginViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    var delegate: LoginDelegate?
    var viewModel: UsersViewModel!
    lazy var scrollView = UIScrollView()
    lazy var containerView = UIView()
    lazy var errorLabel = UILabel()
    lazy var emailTextField = UITextField()
    lazy var usernameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var signUpButton =  UIButton()
    lazy var loginButton = UIButton()
    
    deinit {
        removeListener()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UsersViewModel(forSignUp: false)
        setupSignUpViewModelBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addListener()
    }
    
    override func loadView() {
        super.loadView()
        title = L10n.login
        setupNavView()
        setBackgroud()
        setupViews()
    }
    
    @objc func handleSwitchView() {
        delegate?.redirectToSignUp()
    }
    
    func setupViews() {
        setupScrollView()
        setupContainterView()
        setupTextFields()
        setupButtons()
    }
    
    func addListener() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardActivity(_:)), name: UIResponder.keyboardWillShowNotification , object:nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardActivity(_:)), name: UIResponder.keyboardWillHideNotification , object:nil)
    }
    
    func removeListener() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardActivity(_ notification: NSNotification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
}
