<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDxr-fHFb86-QjwCmCDvkkROe99JBG0fb4",
    authDomain: "bangappp-3f9ec.firebaseapp.com",
    databaseURL: "https://bangappp-3f9ec-default-rtdb.firebaseio.com",
    projectId: "bangappp-3f9ec",
    storageBucket: "bangappp-3f9ec.appspot.com",
    messagingSenderId: "515952068275",
    appId: "1:515952068275:web:5a5f70d0676a17505c12c6",
    measurementId: "G-B31BSVDL0M"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>