//
//  PageViewController.swift
//  Project 09 - PhotoScroll
//
//  Created by 송서영 on 2021/01/23.
//

import UIKit

class PageViewController: UIPageViewController{

    var number: Int?
    let PhotoList: Photo = Photo()
    private var ViewControllers: [UIViewController]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        for photoIndex in 0..<PhotoList.photoList.count{
            ViewControllers?.append(getViewController(number: photoIndex))
        }
        
        //before & afer 는 datasource protocol 에서 지정해주는데 처음 뷰 컨트롤러는 지정하는게 따로 없ㅇ서 여기서!
        //setViewController 에서 지쩡해줘야함 (우리가 지정한 뷰 컨트롤러들 order 에서 첫 번째 인덱스로 지정
        if let indexNumber = self.number,
           let firstViewController = ViewControllers?[indexNumber] {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    private func getViewController(number : Int) -> UIViewController {
        guard let imageViewController: PhotoDetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoDetailViewController") as? PhotoDetailViewController else {return UIViewController() }
        imageViewController.number = number
        return imageViewController
    }


}

extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //현재 보여주고있는 뷰 컨트롤러의 인덱스를 반환하도록한다.
        guard let currentIndex: Int = ViewControllers?.firstIndex(of: viewController) else { return nil }
        //before 를 보여주려면 하나 전의 것ㅇㄹ 보여줘얗ㅁ
        let beforeIndex: Int = currentIndex - 1
        //하지만 Out of range 를 생각해줘야한다. 그래서 0보다 작은 인덱스면 작동하지않도록. 그리고 orderedViewController 자체가 0개 이상이도록 guard 처리해줌
        guard beforeIndex >= 0, (ViewControllers?.count ?? 0) > 0 else { return nil }
        return ViewControllers?[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //현재 보여주고있는 뷰 컨트롤러의 인덱스를 반환하도록한다.
        guard let currentIndex: Int = ViewControllers?.firstIndex(of: viewController) else { return nil }
        //before 를 보여주려면 하나 전의 것ㅇㄹ 보여줘얗ㅁ
        let afterIndex: Int = currentIndex + 1
        //하지만 Out of range 를 생각해줘야한다. 그래서 0보다 작은 인덱스면 작동하지않도록. 그리고 orderedViewController 자체가 0개 이상이도록 guard 처리해줌
        guard afterIndex < (ViewControllers?.count ?? 0) else { return nil }
        return ViewControllers?[afterIndex]
    }
}
