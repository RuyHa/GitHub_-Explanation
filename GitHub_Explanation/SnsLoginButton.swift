//
//  ViewController.swift
//  GitHub_Explanation
//
//  Created by Ruyha on 2023/04/16.
//


import UIKit
import SnapKit

enum SnsmsLoginType {
    case kakako
    case naver
    case google
    case apple
    
    func setTitle () -> String {
        switch self{
        case .kakako :
            return "카카오톡으로 로그인"
        case .naver :
            return "네이버로 로그인"
        case .google :
            return "구글로 로그인"
        case .apple :
            return "Apple로 로그인"
        }
    }
    
    
    func setBackgrondColor () -> UIColor {
        switch self{
        case .kakako :
            return UIColor(hex: "#FEE500")
        case .naver :
            return .white
        case .google :
            return .white
        case .apple :
            return .white
        }
    }
    
    func setIcon () -> UIImage {
        switch self{
        case .kakako :
            return UIImage(named: "snsKakaoIcon") ?? UIImage()
        case .naver :
            return UIImage(named: "snsNaverIcon") ?? UIImage()
        case .google :
            return UIImage(named: "snsGoogleIcon") ?? UIImage()
        case .apple :
            return UIImage(named: "snsAppleIcon") ?? UIImage()
        }
    }
    
}

class SnsLoginButton : UIButton {
    private var loginType: SnsmsLoginType
    
    private lazy var snsImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        return view
    }()
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 46
        return size
    }
    
    required init(loginType: SnsmsLoginType) {
        self.loginType = loginType
        super.init(frame: .zero)
        setupView()
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.setTitle("\(loginType.setTitle())", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.snsImageView.image = loginType.setIcon()
        self.backgroundColor = loginType.setBackgrondColor()
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        self.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        self.layer.cornerRadius = 8
        
    }
    
    func setLayout(){
        self.addSubview(snsImageView)
        snsImageView.snp.makeConstraints{
            $0.height.width.equalTo(22)
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
    }

    @objc func btnClicked (_ sender:UIButton) {

        print("Clue : \(loginType.setTitle())")

    }
    
}
