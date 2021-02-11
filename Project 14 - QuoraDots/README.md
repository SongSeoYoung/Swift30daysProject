## What I learned from this project❗️

👉 CoreGraphic framework 의 **``` CGAffinetransform``` 구조체로 2D 그래픽을 그릴 때 , 객체회전 크기조정 변환 기울이기에 대해서 조정가능하다.**  

이번에는 연속적으로 일어나는 애니메이션에 대해 처리해줘야하기때문에 CGAffinetransform 을 사용하기도하고 ``` animateKeyframes + addKeyframe```  으로 연속적으로 일어나는 애니메이션을 처리해줌.
크기가 커지고 작아져야해서 scale 조정해주었다.  

<br>

>>✨ **``` animationKeyframes```**  
withDuration : 애니메이션 수행 전체시간  
delay: 시작 딜레이  
options : Animation.options  
animation : 전형적으로 ```addKeyframe``` 메서드를 불러서 실행한다고함  
completion : 완료 이후 실행될 클로저  


<br>

그런데! 내 코드 다 짜고 내가 데모했던 코드를 보니까 나랑 좀 다르게 구현했길래 느낀 점 일부를 정리하고자한다.

~~~swift
    dotOne.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    dotTwo.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    dotThree.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    
    UIView.animate(withDuration: 0.6, delay: 0.0, options: [.repeat, .autoreverse], animations: {
        self.dotOne.transform = CGAffineTransform.identity
    }, completion: nil)
    
    UIView.animate(withDuration: 0.6, delay: 0.2, options: [.repeat, .autoreverse], animations: {
      self.dotTwo.transform = CGAffineTransform.identity
    }, completion: nil)
    
    UIView.animate(withDuration: 0.6, delay: 0.4, options: [.repeat, .autoreverse], animations: {
      self.dotThree.transform = CGAffineTransform.identity
    }, completion: nil)
~~~

위 코드는 0.01의 스케일로 CGAffineTransform 을 처리해두고 애니메이션으로 CGAffineTransform.identity 를 불러서 본래의 dotOne 크기로 변환하도록하는 애니메이션.  
``` identity```  라는 프로퍼티가 본래의 정체성 (초기 설정 값)을 저장하는 프로퍼티 인 것 같다.  
 그리고 나와 다른 점이 하나 더 있는데 나는 completion 에 계속해서 콜백하는 느낌으로 구현했다면 위 코드는 각 애니메이션마다 0.2씩 딜레이를 주면서 따로따로 진행하도록하였다.  

>💡 생각해보면 이 애니메이션이 끝나야! 이게 실행되어야해! 라는 강력한 느낌은 없으니까 **굳이 completion callback 은 필요없을 것 같기도하다는 것을 느낌.**

