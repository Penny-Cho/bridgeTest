import React from 'react';
import {Text, View, Button, NativeModules} from 'react-native';

const {RNHello} = NativeModules;

const App = () => {
  //단순 값 전달
  const addEvent = ({name = 'birthdayparty', location = 'my house'}) => {
    RNHello.addEvent(name, location);
  };

  //callback으로 답 불러오기
  const findEvent = () => {
    RNHello.findEvents(resp => {
      alert(resp);
    });
  };

  //object (objC에서는 NSDictionary) 형태로 값 전달
  const doTask2 = ({name = 'pen', email = 'what'}) => {
    //send objects to ios
    RNHello.doTask2(`userInfo`, {
      name,
      email,
    });
  };

  //callback으로 object 불러오기
  const getAllTasks = () => {
    //callback with objects defined in ios
    RNHello.getAllTasks((error, tasks) => {
      if (error) {
        alert(`error: ${JSON.stringify(error)}`);
      } else {
        alert(`tasks: ${JSON.stringify(tasks)}`);
      }
    });
  };

  //promise로 array 핸들링
  const getSomeTasksPromise = () => {
    //use promise
    RNHello.getSomeTasks('all')
      .then(tasks => {
        //resolve
        alert(`getSomeTasks: ${JSON.stringify(tasks)}`);
      })
      .catch(error => {
        //reject
        alert(
          `Error code: ${error.code}, userInfo: ${JSON.stringify(
            error.userInfo,
          )}`,
        );
      });
  };

  //async로 array handling
  const getSomeTasksAsync = async () => {
    try {
      let tasks = await RNHello.getSomeTasks('all');
      alert(`getSomeTasks: ${JSON.stringify(tasks)}`);
    } catch (error) {
      alert(
        `Error code: ${error.code}, userInfo: ${JSON.stringify(
          error.userInfo,
        )}`,
      );
    }
  };

  return (
    <View style={{paddingTop: 50}}>
      <Text>hello</Text>
      <Button title="hello" onPress={findEvent} />
    </View>
  );
};

export default App;
