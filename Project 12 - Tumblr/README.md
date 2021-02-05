## What I learned from this project❗️

👉 ~~ㅇㅘ우.. 혼자 힘으로 클론하는데 오래걸렸지만,, 그만큼 배운 점이 많았다. 차근차근 정리해보면~~  
`UIViewControllerAnimatedTransitioning` 을 처음써봤다. **Viewcontroller 사이에서의 화면 전환을 할 때 사용하는 프로토콜이다.** 애니메이션 객체를 먼저 만들어주고, delegate 패턴을 사용해서 구현하는 것이다. 

<br>

`UIViewControllerAnimatedTransitioning` 의 필수 메서드는 총 2가지인데, 

```swift

//transition duration 을 정해주는 메서드
func transitionDuration(using: UIViewControllerContextTransitioning?) -> TimeInterval

//transition 애니메이션을 정의해주는 메서드
func animateTransition(using: UIViewControllerContextTransitioning)

```

이 두 곳에서 정의해주면된다. transition 애니메이션은 from -> to 의 형식으로 구현되고 `.from`인지  `.to` 처리해주어서 각 view 를 받아오고 해당 뷰에 대한 속성을 변경해서 애니메이션을 처리해준다. 

<br>

<br>


그리고! 애니메이션이 실행되어야하는 ViewController 에서 present, dismiss 모두 처리해주는 `UIViewControllerTransitioningDelegate` 를 채택한다.   

해당 delegate 는 필수 구현 메서드는 없고 transition, interactive 등에 따라서 메서드 구현해주면되는 것 같다.  

~~~swift
//presenting method
func animationController(forPresented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?

//dismiss method
func animationController(forDismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
~~~

<br>


이런 식으로 transition 애니메이션을 구현해주면되는 것 같다. 이 로직을 이해하는데 좀 어려웠는데.. 삽질 해보니까 이제 정확히 알겟다^^ 🤨 역시 삽질 최고의 공부법~~

<br>
<br>


👉 또 이번 애니메이션 처리에서 튕김? 효과가 필요했다. 그 동안은 그저 옵션들을 이용해서만 애니메이션 처리해주었는데 dumping? 효과는 제대로 써본게 처음이라 약간 정리해보면,

### **usingSpringWithDamping**  
얼마나 튕김 효과를 줄 것인지 0~1 까지의 값으로 구성되어있고 0에 가까울 수록 더 튕김

### **initialSpringVelocity**
이 효과의 시작 스프링속도를 조절해주는 것으로 0~1사이의 값으로 구성되어있으며 0에 가까울 수록 더 빠른 스프링속도

<br>

**자세한 내용은 블로그에 정리해서 올리겠다😆**