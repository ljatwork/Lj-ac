//
//  SettingsViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/1/20.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    var delegate: LogoutDelegate?
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    func setupView() {
        setupNavView()
        setBackgroud()
        setupTableView()
    }
    
    func setupTableView() {
        title = L10n.logout
        
        // - tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(SettingsCell.self, forCellReuseIdentifier: String(describing: SettingsCell.self))
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsCell.self), for: indexPath) as! SettingsCell
        cell.titleLabel.text = L10n.logout
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resetDefaults()
        delegate?.redirectToLogin()
    }
}

class SettingsCell: UITableViewCell {
    var titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupItemsView()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItemsView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = ACUtils.defaultAppFont()
        titleLabel.backgroundColor = .clear
        addSubview(titleLabel)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
    }
}
