## What I learned from this project❗️

👉 project2 는 타이머 사용이 핵심이었다. 공부한지 오래되지는 않았지만 그래도 몇 달간 iOS 공부를 하면서 `Timer` 를 사용해 본 적이 없어서 프로젝트를 하기 위해 배워야했다!  
우리가 만드는 타이머의 핵심은 1초단위로 변경되는 것이 아니라 0.01초 마다 숫자가 변해야한다. 그리고 이러한 타이머 2개를 만들고 서로 다르게 작동해야된다는 것이었다.  

<br>

내가 가장 힘들었던 점은 0.01초 간격으로 변하는 숫자를 00:00.00 형식으로 변환해야했던 점이다. 이 부분에서 몇 시간을 날린 것 같다.
```swift  
    if !timer.isValid  {
        play = !play
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCallBack), userInfo: nil, repeats: true)
    }
```
`timeInterval` 기준 자체가 1초 단위이기때문에 0.01초로 주고 해당 타이머의 콜백함수에서 `number` 변수 값을 +=1 식 증가시켰다.  
예를들어, 247의 숫자가 나온다면 이는 2.47초를 의미한다. 247을 어떻게 나누고 쪼개서 2.47로 표현해야할지 고민을 많이했다. 아마 내 머리속의 로직적인 문제가 좀 꼬인 것 같다 😅  
<br>

이 것 외에도 초의 단위가 한 자릿 수 일 경우 어떻게 8초를 08초로 표현해야할지, 서로 다르게 작동해야하는 타이머를 어떻게 구현해야 될지에 대해 고민하는( 항상 보기만 하던 프로퍼티 옵저버 didSet을 실제로 사용해보기도 했다!!!) 좋은 시간이 되었다.  
이 프로젝트를 커밋하고나서 다른 분들의 파일도 확인해보면서 더 좋은 코드를 구현하기 위해 발전하는 사람이 되어야지~

