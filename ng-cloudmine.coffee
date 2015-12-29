angular
  .module('angularCloudmine', [])
  .constant('cloudmine', require('cloudmine'))
  .factory('AngularCloudmine', ($q)->
    @ws = null

    cmExports = {
      setWebService: (ws)->
        @ws = ws

      api: (action, options, data)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.api(keys, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise

      get: (keys, options)->
        deferred = $q.defer()
        options = @ws.options if not options
        @ws.get(keys, options).on 'success', (data)->
          deferred.resolve(data)
        .on 'error', (err)->
          deferred.reject(err)

        deferred.promise
    }

    cmExports
  )
