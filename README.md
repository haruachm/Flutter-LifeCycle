# StatefulWidget

![image](https://user-images.githubusercontent.com/85959639/217479994-4753afee-600f-4fdf-9e05-7a3d96a47aaf.png)

## **라이프사이클, 간략한 함수(function) 설명**

### **createState()**

- state object(객체)를 생성
- 해당 객체는 해당 Widget에 대한 모든 변경 가능한 state가 유지되는 곳

### **initState()**

- Stateful Widget이 생성될 때 **'한번'만 호출**되는 함수로 상태(State)를 초기화할 때 사용
- 반드시 super.initState()를 호출

### **didChangeDependencies()**

- initState()와 마찬가지로 Stateful Widget이 생성될 때 호출되는 함수로 initState() 다음에 바로 호출
- build() 는 항상 didChangeDependencies() 다음에 호출
- InheritedWidget이나 Provider를 사용하는 경우, InheritedWidget이나 Provider의 내용이 변경될 때마다 호출
- 부모 위젯이나, 자기 자신의 상태가 변경될 때는 호출되지 않지만, 해당 위젯이 **참조(Depedency)하는 위젯(InheritedWidget이나 Provider)이 변경되면 didChangeDependencies 함수가 호출**

### **build()**

- UI를 구현하는 부분으로 buiild 안에 로직이 많으면 앱의 퍼포먼스가 낮아진다.
- 반드시 존재해야 하며 @override 재정의 대상이고, 반드시 Widget을 반환해야 한다.
- UI위젯을 랜더링 할 때 마다 호출

### **didUpdateWidget**

- 부모 위젯에 의해 rebuild가 필요한 경우, build 함수 호출 직전에 호출
- 부모 위젯의 변경으로 인해 애니메이션을 다시 실행할 필요가 있는 경우에 자주 사용
- 부모 위젯에 변경에 따라 상태값을 초기화할 필요가 있다면, 이 함수안에서 **setState**를 통해 상태값을 다시 초기화

### **deactive**

- 상태(State) 객체가 트리에서 제거될 때 호출하는 함수

### **dispose**

- 위젯 객체가 위젯 트리에서 영구적으로 제거될 때 호출
- 상태 객체도 함께 제거되므로 deactivate 가 먼저 호출되어 상태 객체가 제거되었음을 알리고, 이후 dispose가 호출되어 위젯 객체가 삭제되었음을 알리는데 사용

![image](https://user-images.githubusercontent.com/85959639/217480584-1af5e09b-e1e9-43ce-8bd8-00a0b6afac31.png)

---

</br>
## **StatefulWidget 구조 만들기**

```
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

```
State<HomeScreen> createState() => _HomeScreenState();
```

- StatefulWidget을 사용하려면 2개의 클래스를 구성해야 하는데 하나는 createState가 가능한 class와 State class를 생성해준다. 위에서 보는 바와 같이 2개의 클래스가 있다.
- StatefulWidget에 해당되는 클래스는 외부에서 사용이 되는데, State 같은 경우에는 StatefulWiget에 바인딩이 되어서 내부에서 쓰이기 때문에, ' _ ' 기호를 넣어 private 하게 만들어준다.

```
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

- State 같은 경우에는 State<>와 같이 제너릭을 만들어줘야 하는데, 괄호 안에 바인딩을 할 Stateful Widget 클래스를 넣어주면 된다.

## **StatefulWidget으로 작성된 코드**

```
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  const HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      color: widget.color,
    );
  }
}
```

- State 같은 경우에 값을 받아오기 위해서는 다른 클래스에서 받기 때문에 기존의 방식대로 가져오지 못 하고, State 클래스는 Stateful Widget 클래스를 extends 해오기 때문에, 내부에 widget. 이라는 키워드를 사용해 가져온다.
