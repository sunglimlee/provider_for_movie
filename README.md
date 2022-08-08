

// Provider 를 사용하는 부분
1. 3 군데를 넣어주면 된다. 
2. Consumer 객체를 만든다는 개념은? 


// 처음에 필요한것이 로직과 스크린부분 
지금 프로바이더를 이용해서 작업을 하려고한다. 
프로바이더를 이용하기 위해서는 NotifyChanage 를 상속받아서 구현해야 한다. 
뭘 구현할 건데? 값을 변경할거라는 거지.. (변수가 필요하고)
당연히 getter 와 외부노출 함수가 필요한거지..
데이터 클래스는 지금 필요가 없지..
이 NotifyChange 의 기능은 뭐지? 이 기능을 알아야 이름을 제대로 만들 수 있잖아.. 
값을 증가시켜 주는 기능이지 그리고 그 값을 알아오는 기능이고.. 모든건 값을 기준으로 돌아가는거지..
그러면 이름을 (CounterNotifyChange) 라고 사용하면 되네..

이걸 사용하기 위한 스크린의 이름은 뭐라고 할래? myhomepage_using_notifychangeprovider.dart





# provider_for_movie

Providers with Movie List

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
