## What I learned from this project❗️

👉 이번 프로젝트에서는 CoreAnimation 에 대해 공부했다. 간단히 정리해보면 애니메이션을 실제로 드로잉하는게 아니라 그래픽하드웨어에서 비트맵형태로 작업하여서 메인스레드에서 CPU를 잡아먹지않아서 효율적이라는 것이다. 그리고 좀 더 단순하다고 생각함.  
 이 프레임워크에는 핵심 layer , CALayer 가 있는데 이 CALayer 는 화면에 표시하는 정보와 위치 크기 변형 등과 같은 정보도 가지고있다. 이를 통해서 나는 mask 될 레이어를 구현했다.  

   ✨[*CoreAnimation : 블로그에 좀 더 자세히 정리한 링크*](https://seoyoung612.tistory.com/191)

 <br>

~~~swift
            twittermask = CALayer()
            twittermask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            twittermask!.contents = UIImage(named: "twitterBird")?.cgImage
            twittermask!.position = window.center
            
            imageView!.layer.mask = twittermask
~~~

이 때 이미지를 담을 때 layer.contents 로 넣어주는데 UIImage 가 아니라 CGImage 형태로 넣어줘야한다. 우리가 만든 CALayer 형태의 twittermask 는 아까 말한 것 처럼 비트맵으로 처리되어 작동하는 레이어여서 CoreGraphics 로 바꾸어야하기에 cgImage 처리를 해주어야한다.


<br>

이런식으로 만들어서 마스크를 적용한 다음에 애니메이션을 추가해주는 부분에서 애니메이션이 연속적으로 일어나야하는 경우,

~~~swift
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    UIView.animate(withDuration: 5,
                   delay: 0,
                   options: .curveEaseInOut,
                   animations: { [weak self] in
                            self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
                            },
                   completion: {[weak self]_ in
                              self?.twittermask!.bounds = CGRect(x: 0, y: 0, width: 3000, height: 3000)
                              self?.imageView?.mask = nil
                  })
            }
~~~

위 경우보다 더 심한 경우에는,, completion 에 다시 애니메이선을 넣고 그 애니메이션에 다시 completion 에 애니메이션을 넣고 하면서 복잡하고 기괴한 코드가 됨. 그래서 이럴 때
animateKeyFrames 를 사용하는데 나는 지금 CoreAnimation 으로 처리해줄 것이기 때문에 CAKeyFrameAnimation 으로 구현했다.

<br>

위 코드를 이렇게 보기 좋게 구현할 수 있다.

~~~swift
let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1.3       
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5        
     
        let initalBounds = twittermask!.bounds
        let secondBounds = CGRect(x: 0, y: 0, width: 80, height: 64)
        let finalBounds = CGRect(x: 0, y: 0, width: 3000, height: 3000)
        keyFrameAnimation.values = [initalBounds,secondBounds, finalBounds]
        
        keyFrameAnimation.keyTimes = [0,0.3, 1]

        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut), CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        twittermask!.add(keyFrameAnimation, forKey: "bounds")
~~~

**공식문서를 보고 이해한 것 + 모르는 내용은 감으로.. 이해한 것을 바탕으로 짠 코드에 대한 간략한 정리**  
duration : 애니메이션 수행 전체 시간  
beginTime : 시작시간처리  
values : 각 프로퍼티 변경 값에 대한 정보를 담아서 적용시킴  
keyTimes : 각 키들의 애니메이션 수행 시간   
timingFunctions : 기존에 만들어진 timeFunction 을 사용해도되고 custom 해서 적용도 가능한 것 같다.   

**틀린 내용이 분명히 있을겁니다.. ㅠㅠ ~~정확히는 모르겠다 좀 더 찾아봐야할듯하다~~

아무튼 애니메이션은 생각보다 어렵다.. 더 공부해야할 것 같다❗️