const firebaseConfig = {
    apiKey: "AIzaSyAX__6udYHxrNuqFZfES_ZszobrF3PVUZY",
    authDomain: "testproject-f9304.firebaseapp.com",
    projectId: "testproject-f9304",
    storageBucket: "testproject-f9304.appspot.com",
    messagingSenderId: "1032769586386",
    appId: "1:1032769586386:web:ee4867982d4adac4d6990b",
    measurementId: "G-QL0YWYPC3J"
};
  

const vapidKey = "BABCEIwVE0n40VSzoLQ8dpudZig_NBM6C87v1dkJP-qLpTcZJkICLNQLGGTJ2FLJHMgJIEPqQzqXnd8cYZY0b5o";

// Initialize Firebase  
const wokerUrl = './firebase-messaging-sw.js';

firebaseLib.pushNotificationInit(firebaseConfig,vapidKey,"",wokerUrl,true)
