import React, {useState} from 'react';
import {Text, View, NativeModules, NativeEventEmitter} from 'react-native';

const {EventTest} = NativeModules;
const eventTestEventEmitter = new NativeEventEmitter(EventText);

//listen eventB from Objective C
const eventB = () => {
  eventTestEventEmitter.addListener('EventB', event => {
    alert(`EventA data: ${event.name}`);
  });
};

const EventTest = () => {
  const [eventTime, setEventTime] = useState(0);

  //listen eventA from Objective C
  //2초마다 반복 실행하는 이벤트 발생시키기
  eventTestEventEmitter.addListener('EventA', event => {
    alert(`EventA name: ${event.name}, data:${event.data} `);
    setEventTime(eventTime + 1);
  });

  return (
    <View>
      <Text>EventEmitter Test {eventTime}</Text>
    </View>
  );
};

export default EventTest;
