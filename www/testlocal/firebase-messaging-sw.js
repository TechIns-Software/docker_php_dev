importScripts("https://172.161.10.2/dist/firebase-messaging-sw.js");

const firebaseConfig = {
    apiKey: "AIzaSyAX__6udYHxrNuqFZfES_ZszobrF3PVUZY",
    authDomain: "testproject-f9304.firebaseapp.com",
    projectId: "testproject-f9304",
    storageBucket: "testproject-f9304.appspot.com",
    messagingSenderId: "1032769586386",
    appId: "1:1032769586386:web:ee4867982d4adac4d6990b",
    measurementId: "G-QL0YWYPC3J"
};

self.initServiceWorker(firebaseConfig);