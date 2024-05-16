const firebaseConfig = {
    apiKey: "AIzaSyAX__6udYHxrNuqFZfES_ZszobrF3PVUZY",
    authDomain: "testproject-f9304.firebaseapp.com",
    projectId: "testproject-f9304",
    storageBucket: "testproject-f9304.appspot.com",
    messagingSenderId: "1032769586386",
    appId: "1:1032769586386:web:8ec9f6b7515cedd4d6990b",
    measurementId: "G-HPQ1XEEV04"
};

const vapidKey = "BABCEIwVE0n40VSzoLQ8dpudZig_NBM6C87v1dkJP-qLpTcZJkICLNQLGGTJ2FLJHMgJIEPqQzqXnd8cYZY0b5o";

// Initialize Firebase  
const wokerUrl = './firebase-messaging-sw.js';

pushNotificationInit(firebaseConfig,vapidKey,"",wokerUrl,true)
