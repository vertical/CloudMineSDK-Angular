# angular-cloudmine

AngularJS wrapper for [CloudMine JS](cloudmine.me).

# Installation
You can install angular-cloudmine into your AngularJS application in a few ways.
* Via npm: `npm install angular-cloudmine --save`
* Directly from [Github](https://github.com/cloudmine/angular-cloudmine) (this is best for local development)

# Usage
Include angular-cloudmine.js in your application:
`<script src="node_modules/angular-cloudmine/dist/angular-cloudmine.js"></script>`

Add the module `angularCloudmine` as a dependency to your app module:
`angular.module('ngCloudmineTestApp', ['angularCloudmine'])`

The `AngularCloudmine` service is now exposed and can be included as a dependency for your controllers:
`angular.module('ngCloudmineTestApp').controller('MainCtrl', function ($scope, AngularCloudmine) {});`

# Configure and use the WebService
The `AngularCloudmine` service must be configured to interact with the CloudMine JS library. In your controller you can do this:
`
var ws = new cloudmine.WebService({
    appid: appId,
    apikey: apiKey,
    apiroot: apiroot
});
`
You can then make any calls needed to the `AngularCloudmine` service, and they will be proxied through to the CloudMine JS SDK and returned as Angular promises.

`
AngularCloudmine.get().then( function(data) {
    console.log(data);
}).catch( function(err) {
    console.log(err);
});
`
When the promise resolves, the Angular digest cycle will automatically be triggered, updating the current scope.

# Accessing cloudmine() in your javascript
angular-cloudmine also allows you to inject the CloudMine JS SDK into your services, controllers or directives. To do so, simply inject the `cloudmine` variable into the constructor.

# Current Status
`angular-cloudmine` is currently in the early stages of development and should be treated as a beta library.

# Supported endpoints
* api
* get
* update
* set
* destroy
* run
* search
* searchFiles
* searchUsers
* allUsers
* pushNotification
* getUser
* searchGeo
* upload
* download
* createUser
* updateUser
* updateUserMaster
* changePassword
* changeCredentials
* resetPassword
* confirmReset
* login
* loginSocial
* socialQuery
* logout
* verify
* deleteUser
* updateACL
* getACL
