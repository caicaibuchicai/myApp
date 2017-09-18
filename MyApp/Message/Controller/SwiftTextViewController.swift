//
//  SwiftTextViewController.swift
//  MyApp
//
//  Created by TWTD on 2017/5/9.
//  Copyright © 2017年 TWTD. All rights reserved.
//


import UIKit



class SwiftTextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var sdd:UIView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SwiftViewController"
        self.view.backgroundColor = UIColor.red
        
//        self.setheadview()
        self.createtableview()
      
        var m = 10
        var n = 20
        
        
        ( m,n) =     self.provide();
        NSLog("\(m)\(n)")
        
    }

     func setheadview() {
        
        
        let headview = UIView.init(frame: CGRect.init(x: 60, y: 80, width:100, height: 100))
        headview.backgroundColor = UIColor.yellow
        self.view.addSubview(headview)
        
        let imageview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        imageview.image = #imageLiteral(resourceName: "mayun.jpg");
        headview.addSubview(imageview)
        
        
        
    }
    func provide() -> (NSInteger,NSInteger) {
        return (0,0)
    }
    
    
    func createtableview()   {
        let tabview = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        tabview.delegate = self
        tabview.dataSource = self
        self.view.addSubview(tabview)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let initIdentifier = "SwiftCellID"
        let cell = UITableViewCell(style:UITableViewCellStyle.subtitle,reuseIdentifier:initIdentifier)
        cell.textLabel?.text = "1234"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("cell点击了")
        let alterController = UIAlertController(title: "系统提示",
                                                message: "您确定要离开hangge.com吗？", preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alterController.addAction(cancel)
        self.present(alterController, animated: true, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loginVC = MessageViewController()
        loginVC.title = "登录"
        loginVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(loginVC, animated: true)
    }

 

}
