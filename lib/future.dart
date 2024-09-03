dynamic GetUserById() {
  Map<String, dynamic> data = {
    "id": "5",
    "fullName": "string1",
    "email": "string1",
    "roleId": 1,
    "passwordHash":
        "AQAAAAIAAYagAAAAEDJO/Mv6lbhHkAvhMPBpC7UVGphA9Wph2c5I2tZ8r3Iyb+SaYp+/bbpYytKq9EjINg==",
    "image": "/uploads/4f8a7906-3f72-4093-b11e-8e83f8336853.jpg"
  };
  return data;
}

dynamic Login() {
  Map<String, dynamic> data = {
    "message": "Login Successfully",
    "data":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI1IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW4iLCJleHAiOjE3MjU1Mjg0NDMsImlzcyI6ImxvY2FsaG9zdCIsImF1ZCI6ImxvY2FsaG9zdCJ9.9Z56K-x4qTiyIXjgbyRJdfd0QiNADSVdZP7SS2d54k4"
  };
  return data;
}
