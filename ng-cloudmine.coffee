angular
  .module('angularCloudmine', [])
  .constant('cloudmine', require('cloudmine'))
  .factory('AngularCloudmine', ($q)->
    @ws = null

    cmExports = {
      setWebService: (ws)->
        @ws = ws

      api: (action, options, data)->
        $q.when this.ws.api(action, options, data)

      get: (keys)->
        deferred = $q.defer()

        @ws.get(keys, @ws.options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise
    }

    cmExports
  )
