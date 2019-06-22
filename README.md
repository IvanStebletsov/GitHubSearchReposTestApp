## This project is a test task for the position of Junior iOS developer

<img src="https://github.com/IvanStebletsov/GitHubSearchReposTestApp/blob/master/raw/GitHubSearchReposTestAppReadmePicture.png" align="center">

<div align="center"><a href="https://youtu.be/KTLrXt1kPnI" align = "center">Click for watch an example of application work</a></div>

# Installation
To work with `GitHub GrpahQL API v4` you need `Personal access token` [Get token](https://github.com/settings/tokens/new). Without it, you will receive an alert in the application with the error `401 Unauthorized`

After receiving the token, open `GrpahQLService` in Services folder and change:

```swift
configuration.httpAdditionalHeaders = ["Authorization": "bearer 1d6497df49f2afddedb9a8618d399ad110ce89e6"]
```

with yours `Personal access token` instead `1d6497df49f2afddedb9a8618d399ad110ce89e6`.
