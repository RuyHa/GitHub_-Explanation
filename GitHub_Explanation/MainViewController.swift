//
//  ViewController.swift
//  GitHub_Explanation
//
//  Created by Ruyha on 2023/04/16.
//

import UIKit

class MainViewController: UIViewController {
    
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "appleBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Clue_Sample_APP"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    let kakaoButton: SnsLoginButton = {
        let button = SnsLoginButton(loginType: .kakako)
        return button
    }()
    
    let naverButton: SnsLoginButton = {
        let button = SnsLoginButton(loginType: .naver)
        return button
    }()
    
    let googleButton: SnsLoginButton = {
        let button = SnsLoginButton(loginType: .google)
        return button
    }()
    
    let appleButton: SnsLoginButton = {
        let button = SnsLoginButton(loginType: .apple)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#CBB9A8")
        setLayout()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
}

extension MainViewController {
    
    func setLayout(){
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(kakaoButton)
        view.addSubview(naverButton)
        view.addSubview(googleButton)
        view.addSubview(appleButton)
        
        backgroundImageView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        appleButton.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        googleButton.snp.makeConstraints{
            $0.leading.trailing.equalTo(appleButton)
            $0.bottom.equalTo(appleButton.snp.top).offset(-10)
        }
        
        naverButton.snp.makeConstraints{
            $0.leading.trailing.equalTo(appleButton)
            $0.bottom.equalTo(googleButton.snp.top).offset(-10)
        }
        
        kakaoButton.snp.makeConstraints{
            $0.leading.trailing.equalTo(appleButton)
            $0.bottom.equalTo(naverButton.snp.top).offset(-10)
        }
    }
}
