# OddityTest
- Step1: Get User ID (LoginView and LoginViewModel)
Keyboard type: decimal (line 20)
Hide keyboard (line 42)
Enter disabled if user id is empty (line 36)

- Step2, 3, 4: ProfileView and ProfileViewModel
Popup options to "take a photo" or "select a photo" from photo library (ProfileView line 34)
Take a picture or load a image from photo library, Retake or use the image (Profileview line 48, 51)
As soon as load the image to ProfileView, the image is saved in Photo Library (ProfileViewModel line 27)
Upload image to an test endpoint (AWS S3) through REST API (ProfileViewModel line 40)
Bonus: UserId and timestamp are mapped with the photo uploading by using Jwt and multipart encoding data (NetworkManager line 54) (UploadAvatar line 19)
Once succeded uploading image, goes back to root view (ProfileView line 77)
