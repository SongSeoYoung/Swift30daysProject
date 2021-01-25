## What I learned from this project❗️

👉  ```UIPageController``` 를 이용해서 스크롤뷰를 구현했다. 아무래도 이번 프로젝트는 Scroll 에 대한 이해가 우선인 것 같긴 했지만! 최근 동아리에서 배운 내용 중 이렇게 화면을 옆으로 넘기는 전환형을 사용할 때 ```collectionView```, ```SCrollView```, ```pageController```  중 ```bounds``` 계산 없이 할 수 있는 ```pageController``` 를 사용한 뷰 만들기를 연습해본 경험이 있어서 이를 응용함.  
<br>

확실하진않지만 ```pageController``` 는 ```containerViewController ```인 것 같다는 생각이 들었다. ```navigationController```, ```TabBarController``` 와 마찬가지로 여러개의 ```ViewController``` 를 관리한다는 느낌을 받음. 

<br>

이런 ```pageViewController``` 를 넣기 위해서 ```containerView``` 를 사용해주었다. 더 좋은 방법이 있을 수도 있는데 ```navigationViewController``` 안에 ```pageViewController``` 를 스토리보드에서 넣는 방법을 모르겠더라ㅠㅠ 그래서 어쩔 수 없이 전체화면을 ```containerView``` 로 잡아주었다. 그렇게 페이징 구현!

<br>

#

<br>

그리고 또 배운 내용은 ```Pinch gesture``` 부분인데, 나는 이번 프로젝트에서 최소 ```pinchSCale``` 값을 지정해주고싶었고, 그래서 아래와 같은 방법을 사용했다.

```swift
    @IBAction func pinchAction(_ sender: Any) {
        //pinch 된 이미지 크기
        let newWidth = pinchGesture.scale * self.pinchPhoto.frame.width
        let newHeight = pinchGesture.scale * self.pinchPhoto.frame.height
        
        guard let originWidth = self.firstWidth,
              let originHeight = self.firstHeight else { return }
        //최소사이즈 설정
        if (newWidth < originWidth) && (newHeight < originHeight) {
            print("minumum")
            pinchPhoto.frame.size = CGSize(width: originWidth, height: originHeight)
            pinchGesture.scale = 1.0
        }
        pinchPhoto.transform = pinchPhoto.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1.0
    }
```

이런 식으로 본래 이미지 사이즈보다 핀치해서 만들어지 사이즈가 더 작은 경우 아무런 변화가 일어나지않도록 지정해주는 조건문을 만들어주었다.  
